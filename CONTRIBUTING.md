# Contributing to the Docs

See a typo? Want to make a change or add an example? Contributing to the docs is super easy for anyone with a GitHub Account! Here's the process:

1. Find the "Pencil Icon" next to the page title.
2. Clicking this should bring you to the GitHub web interface where you can make your changes.
3. By default GitHub will fork the docs into your own repo. Make more changes if you want!
4. Once you're satisfied with your changes, create a [pull request](https://guides.github.com/activities/hello-world/#pr) from your branch to the main one in this repo
5. We'll reveiew your changes, suggest any edits, and if all looks good we'll merge your changes into our live docs right away!

# Why Markdown?

If you do some googling, there is/(was) quite a debate going between the various proponets of Markdown vs. Asciidoc vs. reStructuredText. _Conveinience vs. portability vs. power... on and on._ However, most of those posts are dated from 2016-2019, and now, that debate appears to mostly have been settled in favor of Markdown. While it's not truly "portable" in the ideal sense of the word, it's good enough.

Since Markdown syntax has slowly taken over super common communication platforms like Slack, Trello, Reddit, etc. most people non-techincal people are using already without even knowing it. Because of its low barrier to entry, many, many of the world's leading software shops have standardized on some flavor of Markdown for their documentation in spite of the portability concerns of earlier years. For example, Microsoft is now [using Markdown for all of their docs.microsoft.com content](https://docs.microsoft.com/en-us/contribute/markdown-reference).

The [CommonMark Specification](https://commonmark.org/) aims to standardize the many corner cases of the current Markdown implimentations and both Microsoft and GitHub have switched to using CommonMark compliant parsers, augmented with their own custom extensions. You can see some of the 600+ possible parsing differences yourself here in the complete [CommonMark Technical Specification](https://spec.commonmark.org/0.29/), or you can play with them yourself with [Babblemark2](https://johnmacfarlane.net/babelmark2/). The folks at GitHub have put together [a great blog peice](https://github.blog/2017-03-14-a-formal-spec-for-github-markdown/) on the pros and cons of standardizing to a CommonMark parser.

However, Markdown isn't the best for complex auto-generated API documentation, but that's exatly why we're still generating the API reference with Sphinx. The ultimate goal of using Markdown here is to allow almost anyone to easily contribute to the docs with a minimum of syntactic overhead.

## 'non-standard' Markdown Usage

These docs aim to use ["standard" Markdown](https://www.markdownguide.org/basic-syntax/), augmented by some extensions provided by `pymdownx` to provide enhanced functionality. This implementation additionally relies on `markdown_include` to provide subsitutions in the Markdown documents. Aside from these extensions, our Markdown should stick to some easy style conventions to keep the resulting files as portable between tools as possible. Unfortunately the underlying `python-markdown` that Mkdocs uses [will never become CommonMark compliant](https://github.com/Python-Markdown/markdown/issues/338#issuecomment-54697337), but all things considered, it's pretty close. The BabbleMark FAQ [explains the major differences](https://johnmacfarlane.net/babelmark2/faq.html#what-are-some-big-questions-that-the-markdown-spec-does-not-answer). 

### `pymdownx` Syntax

While the underlying work is done by `pymdownx`, the best example and guide to using this sytnax can be found on the [Material for MkDocs Reference](https://squidfunk.github.io/mkdocs-material/reference/). Other `pymdownx` [extensions](https://facelessuser.github.io/pymdown-extensions/extensions/) can be loaded in `mkdocs.yml` but may not be fully supported by the Material for MkDocs Template.

These docs currently use:

- [Admonitions](https://squidfunk.github.io/mkdocs-material/reference/admonitions/)
- [Tabbed Superfences](https://squidfunk.github.io/mkdocs-material/reference/content-tabs/)
- [Highlighted Code Blocks](https://squidfunk.github.io/mkdocs-material/reference/code-blocks/)
- [Data Tables](https://squidfunk.github.io/mkdocs-material/reference/data-tables/) (Standard GFM syntax)
- [Icon/Emojis](https://squidfunk.github.io/mkdocs-material/reference/icons-emojis/)

Here's what is considerd [GitHub Flavored Markdown](https://github.github.com/gfm/) vs not:

| `pymdownx` Extension    | Renders on GitHub | CommonMark? |
| ----------------------- | :---------------: | :---------: |
| Admonitions             |        No         |     No      |
| Tabbed Superfences      |        No         |     No      |
| Highlighted Code Blocks |        Yes        |     No      |
| Data Tables             |        Yes        |     No      |
| Icon/Emojis             |        No         |     No      |


### `markdown_include` Syntax

[Markdown-Include](https://github.com/cmacmackin/markdown-include) is a non-standard markdown extension, and likely is not supported on other platforms. It's used here to supply the `apiLevel` and Version information to appropriate places in the documentation from the Opentrons python package at build time.

It looks for any file from the root directory of the build. The specified file is then included via a preprocessor. While not currently used for Markdown, the include files can contain Markdown content which will get rendered into the final HTML.

````markdown
#### Using `apiLevel` {! version_info/apilevel.txt !}

The current version is {! version_info/apilevel.txt !}. Check it out!

```python
from opentrons import protocol_api

metadata = {
    'apiLevel': '{! version_info/apilevel.txt !}',
    'author': 'A. Biologist'}
```
````

If the current `apiLevel` is `2.6` it will render like this:

#### Using `apiLevel` 2.6

The current version is 2.6. Check it out!

```python
from opentrons import protocol_api

metadata = {
    'apiLevel': '2.6',
    'author': 'A. Biologist'}
```


