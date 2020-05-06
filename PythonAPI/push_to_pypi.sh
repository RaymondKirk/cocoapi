#!/usr/bin/env bash
cd "$(cd -P -- "$(dirname -- "$0")" && pwd -P)"
set -e
pip install --upgrade setuptools wheel twine
rm -r build dist || true
python setup.py sdist
python -m twine upload dist/* || true
rm -r build dist