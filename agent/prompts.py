"""Planner instructions and hosted-API tool definitions."""

try:
    from .validator import ToolValidator
except ImportError:  # Also support running main.py directly from agent/.
    from validator import ToolValidator


SYSTEM_PROMPT = """You are the planning component of an xv6 filesystem assistant.
For each user request, propose exactly one call from the provided tools.
Use only the listed tool names and provide every required argument with the
correct type. Do not invent a tool or claim that an operation has completed.
The Python application will validate and execute your proposal separately."""


TOOL_DESCRIPTIONS = {
    "list_files": "List files in the xv6 guest filesystem.",
    "read_file": "Read a file from the xv6 guest filesystem.",
    "delete_file": "Delete a file from the xv6 guest filesystem.",
    "execute_effect": (
        "Apply an exactly-once filesystem effect. Use CREATE to create a file "
        "or APPEND to append data, with the supplied request key."
    ),
    "set_crashat": "Set the crash-injection point to a non-negative operation count.",
    "restart_qemu": "Restart the QEMU xv6 guest.",
}


ARGUMENT_DESCRIPTIONS = {
    "key": "Unsigned request key used to identify this effect.",
    "op": "Filesystem operation to apply.",
    "path": "Path of the guest filesystem file.",
    "data": "Text to write or append, as selected by op.",
    "n": "Non-negative operation count at which to inject a crash.",
}


def build_messages(request):
    """Build the system and user messages for one planner request."""
    if not isinstance(request, str) or not request.strip():
        raise ValueError("Request must be a non-empty string")

    return [
        {"role": "system", "content": SYSTEM_PROMPT},
        {"role": "user", "content": request.strip()},
    ]


def build_tool_definitions(tool_schemas=None):
    """Format the validator's current schemas as hosted API function tools."""
    if tool_schemas is None:
        tool_schemas = ToolValidator.TOOL_SCHEMAS

    definitions = []
    for name, schema in tool_schemas.items():
        required_args = schema["required_args"]
        properties = {}

        for arg_name, python_type in required_args.items():
            if python_type is str:
                json_type = "string"
            elif python_type is int:
                json_type = "integer"
            else:
                raise TypeError(
                    f"Unsupported schema type for {name}.{arg_name}: "
                    f"{python_type.__name__}"
                )

            property_schema = {
                "type": json_type,
                "description": ARGUMENT_DESCRIPTIONS.get(arg_name, arg_name),
            }
            if name == "execute_effect" and arg_name == "op":
                property_schema["enum"] = sorted(schema["allowed_ops"])
            elif name == "execute_effect" and arg_name == "key":
                property_schema["minimum"] = 0
                property_schema["maximum"] = 0xFFFFFFFFFFFFFFFF
            elif name == "set_crashat" and arg_name == "n":
                property_schema["minimum"] = 0

            properties[arg_name] = property_schema

        definitions.append({
            "type": "function",
            "function": {
                "name": name,
                "description": TOOL_DESCRIPTIONS.get(
                    name, f"Run the {name} action."
                ),
                "parameters": {
                    "type": "object",
                    "properties": properties,
                    "required": list(required_args),
                },
            },
        })

    return definitions
