#!/usr/bin/env bash
set -xe

py.test skein/ -vv

flake8 skein/

if [[ "$DOCS" == "true" ]]; then
    pushd docs/
    make html
    popd
    doctr deploy . --built-docs docs/build/html/
fi
