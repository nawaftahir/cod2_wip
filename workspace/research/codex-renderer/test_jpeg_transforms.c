#include <assert.h>

extern void jpeg_fdct_float(float *data);
extern void jpeg_fdct_islow(int *data);
extern void jpeg_fdct_ifast(int *data);

int main(void)
{
    float floating[64];
    int integer[64];
    int fast[64];
    int i;
    int sum;

    for (i = 0; i < 64; i += 1)
    {
        floating[i] = 0.0f;
        integer[i] = 0;
        fast[i] = 0;
    }
    jpeg_fdct_float(floating);
    jpeg_fdct_islow(integer);
    jpeg_fdct_ifast(fast);
    for (i = 0; i < 64; i += 1)
    {
        assert(floating[i] == 0.0f && integer[i] == 0 && fast[i] == 0);
        floating[i] = 3.0f;
        integer[i] = 3;
        fast[i] = 3;
    }
    jpeg_fdct_float(floating);
    jpeg_fdct_islow(integer);
    jpeg_fdct_ifast(fast);
    assert(floating[0] == 192.0f && integer[0] == 192 && fast[0] == 192);
    for (i = 1; i < 64; i += 1)
    {
        assert(floating[i] == 0.0f && integer[i] == 0 && fast[i] == 0);
    }
    sum = 0;
    for (i = 0; i < 64; i += 1)
    {
        integer[i] = i - 32;
        floating[i] = (float)integer[i];
        fast[i] = integer[i];
        sum += integer[i];
    }
    jpeg_fdct_float(floating);
    jpeg_fdct_islow(integer);
    jpeg_fdct_ifast(fast);
    assert(integer[0] == sum && floating[0] == (float)sum && fast[0] == sum);
    return 0;
}
