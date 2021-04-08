#!/bin/bash

# Path to Crystal docset inside of forked Kapeli/Dash-User-Contributions repo
# TARGET=/<...>/Dash-User-Contributions/docsets/Crystal

if [[ -z "${TARGET}" ]]; then
    echo "Missing 'TARGET' variable!"
    exit 1
else
  TARGET="${TARGET}"
fi

set -x
set -e

# Move all files into the $TARGET path
mv Crystal.tgz "$TARGET/"
cp icon.png icon@2x.png "$TARGET/"
