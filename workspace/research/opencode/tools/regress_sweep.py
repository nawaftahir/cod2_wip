#!/usr/bin/env python3
"""Verify every exact match recorded by sweep_all.py."""
import glob
import json
import os
import sys

BASE = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(BASE, "tools"))
import match_cod2radiant as matcher


def object_paths():
    reference_root = os.path.abspath(os.path.join(BASE, "..", "cod2radiant"))
    return set(glob.glob(os.path.join(reference_root, "build", "**", "*.obj"), recursive=True)) | set(
        glob.glob(os.path.join(reference_root, "crt71", "**", "*.obj"), recursive=True))


def main():
    rows = json.load(open(os.path.join(BASE, "data", "sweep_512.json")))
    paths = {os.path.basename(path): path for path in object_paths()}
    verified = []
    failed = []
    for row in rows:
        if "@" in row["object"]:
            lib_path, offset = row["object"].split("@", 1)
            matches = glob.glob(os.path.join(BASE, "..", "..", "..", "gemini", "msvc710", "**", lib_path), recursive=True)
            archive = os.path.abspath(sorted(matches)[0]) if matches else ""
            if False:
                archive = os.path.abspath(os.path.join(BASE, "..", "..", "..", "gemini", "msvc710", "Vc7", "lib", "libc.lib"))
            data = open(archive, "rb").read()
            start = int(offset)
            member_size = int(data[start + 48:start + 58])
            object_data = data[start + 60:start + 60 + member_size]
        elif row["object"].startswith("exact_duplicate:"):
            representative = row["object"].split(":", 1)[1]
            object_data = matcher.carve(representative)[0]
            candidate = object_data
            mask = set()
            target, _ = matcher.carve(row["address"])
            va = int(row["address"], 16)
            pe_mask = matcher.absolute_masks(target, matcher.pe_relocations(va, len(target), target))
            if matcher.normalize(target, pe_mask) == matcher.normalize(candidate, mask):
                verified.append(row)
            else:
                failed.append((row["address"], row["name"]))
            continue
        else:
            path = paths.get(row["object"])
            if not path:
                failed.append((row["address"], "missing object"))
                continue
            object_data = open(path, "rb").read()
        target, _ = matcher.carve(row["address"])
        va = int(row["address"], 16)
        pe_mask = matcher.absolute_masks(target, matcher.pe_relocations(va, len(target), target))
        _, symbols = matcher.parse_coff(object_data)
        candidates = [row["object_symbol"]]
        candidates += [symbol["name"] for symbol in symbols
                       if symbol["section"] > 0 and symbol["class"] in (2, 3)
                       and not symbol["name"].startswith(".")]
        if "@" in row["object"]:
            archive_path, offset = row["object"].split("@", 1)
            archive = open(glob.glob(os.path.join(BASE, "..", "..", "..", "gemini", "msvc710", "**", archive_path), recursive=True)[0], "rb").read()
            start = int(offset)
            member_size = int(archive[start + 48:start + 58])
            member_data = archive[start + 60:start + 60 + member_size]
        found = False
        for symbol in candidates:
            try:
                candidate, mask, _ = matcher.object_function(object_data, symbol, target)
            except Exception:
                continue
            if len(candidate) != len(target):
                continue
            if matcher.normalize(target, pe_mask) == matcher.normalize(candidate, mask):
                found = True
                break
        if found:
            verified.append(row)
        else:
            failed.append((row["address"], row["name"]))
    print(f"verified={len(verified)} failed={len(failed)}")
    for item in failed[:20]:
        print("FAIL", *item)
    return 1 if failed else 0


if __name__ == "__main__":
    raise SystemExit(main())
