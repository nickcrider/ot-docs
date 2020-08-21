# Overview

See the live site here: https://nickcrider.github.io/ot-docs/

Proof of concept for breaking the Opentrons API Documentation into a separate repository written in Markdown instead of reST.

Current implimentation uses [Material for MkDocs](https://github.com/squidfunk/mkdocs-material)

This has some neat advantages, including:
- Enables separate release cadences for the Docs from the monorepo
- Markdown is easiser to use and more portable than reST
- Lowers the bar to contributing/changing the docs
- Modern tools encorage user interaction

# Setup

Install Material for MkDocs with `pip`, clone the repo, and run the development server:

```bash
pip install mkdocs-material
git clone https://github.com/nickcrider/ot-docs.git
cd ot-docs
mkdocs serve
```
You should now be able to find the docs at `http://localhost:8000` any saved changes to files are automatically reflected

# Notes

The big caveat currently is the generation of the API Reference documentation. Converting the Sphinx based autodoc output to Markdown loses a lot of useful formatting (see [HTML](docs/new_protocol_api.md) vs [Markdown](docs/new_protocol_api_pure.md)), and rewriting all of the API docstrings in Markdown is a no-go. Therefore, I configured a local branch of the monorepo with `make docs-v2-ref` to generate raw HTML from the (mostly) equivlent template [sphinx-material](https://github.com/bashtage/sphinx-material/). For now, I've just copy-pasted the HTML output into the `new_protocol_api.md` but it will be automate with a makefile, soon. 

# Todo

This is a very early proof of concept. Lots of work remains:

- Automate the build with a real makefile.
- Automate creation of `new_protocol_api.md` from Monorepo.  Bindings exist, I just need to plumb things together so this is automated.
- Rename files for better SEO (see the `Examples` Section for an example)
- Lots of webdesign stuff
    


