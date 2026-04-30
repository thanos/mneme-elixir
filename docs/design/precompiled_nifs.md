# Precompiled NIFs

`zigler_precompiled` is configured as a dependency so the library can ship prebuilt native artifacts once the NIF implementation is stable.

Planned process:

1. Build NIF artifacts in CI for supported targets.
2. Publish checksums with each release.
3. Prefer downloading verified artifacts.
4. Fall back to local Zig compilation when no matching artifact exists.

Initial target set:

- macOS arm64
- macOS x86_64
- Linux x86_64

Later targets:

- Linux aarch64
- Windows
