# borrowed from the Opentrons API makefiles
pipenv_envvars := PIPENV_IGNORE_VIRTUALENVS=1
pipenv := $(pipenv_envvars) python -m pipenv
python := $(pipenv) run python
pip := $(pipenv) run pip
pytest := $(pipenv) run py.test


.PHONY: setup
setup:
	$(pipenv) sync $(pipenv_opts)
	$(pipenv) run pip freeze

.PHONY: serve
serve:
	$(SHX) mkdocs serve