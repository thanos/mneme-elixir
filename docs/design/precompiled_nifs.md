# Precompiled NIFs

`zigler_precompiled` is configured and wired in the internal native boundary module so releases can
ship prebuilt native artifacts.

## Intended module wiring

Native modules are declared with `ZiglerPrecompiled` in Elixir modules:

```elixir
version = Mix.Project.config()[:version]

use ZiglerPrecompiled,
  otp_app: :mneme,
  base_url: "https://github.com/mneme-db/mneme-elixir/releases/download/v#{version}",
  version: version,
  targets: ~w(
    aarch64-linux-gnu
    aarch64-linux-musl
    x86_64-linux-gnu
    x86_64-linux-musl
    aarch64-macos-none
    x86_64-macos-none
  ),
  force_build: System.get_env("MNEME_BUILD") in ["1", "true"],
  zig_code_path: Path.expand("../../native/mneme_nif.zig", __DIR__),
  nifs: [native_abi_version: 0]
```

Precompiled artifacts are intended to be downloaded and validated first, with local compilation as fallback.

## Release process (implemented)

1. Tag release (`vX.Y.Z`) triggers `.github/workflows/precompiled-nifs.yml`.
2. CI builds NIF tarballs for each target.
3. CI publishes tarballs + `checksums.txt` to the GitHub release.
4. Hex publish job runs `mix zigler_precompiled.download Mneme.Native --all --print`.
5. Runtime prefers downloaded precompiled artifacts; local Zig build is fallback.

Current target set (matches CI matrix and `targets:` in the native module):

- Linux: `aarch64-linux-gnu`, `aarch64-linux-musl`, `x86_64-linux-gnu`, `x86_64-linux-musl`
- macOS: `aarch64-macos-none`, `x86_64-macos-none`

Later targets:

- Windows

## Fallback behavior

- If a matching precompiled artifact exists and checksum verification passes, it is used.
- If no artifact exists for the target, local Zig compilation is attempted.
- If both fail, the native module reports unavailability through `%Mneme.Error{code: :native_unavailable}`.
