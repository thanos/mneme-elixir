# Phase 01: Resource Management

`Mneme.Collection` wraps a native handle reference.

Goals:

- rely on GC-safe resource finalization
- avoid exposing manual pointer operations to users
- provide optional explicit `close/1` for deterministic cleanup

NimblePool remains optional and is not required for core API usage in v0.1.
