#!/bin/sh
set -eu
cd "$(dirname "$0")"
for file in AGENTS.md GEMINI.md; do
  { printf '%s\n\n' '<!-- Generated from CLAUDE.md. Edit CLAUDE.md, not this file. -->'; cat CLAUDE.md; } > "$file"
done
