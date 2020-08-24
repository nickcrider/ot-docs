# borrowed from the Opentrons API makefiles
pipenv_envvars := PIPENV_IGNORE_VIRTUALENVS=1
pipenv := $(pipenv_envvars) python -m pipenv
python := $(pipenv) run python
pip := $(pipenv) run pip

version_dir = version_info

.PHONY: setup
setup:
	$(pipenv) sync $(pipenv_opts)
	$(pipenv) run pip freeze

.PHONY: serve
serve: update-versions
	@echo "Running dev server. Press Ctrl+C to exit!"
	mkdocs serve

.PHONY: update-versions
update-versions:
	@$(python) -c "from opentrons.protocol_api import MAX_SUPPORTED_VERSION as v; print(v)" > $(version_dir)/apilevel.txt
	@opentrons_execute --version > $(version_dir)/build.txt

.PHONY: publish
publish: update-versions
	mkdocs gh-deploy --force