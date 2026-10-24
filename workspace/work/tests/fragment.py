"""Text of a former candidate TU now merged into its retail file (layout/fragments.json)."""
import json
from pathlib import Path

work = Path(__file__).resolve().parents[1]
_map = json.loads((work / 'layout/fragments.json').read_text())


def fragment(name):
    # from its section comment (or the end of the includes) up to the next section comment
    entry = _map[name]
    text = (work / 'src' / entry['host']).read_text()
    start = text.index(entry['start'] + '\n') if entry['start'] else text.index('\n\n') + 2
    stop = text.index(entry['next'] + '\n', start) if entry['next'] else len(text)
    return text[start:stop]
