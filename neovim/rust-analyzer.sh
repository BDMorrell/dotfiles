#!/bin/sh

set -e

URL='https://github.com/rust-analyzer/rust-analyzer/releases/latest/download/rust-analyzer-aarch64-unknown-linux-gnu.gz'
DEST_DIR="$HOME/.local/bin"
DEST_PATH="$DEST_DIR/rust-analyzer"

testURL() {
    curl --head --location --fail --silent "$1" > /dev/null
}

abort() {
    echo "$1"
    exit 1
}

echo 'Testing URL'
testURL "$URL" || abort 'Bad URL'

echo 'Downloading'
mkdir -p "$DEST_DIR"
curl --location "$URL" | gunzip -c - > "$DEST_PATH"
chmod +x "$DEST_PATH"
