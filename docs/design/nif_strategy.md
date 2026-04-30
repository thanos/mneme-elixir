# NIF Strategy

## Options considered

- **Option A: Zigler NIF calls mneme C ABI**
  - Pros: stable boundary, aligns with wrappers in other languages, less coupling to internal Zig layout.
  - Cons: requires linking/loading `libmneme`.
- **Option B: compile mneme core directly into NIF**
  - Pros: single native artifact.
  - Cons: high coupling and duplicated build logic risk.
- **Option C: Port over CLI/shared library**
  - Pros: stronger crash isolation.
  - Cons: slower and less idiomatic for embedded use.

## Decision for Phase 1

Choose **Option B** as the default implementation path to keep usage simple for Elixir users:

- one NIF artifact instead of requiring a separately installed `libmneme`
- simpler runtime setup for local development and deployment
- clearer Hex package story when combined with precompiled NIFs

Fallback remains **Option A** if direct core embedding proves too brittle in specific build environments.
