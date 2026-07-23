# AgentsKit Dev Container Features

Reusable development-container features for the open-source AgentsKit ecosystem.

## Playbook

Install the deterministic quality gates from `@agentskit/playbook` in a Dev Container, GitHub Codespace, or another tool implementing the Dev Container specification:

```jsonc
{
  "image": "mcr.microsoft.com/devcontainers/base:ubuntu-24.04",
  "features": {
    "ghcr.io/agentskit-io/devcontainer-features/playbook:1": {}
  }
}
```

The Feature installs Node.js 22 through the official Node Feature, then installs the exact Playbook gates package globally. Both command names are available:

```bash
agents-playbook --version
ak-playbook run --fast
```

Pin a supported package version explicitly when needed:

```jsonc
{
  "features": {
    "ghcr.io/agentskit-io/devcontainer-features/playbook:1": {
      "gatesVersion": "0.1.0"
    }
  }
}
```

See the [Playbook gate reference](https://playbook.agentskit.io/docs/scripts) for every gate and configuration option.

## Development

Requirements: Node.js 22, Docker, and the Dev Container CLI 0.88.0.

```bash
npm install --global @devcontainers/cli@0.88.0
devcontainer features package --output-folder /tmp/agentskit-features ./src
devcontainer features test --features playbook --base-image ubuntu:24.04 .
```

The CI matrix also tests Debian 12 and the Microsoft Dev Container Ubuntu 24.04 base image.

## Publishing

Releases are manual and publish immutable OCI artifacts to GitHub Container Registry. The workflow must run from `main`; Feature versions come from each `devcontainer-feature.json`.

After the first publication, set the collection and Feature packages to public in the organization package settings. Roll back a broken Feature by restoring the previous `devcontainer-feature.json` version on `main` and republishing that version under a new patch release; published OCI tags are not overwritten.

## Contributing

Read [CONTRIBUTING.md](CONTRIBUTING.md) before opening a pull request. Security reports follow [SECURITY.md](SECURITY.md).

## License

[MIT](LICENSE)
