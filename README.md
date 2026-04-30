# Mneme

Idiomatic Elixir client for the [`mneme` core engine](https://github.com/mneme-db/mneme), an embedded-first vector and memory database written in Zig.

## Status

This repository currently provides the Elixir API shape, type/error modeling, and project structure for a NIF-backed client. Native calls are scaffolded and return `:native_unavailable` until the Zigler NIF implementation is completed.

## Installation

```elixir
def deps do
  [
    {:mneme, "~> 0.1.0"}
  ]
end
```

## Basic API (Target Shape)

```elixir
{:ok, collection} = Mneme.Collection.new("docs", dimension: 3)
:ok = Mneme.Collection.insert(collection, "doc_1", [1.0, 0.0, 0.0], metadata: "source=chat")
{:ok, results} = Mneme.Collection.search(collection, [1.0, 0.0, 0.0], limit: 10)
```

## Design docs

- `docs/design/architecture.md`
- `docs/design/nif_strategy.md`
- `docs/design/resource_management.md`
- `docs/design/precompiled_nifs.md`

Current strategy preference is **Option B** (embed mneme core into the NIF) to minimize installation complexity for Elixir users.

