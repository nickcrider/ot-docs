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
	mkdir $(version_dir)

.PHONY: serve
serve: update-versions
	@echo "Running dev server. Press Ctrl+C to exit!"
	@$(python) -m mkdocs serve

.PHONY: update-versions
update-versions: version_info/apilevel.txt version_info/build.txt
	@echo "Checking version include files"
	@echo "Opentrons API Level: $(shell cat version_info/apilevel.txt)"
	@echo "Opentrons Release/Version: $(shell cat version_info/build.txt)"

.PHONY: publish
publish: update-versions
	@$(python) -m mkdocs gh-deploy --force

version_info/apilevel.txt version_info/build.txt: version_info/
	@$(python) ot-versions.py

version_info/:
	mkdir version_info

.PHONY: clean
clean:
	rm -rf version_info