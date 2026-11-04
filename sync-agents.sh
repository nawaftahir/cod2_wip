#!/bin/sh
# Generate only this Radiant track's instruction copies.
set -eu
cd "$(dirname "$0")"
for target in AGENTS.md GEMINI.md; do
    {
        printf '%s\n\n' '<!-- Generated from CLAUDE.md by sync-agents.sh. Edit CLAUDE.md, not this file. -->'
        tr -d '\r' < CLAUDE.md
    } > "$target"
done
