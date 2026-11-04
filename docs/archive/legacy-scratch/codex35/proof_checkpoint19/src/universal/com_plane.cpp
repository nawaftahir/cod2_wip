#include "../qcommon/qcommon.h"

// Candidate TU split; no claim about the original source organization.
#pragma intrinsic(fabs)
int IntersectPlanes( const float **plane, vec3_t xyz )
{
	double v[3];
	double det;
	double invDet;

	v[0] = plane[0][0] * (plane[1][1] * plane[2][2] - plane[2][1] * plane[1][2]);
	v[1] = plane[1][0] * (plane[2][1] * plane[0][2] - plane[0][1] * plane[2][2]);
	v[2] = plane[2][0] * (plane[0][1] * plane[1][2] - plane[1][1] * plane[0][2]);
	det = v[0] + v[1] + v[2];

	if ( fabs(det) < 0.001f )
	{
		return 0;
	}

	invDet = 1.0f / det;

	v[0] = plane[0][3] * (plane[1][1] * plane[2][2] - plane[2][1] * plane[1][2]);
	v[1] = plane[1][3] * (plane[2][1] * plane[0][2] - plane[0][1] * plane[2][2]);
	v[2] = plane[2][3] * (plane[0][1] * plane[1][2] - plane[1][1] * plane[0][2]);
	xyz[0] = (v[0] + v[1] + v[2]) * invDet;

	v[0] = plane[0][3] * (plane[1][2] * plane[2][0] - plane[2][2] * plane[1][0]);
	v[1] = plane[1][3] * (plane[2][2] * plane[0][0] - plane[0][2] * plane[2][0]);
	v[2] = plane[2][3] * (plane[0][2] * plane[1][0] - plane[1][2] * plane[0][0]);
	xyz[1] = (v[0] + v[1] + v[2]) * invDet;

	v[0] = plane[0][3] * (plane[1][0] * plane[2][1] - plane[2][0] * plane[1][1]);
	v[1] = (plane[2][0] * plane[0][1] - plane[0][0] * plane[2][1]) * plane[1][3];
	v[2] = plane[2][3] * (plane[0][0] * plane[1][1] - plane[1][0] * plane[0][1]);
	xyz[2] = (v[0] + v[1] + v[2]) * invDet;

	return 1;
}
