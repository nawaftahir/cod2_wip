"""Print BinDiff candidates for one retail TU; this does not award source matches."""
import csv
import sqlite3
import sys
from pathlib import Path
sys.path.insert(0, 'tools')
from link import read_tsv

database, tu = sys.argv[1:]
addresses = {int(r['addr'], 16) for r in read_tsv('data/tu_map.tsv') if r['tu'] == tu}
assert addresses, 'Unknown retail TU'
connection = sqlite3.connect(Path(database).resolve().as_uri()+'?mode=ro', uri=True)
rows = connection.execute('SELECT address1,address2,similarity,confidence FROM function ORDER BY address1')
writer = csv.writer(sys.stdout, delimiter='\t', lineterminator='\n')
writer.writerow(('retail','reference','similarity','confidence','status'))
for a,b,similarity,confidence in rows:
    if a in addresses:
        writer.writerow((hex(a),hex(b),round(similarity,6),round(confidence,6),'CANDIDATE; retail source referee required'))
