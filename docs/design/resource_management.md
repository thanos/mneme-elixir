# Resource Management

Native collection handles should be represented as BEAM NIF resources, not exposed pointers.

## Dirty scheduler policy

Operations that can be expensive (`build_hnsw`, large search, large load/save, large batch calls) should run on dirty schedulers to avoid blocking normal schedulers.

## NimblePool evaluation

NimblePool is **not required** for v0.1 core collection usage.

- Collection handles are stateful native resources and do not map naturally to generic worker pools.
- A pool may still help cap concurrency for expensive workloads.
- `Mneme.Pool` is included as an optional wrapper and can evolve later.
