"""Count current source objects whose emitted bodies all pass both referees."""
from collections import Counter, defaultdict
from pathlib import Path


def measure(tus, compared, bindings):
    objects = [Path(tu).stem + '.obj' for tu in tus]
    counts = Counter(objects)
    ambiguous = sum(count for count in counts.values() if count > 1)
    grouped = defaultdict(list)
    for row in compared:
        grouped[row['obj']].append(row)
    verified, empty = [], []
    for obj in objects:
        if counts[obj] > 1:
            continue
        rows = grouped[obj]
        if not rows:
            empty.append(obj)
            continue
        if all((binding := bindings.get(row['name'])) is not None
               and not binding['why'] and binding['obj'] == obj
               and (not row['hits'] or binding['t'] in row['hits'])
               and binding['n'] == row['size']
               for row in rows):
            verified.append(obj)
    return dict(current_source_tus_total=len(objects),
                current_source_tus_verified=len(verified),
                current_source_tus_without_emitted_bodies=len(empty),
                current_source_tus_ambiguous=ambiguous)


def selftest():
    compared = [dict(obj='a.obj', name='a', hits=['0x1000'], size=12)]
    bindings = dict(a=dict(obj='a.obj', t='0x1000', n=12, why=[]))
    assert measure(['a.cpp', 'b.cpp'], compared, bindings) == dict(
        current_source_tus_total=2, current_source_tus_verified=1,
        current_source_tus_without_emitted_bodies=1, current_source_tus_ambiguous=0)
    assert measure(['one/a.cpp', 'two/a.cpp'], compared, bindings)['current_source_tus_verified'] == 0
    assert measure(['one/a.cpp', 'two/a.cpp'], compared, bindings)['current_source_tus_ambiguous'] == 2
    assert measure(['a.cpp'], [dict(compared[0], hits=[])], bindings)['current_source_tus_verified'] == 1
    for change in (dict(why=['unverified callee']), dict(obj='other.obj'),
                   dict(n=11), dict(t='0x2000')):
        assert measure(['a.cpp'], compared, {'a': dict(bindings['a'], **change)})['current_source_tus_verified'] == 0
    assert measure(['a.cpp'], compared, {})['current_source_tus_verified'] == 0
    assert measure(['a.cpp'], compared + [dict(obj='a.obj', name='missing', hits=[], size=3)], bindings)['current_source_tus_verified'] == 0


if __name__ == '__main__':
    selftest()
    print('PASS current source TU metric positive and negative checks')
