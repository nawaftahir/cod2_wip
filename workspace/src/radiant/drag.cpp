#include <math.h>

void AxializeVector(float *v)
{
    float a[3];
    int i;

    if (!v[0] && !v[1])
        return;
    if (!v[1] && !v[2])
        return;
    if (!v[0] && !v[2])
        return;

    for (i = 0; i < 3; i++)
        a[i] = (float)fabs(v[i]);
    if (a[0] > a[1] && a[0] > a[2])
        i = 0;
    else if (a[1] > a[0] && a[1] > a[2])
        i = 1;
    else
        i = 2;

    float o = v[i];
    v[0] = 0;
    v[1] = 0;
    v[2] = 0;
    if (o < 0)
        v[i] = -1;
    else
        v[i] = 1;
}
