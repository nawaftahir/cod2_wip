/* Analysis-only differential fixture: unchanged anchor code, no DLL entry. */
#define TARGET_ORACLE_NO_MAIN
#include "scratch/codex_dxerr_switch/target_oracle.c"
#define JPEG_INTERNALS
#include "scratch/jpeg_bgr/jpeglib.h"
#include "scratch/jpeg_bgr/jdct.h"

typedef void (*Transform)(j_decompress_ptr, jpeg_component_info *, JCOEFPTR,
                          JSAMPARRAY, JDIMENSION);

int main(int argc, char **argv)
{
    struct jpeg_decompress_struct info;
    jpeg_component_info component;
    unsigned char *image;
    unsigned int mapped_size;
    JSAMPLE limits[1408], expected[8][12], actual[8][12];
    JSAMPROW expected_rows[8], actual_rows[8];
    JCOEF coefficients[64];
    ISLOW_MULT_TYPE integer_quant[64];
    FLOAT_MULT_TYPE float_quant[64];
    const double scale[8] = {1.0, 1.387039845, 1.306562965, 1.175875602,
                            1.0, 0.785694958, 0.541196100, 0.275899379};
    Transform host[3] = {jpeg_idct_islow, jpeg_idct_float, jpeg_idct_4x4};
    Transform target[3];
    unsigned short saved_cw, test_cw = 0x027f;
    uint32_t seed = 2005;
    int method, trial, i, row, col, mismatches = 0;

    assert(argc == 2 && sizeof(void *) == 4);
    image = load_anchor(argv[1], &mapped_size);
    target[0] = (Transform)(uintptr_t)0x10054020;
    target[1] = (Transform)(uintptr_t)0x10053800;
    target[2] = (Transform)(uintptr_t)0x10054550;
    memset(&info, 0, sizeof(info));
    memset(&component, 0, sizeof(component));
    memset(limits, 0, sizeof(limits));
    info.sample_range_limit = limits + 256;
    for (i = 0; i < 256; i += 1)
    {
        info.sample_range_limit[i] = (JSAMPLE)i;
    }
    memset(limits + 512, 255, 384);
    memcpy(limits + 1280, info.sample_range_limit, 128);
    for (i = 0; i < 64; i += 1)
    {
        integer_quant[i] = 1;
        float_quant[i] = (FLOAT_MULT_TYPE)(scale[i / 8] * scale[i % 8]);
    }
    for (i = 0; i < 8; i += 1)
    {
        expected_rows[i] = expected[i];
        actual_rows[i] = actual[i];
    }
    __asm__ volatile("fnstcw %0" : "=m"(saved_cw));
    __asm__ volatile("fldcw %0" : : "m"(test_cw));
    for (method = 0; method < 3; method += 1)
    {
        component.dct_table = method == 1 ? (void *)float_quant : (void *)integer_quant;
        for (trial = 0; trial < 96; trial += 1)
        {
            memset(coefficients, 0, sizeof(coefficients));
            if (trial > 0 && trial <= 33)
            {
                coefficients[0] = (JCOEF)((trial - 17) * 32);
            }
            else if (trial > 33)
            {
                for (i = 0; i < 64; i += 1)
                {
                    seed = seed * 1664525u + 1013904223u;
                    coefficients[i] = (JCOEF)((int)(seed % 49) - 24);
                }
            }
            memset(expected, 0xa5, sizeof(expected));
            memset(actual, 0xa5, sizeof(actual));
            host[method](&info, &component, coefficients, expected_rows, 2);
            target[method](&info, &component, coefficients, actual_rows, 2);
            for (row = 0; row < 8; row += 1)
            {
                for (col = 0; col < 12; col += 1)
                {
                    if (expected[row][col] != actual[row][col])
                    {
                        mismatches += 1;
                    }
                    if (trial == 0 && row < (method == 2 ? 4 : 8)
                            && col >= 2 && col < (method == 2 ? 6 : 10))
                    {
                        assert(actual[row][col] == 128);
                    }
                }
            }
        }
    }
    __asm__ volatile("fldcw %0" : : "m"(saved_cw));
    assert(munmap(image, mapped_size) == 0);
    printf("288 actual-target IDCT cases; %d differing bytes; CW027F explicitly set\n", mismatches);
    return mismatches != 0;
}
