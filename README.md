# Crystal Docset [![Dockset](https://github.com/Sija/crystal-dash-docset/actions/workflows/dockset.yml/badge.svg?event=workflow_dispatch)](https://github.com/Sija/crystal-dash-docset/actions/workflows/dockset.yml)

[Dash](https://kapeli.com/dash) docset documentation generator for the [Crystal Language](https://crystal-lang.org/).

## How to generate the docset

NOTE: You'll need [dashing](https://github.com/technosophos/dashing) utility
installed within `$PATH`.

1. Run a site capture such as *SiteSucker* or a `curl`/`wget` command
   - Capture everything under https://crystal-lang.org/reference/
     (*SiteSucker* will also pull in `/api/...` if you don't do it yourself)
   - Move just captured `reference` and `api` directories into this folder
2. Run `./build.sh`
3. Enjoy your newly bundled `Crystal.docset` 🎉

## Authors

- [Chris F. Ravenscroft](https://github.com/fusion)
- [Sijawusz Pur Rahnama](https://github.com/Sija)
