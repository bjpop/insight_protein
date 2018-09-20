#!/bin/bash

set -e
errors=0

# Run unit tests
python insight_protein/insight_protein_test.py || {
    echo "'python python/insight_protein/insight_protein_test.py' failed"
    let errors+=1
}

# Check program style
pylint -E insight_protein/*.py || {
    echo 'pylint -E insight_protein/*.py failed'
    let errors+=1
}

[ "$errors" -gt 0 ] && {
    echo "There were $errors errors found"
    exit 1
}

echo "Ok : Python specific tests"
