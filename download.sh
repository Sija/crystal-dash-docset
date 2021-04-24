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
    --no-verbose \
    --recursive \
    --reject '*.ico,*.txt,*.pdf,*.mp3,*.mp4,*.tgz,*.zip,*.flv,*.avi,*.mpeg,*.mpg,*.iso' \
    --page-requisites \
    --html-extension \
    --convert-links \
    --no-host-directories \
    --no-parent \
    --domains crystal-lang.org \
    "https://crystal-lang.org/reference/" || true

# Fetch /api docs
wget https://github.com/crystal-lang/crystal/releases/download/$CRYSTAL_VERSION/crystal-$CRYSTAL_VERSION-docs.tar.gz

# Extract the docs
tar -xvf crystal-$CRYSTAL_VERSION-docs.tar.gz

# Remove the archive
rm crystal-$CRYSTAL_VERSION-docs.tar.gz

# Rename the docs folder
mkdir api
mv crystal-$CRYSTAL_VERSION-docs api/$CRYSTAL_VERSION

# Hide the sidebar in /api docs
echo ".sidebar { display: none !important }" >> "api/$CRYSTAL_VERSION/css/style.css"
