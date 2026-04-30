# Architecture

`mneme-elixir` is split into:

- `Mneme.Collection`: user-facing API with argument validation
- `Mneme.Native`: the only module allowed to cross the NIF boundary
- `Mneme.Error` and `Mneme.Result`: stable public data contracts
- `Mneme.Pool`: optional concurrency wrapper, not mandatory for core usage

The architecture keeps native concerns isolated and keeps Elixir API semantics explicit (`{:ok, value}` or `{:error, %Mneme.Error{}}`).
