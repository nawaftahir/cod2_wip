"""Reject failed byte probes before spending time on full verification."""
import json
import sys


def unique_match(rows, symbol):
    found = [row for row in rows if row['name'] == symbol]
    return len(found) == 1 and len(found[0]['hits']) == 1


if __name__ == '__main__':
    matched = unique_match(json.load(open(sys.argv[1])), sys.argv[2])
    print('Byte probe passed; full gates follow.' if matched else
          'Unverified byte probe failed; no checkpoint or coverage updated.')
    sys.exit(0 if matched else 3)
