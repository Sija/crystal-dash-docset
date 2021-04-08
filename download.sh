#!/bin/bash

# Full number of Crystal version, as found in api docs address:
# https://crystal-lang.org/api/1.0.0/

if [[ -z "${CRYSTAL_VERSION}" ]]; then
    echo "Missing 'CRYSTAL_VERSION' variable!"
    exit 1
else
    CRYSTAL_VERSION="${CRYSTAL_VERSION}"
fi

set -x
set -e

# Fetch /reference docs
wget \
    -e robots=off \
    --recursive \
    --reject '*.ico,*.txt,*.mp3,*.pdf,*.tgz,*.flv,*.avi,*.mpeg,*.iso' \
    --page-requisites \
    --html-extension \
    --convert-links \
    --no-host-directories \
    --no-parent \
    --domains crystal-lang.org \
    "https://crystal-lang.org/reference/" || true

# Fetch /api docs
wget \
    -e robots=off \
    --recursive \
    --reject '*.ico,*.txt,*.mp3,*.pdf,*.tgz,*.flv,*.avi,*.mpeg,*.iso' \
    --page-requisites \
    --html-extension \
    --convert-links \
    --no-host-directories \
    --no-parent \
    --domains crystal-lang.org \
    "https://crystal-lang.org/api/$CRYSTAL_VERSION/" || true

# Remove redundant api/latest folder
rm -rf api/latest

# Hide the sidebar in /api docs
echo ".sidebar { display: none !important }" >> "api/$CRYSTAL_VERSION/css/style.css"
