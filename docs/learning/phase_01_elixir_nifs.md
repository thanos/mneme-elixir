# Phase 01: Elixir NIF Basics

NIFs run inside the BEAM VM process. That gives very low overhead native calls but also means unsafe native code can crash the VM.

Key rules:

- Keep normal-scheduler NIF functions short.
- Use dirty schedulers for CPU-heavy or IO-heavy work.
- Represent native state with NIF resources, not user-visible pointers.
