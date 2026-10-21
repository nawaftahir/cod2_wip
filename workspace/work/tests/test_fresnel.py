"""Exercise actual Fresnel source against an independent optical formula."""
from pathlib import Path
import subprocess
import tempfile

source = (Path(__file__).resolve().parents[1] / 'src/gfx_d3d/r_utils.cpp').read_text()
begin = source.index('float FresnelTerm(')
end = source.index('\n}', begin) + 2
program = '#include <cmath>\n#include <cassert>\n#include <limits>\n#include <cstdio>\n' + source[begin:end] + r'''
double oracle(double n0, double n1, double c) {
    if (n0 == n1) return 0;
    double s2 = (n0 / n1) * (n0 / n1) * (1 - c * c);
    if (s2 >= 1) return 1;
    double t = sqrt(1 - s2);
    double rs = (n0 * c - n1 * t) / (n0 * c + n1 * t);
    double rp = (n1 * c - n0 * t) / (n1 * c + n0 * t);
    return .5 * (rs * rs + rp * rp);
}
int main() {
    const float indices[] = {.8f, 1.f, 1.333f, 1.5f};
    const float cosines[] = {0.f, .1f, .25f, .5f, .75f, .99f};
    int cases = 0;
    for (float n0 : indices) for (float n1 : indices) for (float c : cosines) {
        float actual = FresnelTerm(n0, n1, c);
        // The retail angle formula returns zero at grazing total reflection.
        double expected = c == 0 && n0 >= n1 ? 0 : oracle(n0, n1, c);
        assert(std::isfinite(actual) && actual >= 0 && actual <= 1);
        if (!(fabs(actual - expected) < .00002)) {
            fprintf(stderr, "n0=%g n1=%g cosine=%g actual=%.9g expected=%.9g\n", n0,n1,c,actual,expected);
            assert(false);
        }
        assert(FresnelTerm(n0, n1, -c) == actual);
        ++cases;
    }
    const float nan = std::numeric_limits<float>::quiet_NaN();
    assert(std::isnan(FresnelTerm(1, 1.333f, nan)));
    assert(std::isnan(FresnelTerm(1, 1.333f, 1)));
    assert(std::isnan(FresnelTerm(1, 1.333f, -1)));
    assert(std::isnan(FresnelTerm(1, 1.333f, 2)));
    assert(std::isnan(FresnelTerm(0, 0, .5f)));
    assert(FresnelTerm(1.5f, 1, .25f) == 1);
    assert(cases == 96);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_fresnel_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-std=c++11', '-O2', '-x', 'c++', '-', '-o', binary],
                   input=program, text=True, check=True)
    subprocess.run([binary], check=True)
print('PASS: 96 Fresnel oracle cases, sign symmetry, total reflection and preserved NaNs')
