/* Retail-exact reconstruction of R_NoiseInit (89 B) from original code behavior.
 * The original TU boundary and two related noise routines remain unverified.
 * Historical reference: id-Software/Quake-III-Arena, code/renderer/tr_noise.c
 * (GPL-2.0-or-later); this numeric permutation conversion is retail-specific.
 */
#include <stdlib.h>
#include "com_math.h"

#define NOISE_SIZE 256
#define NOISE_MASK ( NOISE_SIZE - 1 )

#define VAL( a ) s_noiseIndex[ ( a ) & ( NOISE_MASK ) ]
#define INDEX( x, y, z, t ) VAL( x + VAL( y + VAL( z + VAL( t ) ) ) )
#define LERP( a, b, w ) ( a * ( 1.0f - w ) + b * w )

static int s_noiseIndex[NOISE_SIZE];
static float s_noiseValue[NOISE_SIZE];

static X87_FLOOR_FUNC(NoiseFloor)

static float GetNoiseValue( int x, int y, int z, int t )
{
    int index = INDEX( x, y, z, t );
    return s_noiseValue[index];
}

extern "C" void FUN_004944d0(void)
{
    for (int i = 0; i < 256; ++i)
    {
        float r = (float)rand();
        s_noiseValue[i] = (r / 32767.0f + r / 32767.0f) - 1.0;
        int x = rand() * 256;
        s_noiseIndex[i] = (unsigned char)(x / 32768);
    }
}

float FUN_00494530( float x, float y, float z, float t )
{
    int i;
    int ix, iy, iz, it;
    float fx, fy, fz, ft;
    float front[4];
    float back[4];
    float fvalue, bvalue, value[2], finalvalue;

    ix = NoiseFloor( x );
    fx = x - ix;
    iy = NoiseFloor( y );
    fy = y - iy;
    iz = NoiseFloor( z );
    fz = z - iz;
    it = NoiseFloor( t );
    ft = t - it;

    for ( i = 0; i < 2; i++ )
    {
        front[0] = GetNoiseValue( ix, iy, iz, it + i );
        front[1] = GetNoiseValue( ix + 1, iy, iz, it + i );
        front[2] = GetNoiseValue( ix, iy + 1, iz, it + i );
        front[3] = GetNoiseValue( ix + 1, iy + 1, iz, it + i );

        back[0] = GetNoiseValue( ix, iy, iz + 1, it + i );
        back[1] = GetNoiseValue( ix + 1, iy, iz + 1, it + i );
        back[2] = GetNoiseValue( ix, iy + 1, iz + 1, it + i );
        back[3] = GetNoiseValue( ix + 1, iy + 1, iz + 1, it + i );

        fvalue = lerp( lerp( front[0], front[1], fx ), lerp( front[2], front[3], fx ), fy );
        bvalue = lerp( lerp( back[0], back[1], fx ), lerp( back[2], back[3], fx ), fy );

        value[i] = lerp( fvalue, bvalue, fz );
    }

    finalvalue = lerp( value[0], value[1], ft );

    return finalvalue;
}
