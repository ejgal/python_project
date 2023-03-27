update-deps:
	python -m pip install --upgrade pip-tools pip wheel
	python -m piptools compile --upgrade --resolver backtracking -o requirements.txt pyproject.toml
	python -m piptools compile --extra dev --upgrade --resolver backtracking -o dev-requirements.txt pyproject.toml


init:
	python -m pip install --upgrade pip wheel
	python -m pip install --upgrade -r requirements.txt -r dev-requirements.txt -e .
	python -m pip check

build:
	python -m flit build

update: update-deps init

lint:
	nox -s lint

test-all:
	nox

test-fast:
	pytest

test:
	nox --python 3.11

clean:
	rm -rf .nox
	find . -name '__pycache__' -exec rm -fr {} +
	find . -name '.pytest_cache' -exec rm -fr {} +
	rm -rf .ruff_cache
	rm -rf dist

.PHONY: update-deps

# Kilder:
# https://hynek.me/til/pip-tools-and-pyproject-toml/
# https://gist.github.com/lumengxi/0ae4645124cd4066f676