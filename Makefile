# borrowed from the Opentrons API makefiles
pipenv_envvars := PIPENV_IGNORE_VIRTUALENVS=1
pipenv := $(pipenv_envvars) python -m pipenv
python := $(pipenv) run python
pip := $(pipenv) run pip


.PHONY: setup
setup:
	$(pipenv) sync $(pipenv_opts)
	$(pipenv) run pip freeze
	# get the apiLevel from the opentrons package
	$(python) -c "from opentrons.protocol_api import MAX_SUPPORTED_VERSION as v; print(v)" > apilevel.txt

.PHONY: serve
serve:
	echo "Running dev server. Press Ctrl+C to exit!"
	mkdocs serve