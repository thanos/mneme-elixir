# Versioning

`mneme-elixir` tracks multiple version surfaces:

- Elixir package version: `0.1.0`
- mneme core version: tracked from upstream `mneme-db/mneme` tags
- mneme C ABI version: expected `v1` (`mneme_abi_version()`)
- `.mneme` file format version: currently `2` in core docs

Breaking changes in ABI or file format must be called out in release notes.
