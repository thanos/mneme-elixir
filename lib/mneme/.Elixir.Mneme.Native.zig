pub fn native_abi_version() u32 {
    // Option B bootstrap:
    // Zigler restricts imports outside module path, so the next step is to
    // vendor/sync mneme core Zig sources under this repository.
    return 1;
}
