#!/bin/bash

set -x
set -e

# Build the docset
dashing build

# Path to docset db index
DB=Crystal.docset/Contents/Resources/docSet.dsidx

# Fix newlines
newlined=$(echo "SELECT id FROM searchIndex WHERE name LIKE '%
%';" | sqlite3 $DB)

for id in $newlined; do
    name=$(echo "SELECT name FROM searchIndex WHERE id = ${id};" | sqlite3 $DB)
    newname=$(echo $name | awk '{ print $1 }')

    echo "UPDATE searchIndex SET name = '${newname}' WHERE id = ${id};" | sqlite3 $DB
done

# Compress docset
tar --exclude='.DS_Store' -cvzf Crystal.tgz Crystal.docset
