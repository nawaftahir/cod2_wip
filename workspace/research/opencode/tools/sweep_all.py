#!/usr/bin/env python3
"""Sweep all local MSVC objects against the CoD2Radiant function inventory."""
import argparse, glob, json, os, sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import match_cod2radiant as matcher


def object_entries(paths):
    entries = []
    for path in paths:
        try:
            data = open(path, "rb").read()
            sections, symbols = matcher.parse_coff(data)
        except Exception:
            continue
        for symbol in symbols:
            if symbol["section"] <= 0 or symbol["class"] not in (2, 3):
                continue
            name = symbol["name"]
            if not name or name.startswith("."):
                continue
            try:
                payload, mask, resolved = matcher.object_function(data, name)
            except Exception:
                continue
            if len(payload) < 2 or len(payload) > 4096:
                continue
            entries.append((resolved, len(payload), matcher.normalize(payload, mask), os.path.basename(path)))
    # exact normalized byte-shape index
    unique = {}
    for entry in entries:
        key = (len(entry[2]), entry[2])
        unique.setdefault(key, entry)
    return list(unique.values())


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--max-bytes", type=int, default=512)
    parser.add_argument("--output", required=True)
    args = parser.parse_args()

    inventory = matcher.FUNCTIONS
    targets = []
    for address, metadata in sorted(inventory.items()):
        if metadata["thunk"] or not (2 <= int(metadata["size"]) <= args.max_bytes):
            continue
        target, _ = matcher.carve(address)
        va = int(address, 16)
        pe_mask = matcher.absolute_masks(target, matcher.pe_relocations(va, len(target), target))
        targets.append((address, metadata["name"], len(target), matcher.normalize(target, pe_mask)))

    reference_root = os.path.abspath(os.path.join(os.path.dirname(os.path.dirname(os.path.dirname(
        os.path.dirname(os.path.dirname(os.path.abspath(__file__)))))), "cod2radiant"))
    objects = glob.glob(os.path.join(reference_root, "build", "**", "*.obj"), recursive=True)
    objects += glob.glob(os.path.join(reference_root, "crt71", "**", "*.obj"), recursive=True)
    objects += glob.glob("/home/nawaf/cod2/test/dev/gemini/msvc710/Vc7/crt/src/intel/**/*.obj", recursive=True)
    entries = object_entries(objects)
    print(f"targets={len(targets)} object_functions={len(entries)}", file=sys.stderr)

    matches = []
    for address, name, size, normalized_target in targets:
        candidates = [entry for entry in entries if entry[1] == size]
        for resolved_name, _, normalized_object, object_name in candidates:
            if normalized_target == normalized_object:
                matches.append({"address": address, "name": name, "size": size,
                                "object_symbol": resolved_name, "object": object_name})
                break

    with open(args.output, "w") as stream:
        json.dump(matches, stream, indent=2)
    total = sum(item["size"] for item in matches)
    print(json.dumps({"matches": len(matches), "bytes": total,
                      "percent": total / 0x12620e * 100}, indent=2))


if __name__ == "__main__":
    main()
