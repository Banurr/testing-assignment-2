#!/bin/bash

PROJECT_DIR="$WORKSPACE"
VENV_DIR="$PROJECT_DIR/.venv"
BROWSERSTACK_CONFIG="$PROJECT_DIR/browserstack/browserstack.yaml"
TEST_DIR="$PROJECT_DIR/testCases"

PYTHON=$(which python3)
if [ -z "$PYTHON" ]; then
    echo "Python3 not found! Please install Python 3."
    exit 1
fi

if [ ! -d "$VENV_DIR" ]; then
    echo "Creating virtual environment..."
    $PYTHON -m venv "$VENV_DIR"
fi

source "$VENV_DIR/bin/activate"

pip install --upgrade pip
pip install --upgrade robotframework robotframework-seleniumlibrary

browsers=("chrome" "firefox" "safari")

for browser in "${browsers[@]}"; do
    echo "=============================="
    echo "Running tests on $browser..."
    echo "=============================="

    robot \
        -v BROWSER:$browser \
        -V "$BROWSERSTACK_CONFIG" \
        --output "output_${browser}.xml" \
        --log "log_${browser}.html" \
        --report "report_${browser}.html" \
        "$TEST_DIR"
done

deactivate

echo "All BrowserStack tests completed."
