#include <assert.h>
#include <math.h>
#include "scratch/codex_seven_percent/j_checkpoint.c"

float dvar_values[3];
float *far_plane_dvar = dvar_values;
unsigned int far_plane_override_active;
unsigned char far_plane_override_enabled;
unsigned int far_plane_override_mode;
float far_plane_override_value = 50.0f;
float far_plane_zero;
float far_plane_minimum = 10.0f;

int main(void)
{
    unsigned int records[34];
    unsigned int indices[9] = {3, 4, 5, 11, 12, 13, 14, 15, 16};
    unsigned int values[9] = {0, 0, 0x3f800000, 0, 0x3f800000,
                              0, 0x3f800000, 0, 0};
    int i, j, record, changed;

    for (i = 0; i < 34; i += 1)
    {
        records[i] = 0xdeadbeef;
    }
    Image_InitRecords(-1, records);
    Image_InitRecords(0, records);
    for (i = 0; i < 34; i += 1)
    {
        assert(records[i] == 0xdeadbeef);
    }
    Image_InitRecords(2, records);
    for (record = 0; record < 2; record += 1)
    {
        for (i = 0; i < 17; i += 1)
        {
            changed = 0;
            for (j = 0; j < 9; j += 1)
            {
                if ((unsigned int)i == indices[j])
                {
                    assert(records[record * 17 + i] == values[j]);
                    changed = 1;
                }
            }
            if (!changed)
            {
                assert(records[record * 17 + i] == 0xdeadbeef);
            }
        }
    }
    dvar_values[2] = 20.0f;
    assert(Image_GetFarPlane() == 20.0f);
    dvar_values[2] = -5.0f;
    assert(Image_GetFarPlane() == 10.0f);
    dvar_values[2] = 0.0f;
    for (i = 0; i < 8; i += 1)
    {
        far_plane_override_active = i & 1;
        far_plane_override_enabled = (unsigned char)((i >> 1) & 1);
        far_plane_override_mode = (i >> 2) & 1;
        assert(Image_GetFarPlane() == (i == 7 ? 50.0f : 10.0f));
    }
    far_plane_override_mode = 2;
    assert(Image_GetFarPlane() == 10.0f);
    dvar_values[2] = -0.0f;
    far_plane_override_mode = 1;
    assert(Image_GetFarPlane() == 50.0f);
    dvar_values[2] = NAN;
    assert(isnan(Image_GetFarPlane()));
    dvar_values[2] = INFINITY;
    assert(isinf(Image_GetFarPlane()));
    return 0;
}
