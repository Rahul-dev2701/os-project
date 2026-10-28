import os
import re
from typing import Any, Dict

class ToolValidationError(Exception):
    """Raised when a proposed agent tool action violates schema or security rules."""
    pass


class ToolValidator:
    """
    Validates host-agent tool proposals before dispatching to the QEMU bridge.
    Ensures no arbitrary shell execution, path traversal, or malformed payloads reach xv6.
    """
    
    # 1. Allowlist and Schema Definitions
    TOOL_SCHEMAS: Dict[str, Dict[str, Any]] = {
        "list_files": {
            "required_args": {},
        },
        "read_file": {
            "required_args": {"path": str},
        },
        "delete_file": {
            "required_args": {"path": str},
        },
        "execute_effect": {
            "required_args": {
                "key": int,
                "op": str,
                "path": str,
                "data": str,
            },
            "allowed_ops": {"APPEND", "CREATE"},
        },
        "set_crashat": {
            "required_args": {"n": int},
        },
        "restart_qemu": {
            "required_args": {},
        },
    }

    # Allowed characters for guest filenames (alphanumeric, underscore, dash, dot, forward slash)
    PATH_PATTERN = re.compile(r"^[a-zA-Z0-9_\-\./]+$")

    @classmethod
    def validate(cls, action: Dict[str, Any]) -> Dict[str, Any]:
        """
        Validates the structure, tool name, argument types, and parameters of an action payload.
        Returns the validated action dict if clean; raises ToolValidationError otherwise.
        """
        if not isinstance(action, dict):
            raise ToolValidationError("Action payload must be a dictionary/JSON object.")

        tool_name = action.get("tool")
        args = action.get("args")

        # Validate basic action structure
        if not tool_name or not isinstance(tool_name, str):
            raise ToolValidationError("Action missing valid 'tool' string.")
        
        if args is None or not isinstance(args, dict):
            raise ToolValidationError("Action missing valid 'args' dictionary.")

        # 2. Reject unknown tool names (Allowlist Check)
        if tool_name not in cls.TOOL_SCHEMAS:
            raise ToolValidationError(f"Unauthorized tool requested: '{tool_name}'.")

        schema = cls.TOOL_SCHEMAS[tool_name]
        required_args = schema["required_args"]

        # 3. Check for missing or unexpected arguments
        for arg_name, expected_type in required_args.items():
            if arg_name not in args:
                raise ToolValidationError(
                    f"Tool '{tool_name}' missing required argument '{arg_name}'."
                )
            
            value = args[arg_name]
            
            # Special check: Ensure numeric keys fit standard unsigned limits if integer
            if expected_type == int and not isinstance(value, int):
                raise ToolValidationError(
                    f"Argument '{arg_name}' in tool '{tool_name}' must be an integer."
                )
            elif expected_type == str and not isinstance(value, str):
                raise ToolValidationError(
                    f"Argument '{arg_name}' in tool '{tool_name}' must be a string."
                )

        # 4. Specific Tool Sanitization & Boundary Logic
        if "path" in args:
            cls._validate_path(args["path"])

        if tool_name == "execute_effect":
            # Validate op parameter
            op = args["op"].upper()
            if op not in schema["allowed_ops"]:
                raise ToolValidationError(
                    f"Invalid effect operation '{op}'. Allowed: {schema['allowed_ops']}."
                )
            args["op"] = op  # Normalize to uppercase

            # Validate key range (64-bit integer constraint)
            key = args["key"]
            if key < 0 or key > 0xFFFFFFFFFFFFFFFF:
                raise ToolValidationError("Effect key must be a valid 64-bit unsigned integer.")

        if tool_name == "set_crashat":
            n = args["n"]
            if n < 0:
                raise ToolValidationError("Crash point 'n' must be a non-negative integer.")

        return action

    @classmethod
    def _validate_path(cls, path: str) -> None:
        """Sanitizes guest paths to prevent directory traversal and injection attacks."""
        if not path:
            raise ToolValidationError("Path string cannot be empty.")

        # Prevent Directory Traversal attempts (e.g., ../../etc/passwd)
        if ".." in path:
            raise ToolValidationError(f"Path traversal ('..') prohibited in path: '{path}'.")

        # Enforce guest path character limits
        if not cls.PATH_PATTERN.match(path):
            raise ToolValidationError(f"Path contains invalid/shell-unsafe characters: '{path}'.")

        # Enforce maximum path length (xv6 MAXPATH is 128)
        if len(path) > 128:
            raise ToolValidationError("Path exceeds maximum allowed length of 128 characters.")