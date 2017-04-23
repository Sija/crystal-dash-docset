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

# Build the docset
dashing build

# Path to docset db index
DB=crystal.docset/Contents/Resources/docSet.dsidx

# Fix newlines
newlined=$(echo "SELECT id FROM searchIndex WHERE name LIKE '%
%';" | sqlite3 $DB)
for id in $newlined; do
    name=$(echo "SELECT name FROM searchIndex WHERE id = ${id};" | sqlite3 $DB)
    newname=$(echo $name | awk '{ print $1 }')
    echo "UPDATE searchIndex SET name = '${newname}' WHERE id = ${id};" | sqlite3 $DB
done

# Compress docset
tar --exclude='.DS_Store' -cvzf Crystal.tgz crystal.docset

# Move all files into the $TARGET path
mv Crystal.tgz "$TARGET/"
cp icon.png icon@2x.png "$TARGET/"
