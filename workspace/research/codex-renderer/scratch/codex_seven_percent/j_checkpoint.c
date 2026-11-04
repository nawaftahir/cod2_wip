/* Target-proven data views; descriptive names, not historical struct claims. */
extern float *far_plane_dvar;
extern unsigned int far_plane_override_active;
extern unsigned char far_plane_override_enabled;
extern unsigned int far_plane_override_mode;
extern float far_plane_override_value;
extern float far_plane_zero;
extern float far_plane_minimum;

float Image_GetFarPlane(void)
{
    float value;

    value = far_plane_dvar[2];
    if (value == far_plane_zero && far_plane_override_active != 0
        && far_plane_override_enabled != 0 && far_plane_override_mode == 1)
    {
        value = far_plane_override_value;
    }
    if (value < far_plane_minimum)
    {
        value = far_plane_minimum;
    }
    return value;
}

/* Target stride68, DWORD writes only; omitted fields must remain untouched. */
void Image_InitRecords(int count, unsigned int *records)
{
    unsigned int *cursor;

    if (count > 0)
    {
        cursor = records + 5;
        do
        {
            cursor[-2] = 0;
            cursor[-1] = 0;
            cursor[0] = 0x3f800000;
            cursor[6] = 0;
            cursor[7] = 0x3f800000;
            cursor[8] = 0;
            cursor[9] = 0x3f800000;
            cursor[10] = 0;
            cursor[11] = 0;
            cursor += 17;
            count -= 1;
        } while (count != 0);
    }
}
