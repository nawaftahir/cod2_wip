#include <fenv.h>
#define main worker_cubemap_fixture_main
#include "scratch/deepseek_cubemap_2/test_cubemap_generate.c"
#undef main

int main(void)
{
    double bias = 9.31322574615478515625e-10;
    assert(worker_cubemap_fixture_main() == 0);
    assert(fesetround(FE_TONEAREST) == 0);
    assert(Image_FloatToInt(127.5f) == 127);
    assert(lrint(127.5 + bias) == 128);
    assert(Image_FloatToInt(1.75f) == 1);
    assert(lrint(1.75 + bias) == 2);
    puts("CONFIRMED: cast truncation differs from nearest-round FISTP model; source remains DEFER");
    return 0;
}
