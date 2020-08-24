# Overview

See the live site here: https://nickcrider.github.io/ot-docs/

Proof of concept for breaking the Opentrons API Documentation into a separate repository written in Markdown instead of reST.

Current implimentation uses [Material for MkDocs](https://github.com/squidfunk/mkdocs-material)

This has some neat advantages, including:
- Enables separate release cadences for the Docs from the monorepo
- Markdown is easiser to use and more portable than reST
- Lowers the bar to contributing/changing the docs
- Modern tools encorage user interaction

# Contributing

We love user contributions! See the [instructions](CONTRIBUTING.md) on how to submit your changes to the docs. While not strictly required, you'll probably want to follow the instructions below to check your work locally before exposing it to the rest of the world.

# Setup

Just like the [Opentrons Monorepo](https://github.com/Opentrons/opentrons/blob/edge/CONTRIBUTING.md#environment-and-repository), you'll need `git`, `pipenv`, and `make` installed. Once you've gotten that taken care of, you can clone the repo, use `make` to install the dependencies, and then run the development server:

```bash
git clone https://github.com/nickcrider/ot-docs.git
cd ot-docs
make setup
make serve
```
You should now be able to find the docs at `http://localhost:8000` the server watches files for changes and automatically reloads

# Notes

The big caveat currently is the generation of the API Reference documentation. Converting the Sphinx based autodoc output to Markdown loses a lot of useful formatting, and rewriting all of the API docstrings in Markdown is a no-go. Therefore, I configured a [branch](https://github.com/Opentrons/opentrons/tree/docs-sphinx-material/api) of the monorepo with `make docs-v2-ref` to generate raw HTML from the (mostly) equivlent template [sphinx-material](https://github.com/bashtage/sphinx-material/). For now, I've just copy-pasted the HTML output into the `new_protocol_api.md` but it will be automate with a makefile, soon. 

# Todo

This is a very early proof of concept. Lots of work remains:

- Automate creation of `new_protocol_api.md` from Monorepo.  Bindings exist, I just need to plumb things together so this is automated.
- Rename files for better SEO (see the `Examples` Section for an example)
- Lots of webdesign stuff
    


