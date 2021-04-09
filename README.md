# Crystal Docset [![Dockset](https://github.com/Sija/crystal-dash-docset/actions/workflows/dockset.yml/badge.svg?event=workflow_dispatch)](https://github.com/Sija/crystal-dash-docset/actions/workflows/dockset.yml)

[Dash](https://kapeli.com/dash) docset documentation generator for the [Crystal Language](https://crystal-lang.org/).

## How to generate the docset

**NOTE**: You'll need `wget` and [`dashing`](https://github.com/technosophos/dashing) utilities installed (you can use `brew bundle` to install those).

1. Run `CRYSTAL_VERSION=<like 1.0.0> ./download.sh` to download the API docs
2. Run `./build.sh`
3. Enjoy your newly bundled `Crystal.docset` 🎉

## Authors

- [Chris F. Ravenscroft](https://github.com/fusion)
- [Sijawusz Pur Rahnama](https://github.com/Sija)
