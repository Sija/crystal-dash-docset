# Crystal Docset

[Dash](https://kapeli.com/dash) docset documentation generator for the [Crystal Language](https://crystal-lang.org/).

## How to generate the docset

NOTE: You'll need [dashing](https://github.com/technosophos/dashing) utility
installed within `$PATH`.

1. Run a site capture such as *SiteSucker* or a glorious `curl` command
   - Capture everything under https://crystal-lang.org/docs/  
     (*SiteSucker* will also pull in `/api/...` if you don't do it yourself)
   - Move just captured `doc` and `api` directories into this folder
2. Edit the `TARGET` variable in `build.sh` to point to your forked
   [*Kapeli* docset repository](https://github.com/Kapeli/Dash-User-Contributions)
   (or use `TARGET` env variable)
3. Then run `./build.sh`

## Authors

- [Chris F. Ravenscroft](https://github.com/fusion)
- [Sijawusz Pur Rahnama](https://github.com/Sija)
