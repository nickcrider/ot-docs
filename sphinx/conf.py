# Configuration file for the Sphinx documentation builder.
#
# This file only contains a selection of the most common options. For a full
# list see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

# -- Path setup --------------------------------------------------------------

# If extensions (or modules to document with autodoc) are in another directory,
# add these directories to sys.path here. If the directory is relative to the
# documentation root, use os.path.abspath to make it absolute, like shown here.
#

#import os
#import sys
#sys.path.insert(0, os.path.abspath('src/'))


# -- Project information -----------------------------------------------------

project = 'Opentrons API Documentation'
copyright = '2020, Opentrons Labworks'
author = 'Opentrons Labworks'
'''
# get the release
from opentrons import __version__ as release

# get the max API level
from opentrons.protocol_api import MAX_SUPPORTED_VERSION 
max_apiLevel = str(MAX_SUPPORTED_VERSION)

# use rst_prolog to hold the subsitution
rst_prolog = f"""
.. |apiLevel| replace:: {max_apiLevel}
.. |release| replace:: {release}
"""
'''
# DEAD END
# it appears myst curently does not support subsitution syntax

# -- General configuration ---------------------------------------------------

# Add any Sphinx extension module names here, as strings. They can be
# extensions coming with Sphinx (named 'sphinx.ext.*') or your custom
# ones.
extensions = [
    'sphinx.ext.autodoc',
    'sphinx.ext.autosummary',
    'sphinx.ext.doctest',
    'sphinx.ext.coverage',
    'sphinx.ext.imgmath',
    'sphinx.ext.napoleon'
]


# Add any paths that contain templates here, relative to this directory.
templates_path = ['../_templates']

# List of patterns, relative to source directory, that match files and
# directories to ignore when looking for source files.
# This pattern also affects html_static_path and html_extra_path.
exclude_patterns = ['_build', 'Thumbs.db', '.DS_Store']


# -- Options for HTML output -------------------------------------------------

# The theme to use for HTML and HTML Help pages.  See the documentation for
# a list of builtin themes.
#
html_theme = 'sphinx_material'

templates_path = ['templates']