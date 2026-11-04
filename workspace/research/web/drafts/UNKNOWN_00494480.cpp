/*
===========================================================================
Copyright (C) 1999-2005 Id Software, Inc.

This file is part of Quake III Arena source code.

Quake III Arena source code is free software; you can redistribute it
and/or modify it under the terms of the GNU General Public License as
published by the Free Software Foundation; either version 2 of the License,
or (at your option) any later version.

Quake III Arena source code is distributed in the hope that it will be
useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with Foobar; if not, write to the Free Software
Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
===========================================================================
*/
// tr_noise.c
/* Retail CoD2 noise implementation reconstructed from GPL-2.0+ Q3 tr_noise.c.
 * Retail 0x00494480..0x004947c0. Layout and original file owner are provisional.
 */
#include <math.h>
#include <stdlib.h>

#define NOISE_SIZE 256
#define NOISE_MASK ( NOISE_SIZE - 1 )

#define VAL( a ) s_noiseIndex[ ( a ) & ( NOISE_MASK )]
#define INDEX( x, y, z, t ) VAL( x + VAL( y + VAL( z + VAL( t ) ) ) )

static float s_noiseValue[NOISE_SIZE];
static int s_noiseIndex[NOISE_SIZE];

#define LERP( a, b, w ) ( a * ( 1.0f - w ) + b * w )

static float GetNoiseValue( int x, int y, int z, int t )
{
	int index = INDEX( ( int ) x, ( int ) y, ( int ) z, ( int ) t );

	return s_noiseValue[index];
}


void FUN_004944d0(void)
{
    int i, x;
    float r;
    for (i = 0; i < 256; ++i)
    {
        r = (float)rand();
        s_noiseValue[i] = (r / 32767.0f + r / 32767.0f) - 1.0;
        x = rand() * 256;
        s_noiseIndex[i] = (unsigned char)(x / 32768);
    }
}

float R_NoiseGet4f( float x, float y, float z, float t )
{
	int i;
	int ix, iy, iz, it;
	volatile double half;

	float fx, fy, fz, ft;
	float front[4];
	float back[4];
	float fvalue, bvalue, value[2], finalvalue;

	half = 0.4999999990686774;
	ix = ( int )( x - half );
	fx = x - ix;
	half = 0.4999999990686774;
	iy = ( int )( y - half );
	fy = y - iy;
	half = 0.4999999990686774;
	iz = ( int )( z - half );
	fz = z - iz;
	half = 0.4999999990686774;
	it = ( int )( t - half );
	ft = t - it;

	for ( i = 0; i < 2; i++ )
	{
		front[0] = GetNoiseValue( ix, iy, iz, it + i );
		front[1] = GetNoiseValue( ix+1, iy, iz, it + i );
		front[2] = GetNoiseValue( ix, iy+1, iz, it + i );
		front[3] = GetNoiseValue( ix+1, iy+1, iz, it + i );

		back[0] = GetNoiseValue( ix, iy, iz + 1, it + i );
		back[1] = GetNoiseValue( ix+1, iy, iz + 1, it + i );
		back[2] = GetNoiseValue( ix, iy+1, iz + 1, it + i );
		back[3] = GetNoiseValue( ix+1, iy+1, iz + 1, it + i );

		fvalue = LERP( LERP( front[0], front[1], fx ), LERP( front[2], front[3], fx ), fy );
		bvalue = LERP( LERP( back[0], back[1], fx ), LERP( back[2], back[3], fx ), fy );

		value[i] = LERP( fvalue, bvalue, fz );
	}

	finalvalue = LERP( value[0], value[1], ft );

	return finalvalue;
}
