#include <math.h>
#include <string.h>
#include "q_shared.h"
#include "assertive.h"

#undef IS_NAN
static const int nanmask = 255 << 23;
#define IS_NAN(x) (((*(int *)&(x)) & nanmask) == nanmask)

extern "C" int Vec3MajorAxis( const float *dir );

struct linmap_t
{
	double a[3][3];
	double lu[3][3];
	int pivot[3];
	int axis[3];
};

/* LU decomposition with row scaling and partial pivoting */
static bool FUN_00493c10( double ( *a )[3], int *pivot )
{
	double scale[3];
	int i, j, k, imax;
	double big, sum, tmp;

	for ( i = 0; i < 3; i++ )
	{
		big = 0.0;
		for ( j = 0; j < 3; j++ )
		{
			tmp = fabs( a[i][j] );
			if ( big < tmp )
				big = tmp;
		}
		if ( big == 0.0 )
			return false;
		scale[i] = 1.0 / big;
	}

	imax = 0;
	for ( j = 0; j < 3; j++ )
	{
		for ( i = 0; i < j; i++ )
		{
			sum = a[i][j];
			for ( k = 0; k < i; k++ )
				sum -= a[i][k] * a[k][j];
			a[i][j] = sum;
		}

		big = 0.0;
		for ( i = j; i < 3; i++ )
		{
			sum = a[i][j];
			for ( k = 0; k < j; k++ )
				sum -= a[i][k] * a[k][j];
			a[i][j] = sum;

			tmp = fabs( sum ) * scale[i];
			if ( big < tmp )
			{
				big = tmp;
				imax = i;
			}
		}

		if ( a[imax][j] == 0.0 )
			return false;

		if ( j != imax )
		{
			for ( k = 0; k < 3; k++ )
			{
				tmp = a[imax][k];
				a[imax][k] = a[j][k];
				a[j][k] = tmp;
			}
			scale[imax] = scale[j];
		}

		pivot[j] = imax;
		if ( j == 2 )
			return true;

		tmp = 1.0 / a[j][j];
		for ( i = j + 1; i < 3; i++ )
			a[i][j] *= tmp;
	}

	return true;
}

/* solves lu * x = b in place */
static void FUN_00494000( const double ( *lu )[3], const int *pivot, double *b )
{
	int i, j, first;
	double sum;

	first = -1;
	for ( i = 0; i < 3; i++ )
	{
		sum = b[pivot[i]];
		b[pivot[i]] = b[i];
		if ( first >= 0 )
		{
			for ( j = first; j < i; j++ )
				sum -= lu[i][j] * b[j];
		}
		else if ( sum != 0.0 )
		{
			first = i;
		}
		b[i] = sum;
	}

	for ( i = 2; i >= 0; i-- )
	{
		sum = b[i];
		for ( j = i + 1; j < 3; j++ )
			sum -= lu[i][j] * b[j];
		b[i] = sum / lu[i][i];
	}
}

/* one step of iterative refinement */
static void FUN_004941f0( const double ( *a )[3], const double *b, double *x, const double ( *lu )[3], const int *pivot )
{
	double r[3];
	int i, j;
	double sum;

	for ( i = 0; i < 3; i++ )
	{
		sum = -b[i];
		for ( j = 0; j < 3; j++ )
			sum += a[i][j] * x[j];
		r[i] = sum;
	}

	FUN_00494000( lu, pivot, r );

	for ( i = 0; i < 3; i++ )
		x[i] -= r[i];
}

static void FUN_00494260( const int *pivot, float *vec, const double ( *lu )[3], const double ( *a )[3], float b0, float b1, float b2, int ix, int iy, int iz )
{
	double x[3];
	double b[3];

	x[0] = b[0] = b0;
	x[1] = b[1] = b1;
	x[2] = b[2] = b2;

	FUN_00494000( lu, pivot, x );
	FUN_004941f0( a, b, x, lu, pivot );

	vec[ix] = (float)x[0];
	vec[iy] = (float)x[1];
	vec[iz] = 0.0f;
	vec[3] = (float)x[2];

#line 159
	assert(!IS_NAN((vec)[0]) && !IS_NAN((vec)[1]) && !IS_NAN((vec)[2]) && !IS_NAN((vec)[3]));
}

bool FUN_00494360( linmap_t *s, const float *normal, const float *p2, const float *p0, const float *p1 )
{
	s->axis[2] = Vec3MajorAxis( normal );
	s->axis[1] = ~s->axis[2] & 2;
	s->axis[0] = ~s->axis[2] & 1;

	s->a[0][0] = p0[s->axis[0]];
	s->a[0][1] = p0[s->axis[1]];
	s->a[0][2] = 1.0;
	s->a[1][0] = p1[s->axis[0]];
	s->a[1][1] = p1[s->axis[1]];
	s->a[1][2] = 1.0;
	s->a[2][0] = p2[s->axis[0]];
	s->a[2][1] = p2[s->axis[1]];
	s->a[2][2] = 1.0;

	memcpy( s->lu, s->a, sizeof( s->a ) );
	return FUN_00493c10( s->lu, s->pivot );
}

void FUN_00494400( linmap_t *s, float *out, float b0, float b1, float b2 )
{
#line 189
	assert( s );

	FUN_00494260( s->pivot, out, s->lu, s->a, b0, b1, b2, s->axis[0], s->axis[1], s->axis[2] );
}
