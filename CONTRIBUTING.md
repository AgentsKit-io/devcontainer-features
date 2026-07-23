# Contributing

Open an issue before adding a new Feature or changing an existing public contract.

For focused corrections:

1. Create a branch from `main`.
2. Update the Feature metadata, installer, documentation, and tests together.
3. Run packaging and the relevant Docker-backed Feature tests.
4. Open a pull request describing compatibility, validation, and versioning impact.

Feature installers must be idempotent, pin distributable tools to explicit versions, avoid secrets, and work on every base image declared in CI. Increment the Feature version for every user-visible change; published OCI versions are immutable.
