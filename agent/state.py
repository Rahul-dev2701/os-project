#Short-lived in-memory context for one interactive planner session.

import json


class AgentState:
    def __init__(self, max_turns=4, max_text_chars=2000):
        if max_turns < 1:
            raise ValueError("max_turns must be at least 1")
        if max_text_chars < 1:
            raise ValueError("max_text_chars must be at least 1")

        self.max_turns = max_turns
        self.max_text_chars = max_text_chars
        self.turns = []

    def record_turn(self, request, action=None, result=None, error=None):
        self.turns.append({
            "request": self._limit_text(request),
            "action": self._limit_action(action),
            "result": self._limit_text(result) if result is not None else None,
            "error": self._limit_text(error) if error is not None else None,
        })
        self.turns = self.turns[-self.max_turns:]

    def planner_context(self):
        """Return recent turns as plain data for inclusion in planner messages."""
        return [dict(turn) for turn in self.turns]

    def _limit_text(self, value):
        text = str(value)
        if len(text) <= self.max_text_chars:
            return text
        marker = "... [truncated]"
        if self.max_text_chars <= len(marker):
            return marker[:self.max_text_chars]
        return text[:self.max_text_chars - len(marker)] + marker

    def _limit_action(self, action):
        if action is None:
            return None
        encoded = json.dumps(action, ensure_ascii=False)
        if len(encoded) <= self.max_text_chars:
            return action
        return {"truncated_action": self._limit_text(encoded)}
