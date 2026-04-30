# Phase 01: Code Walkthrough

- `Mneme` exposes package and native capability checks.
- `Mneme.Collection` defines the idiomatic public API and validates options/vectors.
- `Mneme.Native` defines low-level function contracts and currently returns `:native_unavailable`.
- `Mneme.Error` normalizes native and wrapper errors.
- `Mneme.Result` models search outputs.
- `Mneme.Pool` provides an optional serialized search wrapper.

Next step is implementing `native/mneme_nif.zig` + `Mneme.Native` by embedding the mneme core directly in the NIF (Option B), while preserving Option A as a fallback strategy.
