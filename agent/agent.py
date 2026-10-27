import shlex

class Agent:

    def __init__(self):
        self.commands = {
            "list": self.list_files,
            "read": self.read_file,
            "stat": self.stat_file,
            "exists": self.file_exists,
            "create": self.create_file,
            "append": self.append_file,
            "count": self.count_file,
            "summarize": self.summarize_file,
            "retry": self.retry_request,
            "crashat": self.crash_at
        }

    def make_action(self, tool, args):
        return {
            "tool": tool,
            "args": args
        }

    def list_files(self, args):
        if len(args) != 0:
            raise ValueError("Usage: list")

        return self.make_action("list_files", {})

    def read_file(self, args):
        if len(args) != 1:
            raise ValueError("Usage: read <path>")

        return self.make_action("read_file", {
            "path": args[0]
        })

    def stat_file(self, args):
        if len(args) != 1:
            raise ValueError("Usage: stat <path>")

        return self.make_action("stat_file", {
            "path": args[0]
        })

    def file_exists(self, args):
        if len(args) != 1:
            raise ValueError("Usage: exists <path>")

        return self.make_action("file_exists", {
            "path": args[0]
        })

    def create_file(self, args):
        if len(args) < 2:
            raise ValueError("Usage: create <path> <text>")

        return self.make_action("create_file", {
            "path": args[0],
            "text": " ".join(args[1:])
        })

    def append_file(self, args):
        if len(args) < 2:
            raise ValueError("Usage: append <path> <text>")

        return self.make_action("append_file", {
            "path": args[0],
            "text": " ".join(args[1:])
        })

    def count_file(self, args):
        if len(args) != 1:
            raise ValueError("Usage: count <path>")

        return self.make_action("count_file", {
            "path": args[0]
        })

    def summarize_file(self, args):
        if len(args) != 1:
            raise ValueError("Usage: summarize <path>")

        return self.make_action("summarize_file", {
            "path": args[0]
        })

    def retry_request(self, args):
        if len(args) != 1:
            raise ValueError("Usage: retry <request_id>")

        return self.make_action("retry_request", {
            "request_id": args[0]
        })

    def crash_at(self, args):
        if len(args) != 1:
            raise ValueError("Usage: crashat <n>")

        try:
            n = int(args[0])
        except ValueError:
            raise ValueError("Crash point must be an integer")

        if n < 0:
            raise ValueError("Crash point cannot be negative")

        return self.make_action("crashat", {
            "n": n
        })

    def plan(self, request):
        if not isinstance(request, str):
            raise ValueError("Request must be a string")

        try:
            tokens = shlex.split(request)
        except ValueError as error:
            raise ValueError(f"Invalid command syntax: {error}")

        if not tokens:
            raise ValueError("Empty request")

        command = tokens[0].lower()
        args = tokens[1:]

        if command not in self.commands:
            raise ValueError(f"Unsupported command: {command}")

        return self.commands[command](args)
