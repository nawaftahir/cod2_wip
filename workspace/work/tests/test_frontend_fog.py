"""Exercise the actual front-end fog setter, including byte casts and NaNs."""
from pathlib import Path
import subprocess
import tempfile

root = Path(__file__).resolve().parent.parent / 'src'
source = (root / 'gfx_d3d/r_fog.cpp').read_text()
source = source[source.index('void R_SetFog('):source.index('void R_SwitchFog(')]
program = r'''
#include <cassert>
#include <cmath>
#include <cstring>
#include <limits>
typedef unsigned char byte;
enum GfxFogOffset { NONE, LINEAR, EXP };
union Color { byte array[4]; unsigned packed; };
struct GfxFog {
    GfxFogOffset techniqueOffset;
    int startTime, finishTime;
    Color color;
    float fogStart, fogEnd, density;
    byte registered, drawSky, clearScreen;
};
struct { GfxFog fogSettings[5]; } rg;
'''
program += source
program += r'''
int main() {
    const float densities[] = {-1, 0, .5f, std::nextafter(1.f, 0.f), 1, 2,
        std::numeric_limits<float>::infinity(),
        std::numeric_limits<float>::quiet_NaN()};
    const int colors[] = {-1, 0, 1, 127, 255, 256, 32767};
    for (int slot = 0; slot < 5; ++slot)
    for (float density : densities)
    for (int r : colors) for (int g : colors) for (int b : colors) {
        memset(&rg, 0x5a, sizeof(rg));
        GfxFog before[5]; memcpy(before, rg.fogSettings, sizeof(before));
        R_SetFog(slot, -3.5f, 100.f, r, g, b, density);
        const GfxFog &fog = rg.fogSettings[slot];
        assert(fog.color.array[0] == (byte)b);
        assert(fog.color.array[1] == (byte)g);
        assert(fog.color.array[2] == (byte)r && fog.color.array[3] == 255);
        assert(fog.fogStart == -3.5f && fog.fogEnd == 100.f);
        assert(fog.registered == 1 && fog.drawSky == 1 && fog.clearScreen == 0);
        assert(fog.startTime == before[slot].startTime);
        assert(fog.finishTime == before[slot].finishTime);
        assert(fog.techniqueOffset == (density >= 1.f ? LINEAR : EXP));
        float expected = density >= 1.f ? 1.f : density;
        assert(fog.density == expected || (std::isnan(fog.density) && std::isnan(expected)));
        for (int other = 0; other < 5; ++other)
            if (other != slot) assert(!memcmp(&rg.fogSettings[other], &before[other], sizeof(GfxFog)));
    }
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_frontend_fog_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-std=c++11', '-O2', '-x', 'c++', '-', '-o', binary],
                   input=program, text=True, check=True)
    subprocess.run([binary], check=True)
print('PASS: 13,720 actual fog-setter cases, colors, boundaries, NaN and untouched slots')
