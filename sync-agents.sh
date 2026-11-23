#!/bin/sh
set -eu
cd "$(dirname "$0")"
if [ "$#" -eq 0 ]; then set -- .; fi
for dir do
  for file in AGENTS.md GEMINI.md; do
    { printf '%s\n\n' '<!-- Generated from CLAUDE.md by sync-agents.sh. Edit CLAUDE.md, not this file. -->'; tr -d '\r' < "$dir/CLAUDE.md"; } > "$dir/$file"
  done
done
