#include "q_shared.h"

void PerpendicularVector( const vec3_t src, vec3_t dst );

const vec2_t vec2_origin = { 0, 0 };
const vec3_t vec3_origin = { 0, 0, 0 };
const vec4_t vec4_origin = { 0, 0, 0, 0 };

vec3_t bytedirs[] =
{
	{ -0.52573103,  0.0,  0.85065103 },
	{ -0.44286299,  0.238856,  0.86418802 },
	{ -0.29524201,  0.0,  0.955423 },
	{ -0.309017,  0.5,  0.809017 },
	{ -0.16246,  0.26286599,  0.951056 },
	{  0.0,  0.0,  1.0 },
	{  0.0,  0.85065103,  0.52573103 },
	{ -0.14762101,  0.71656698,  0.68171799 },
	{  0.14762101,  0.71656698,  0.68171799 },
	{  0.0,  0.52573103,  0.85065103 },
	{  0.309017,  0.5,  0.809017 },
	{  0.52573103,  0.0,  0.85065103 },
	{  0.29524201,  0.0,  0.955423 },
	{  0.44286299,  0.238856,  0.86418802 },
	{  0.16246,  0.26286599,  0.951056 },
	{ -0.68171799,  0.14762101,  0.71656698 },
	{ -0.809017,  0.309017,  0.5 },
	{ -0.58778501,  0.42532501,  0.688191 },
	{ -0.85065103,  0.52573103,  0.0 },
	{ -0.86418802,  0.44286299,  0.238856 },
	{ -0.71656698,  0.68171799,  0.14762101 },
	{ -0.688191,  0.58778501,  0.42532501 },
	{ -0.5,  0.809017,  0.309017 },
	{ -0.238856,  0.86418802,  0.44286299 },
	{ -0.42532501,  0.688191,  0.58778501 },
	{ -0.71656698,  0.68171799, -0.14762101 },
	{ -0.5,  0.809017, -0.309017 },
	{ -0.52573103,  0.85065103,  0.0 },
	{  0.0,  0.85065103, -0.52573103 },
	{ -0.238856,  0.86418802, -0.44286299 },
	{  0.0,  0.955423, -0.29524201 },
	{ -0.26286599,  0.951056, -0.16246 },
	{  0.0,  1.0,  0.0 },
	{  0.0,  0.955423,  0.29524201 },
	{ -0.26286599,  0.951056,  0.16246 },
	{  0.238856,  0.86418802,  0.44286299 },
	{  0.26286599,  0.951056,  0.16246 },
	{  0.5,  0.809017,  0.309017 },
	{  0.238856,  0.86418802, -0.44286299 },
	{  0.26286599,  0.951056, -0.16246 },
	{  0.5,  0.809017, -0.309017 },
	{  0.85065103,  0.52573103,  0.0 },
	{  0.71656698,  0.68171799,  0.14762101 },
	{  0.71656698,  0.68171799, -0.14762101 },
	{  0.52573103,  0.85065103,  0.0 },
	{  0.42532501,  0.688191,  0.58778501 },
	{  0.86418802,  0.44286299,  0.238856 },
	{  0.688191,  0.58778501,  0.42532501 },
	{  0.809017,  0.309017,  0.5 },
	{  0.68171799,  0.14762101,  0.71656698 },
	{  0.58778501,  0.42532501,  0.688191 },
	{  0.955423,  0.29524201,  0.0 },
	{  1.0,  0.0,  0.0 },
	{  0.951056,  0.16246,  0.26286599 },
	{  0.85065103, -0.52573103,  0.0 },
	{  0.955423, -0.29524201,  0.0 },
	{  0.86418802, -0.44286299,  0.238856 },
	{  0.951056, -0.16246,  0.26286599 },
	{  0.809017, -0.309017,  0.5 },
	{  0.68171799, -0.14762101,  0.71656698 },
	{  0.85065103,  0.0,  0.52573103 },
	{  0.86418802,  0.44286299, -0.238856 },
	{  0.809017,  0.309017, -0.5 },
	{  0.951056,  0.16246, -0.26286599 },
	{  0.52573103,  0.0, -0.85065103 },
	{  0.68171799,  0.14762101, -0.71656698 },
	{  0.68171799, -0.14762101, -0.71656698 },
	{  0.85065103,  0.0, -0.52573103 },
	{  0.809017, -0.309017, -0.5 },
	{  0.86418802, -0.44286299, -0.238856 },
	{  0.951056, -0.16246, -0.26286599 },
	{  0.14762101,  0.71656698, -0.68171799 },
	{  0.309017,  0.5, -0.809017 },
	{  0.42532501,  0.688191, -0.58778501 },
	{  0.44286299,  0.238856, -0.86418802 },
	{  0.58778501,  0.42532501, -0.688191 },
	{  0.688191,  0.58778501, -0.42532501 },
	{ -0.14762101,  0.71656698, -0.68171799 },
	{ -0.309017,  0.5, -0.809017 },
	{  0.0,  0.52573103, -0.85065103 },
	{ -0.52573103,  0.0, -0.85065103 },
	{ -0.44286299,  0.238856, -0.86418802 },
	{ -0.29524201,  0.0, -0.955423 },
	{ -0.16246,  0.26286599, -0.951056 },
	{  0.0,  0.0, -1.0 },
	{  0.29524201,  0.0, -0.955423 },
	{  0.16246,  0.26286599, -0.951056 },
	{ -0.44286299, -0.238856, -0.86418802 },
	{ -0.309017, -0.5, -0.809017 },
	{ -0.16246, -0.26286599, -0.951056 },
	{  0.0, -0.85065103, -0.52573103 },
	{ -0.14762101, -0.71656698, -0.68171799 },
	{  0.14762101, -0.71656698, -0.68171799 },
	{  0.0, -0.52573103, -0.85065103 },
	{  0.309017, -0.5, -0.809017 },
	{  0.44286299, -0.238856, -0.86418802 },
	{  0.16246, -0.26286599, -0.951056 },
	{  0.238856, -0.86418802, -0.44286299 },
	{  0.5, -0.809017, -0.309017 },
	{  0.42532501, -0.688191, -0.58778501 },
	{  0.71656698, -0.68171799, -0.14762101 },
	{  0.688191, -0.58778501, -0.42532501 },
	{  0.58778501, -0.42532501, -0.688191 },
	{  0.0, -0.955423, -0.29524201 },
	{  0.0, -1.0,  0.0 },
	{  0.26286599, -0.951056, -0.16246 },
	{  0.0, -0.85065103,  0.52573103 },
	{  0.0, -0.955423,  0.29524201 },
	{  0.238856, -0.86418802,  0.44286299 },
	{  0.26286599, -0.951056,  0.16246 },
	{  0.5, -0.809017,  0.309017 },
	{  0.71656698, -0.68171799,  0.14762101 },
	{  0.52573103, -0.85065103,  0.0 },
	{ -0.238856, -0.86418802, -0.44286299 },
	{ -0.5, -0.809017, -0.309017 },
	{ -0.26286599, -0.951056, -0.16246 },
	{ -0.85065103, -0.52573103,  0.0 },
	{ -0.71656698, -0.68171799, -0.14762101 },
	{ -0.71656698, -0.68171799,  0.14762101 },
	{ -0.52573103, -0.85065103,  0.0 },
	{ -0.5, -0.809017,  0.309017 },
	{ -0.238856, -0.86418802,  0.44286299 },
	{ -0.26286599, -0.951056,  0.16246 },
	{ -0.86418802, -0.44286299,  0.238856 },
	{ -0.809017, -0.309017,  0.5 },
	{ -0.688191, -0.58778501,  0.42532501 },
	{ -0.68171799, -0.14762101,  0.71656698 },
	{ -0.44286299, -0.238856,  0.86418802 },
	{ -0.58778501, -0.42532501,  0.688191 },
	{ -0.309017, -0.5,  0.809017 },
	{ -0.14762101, -0.71656698,  0.68171799 },
	{ -0.42532501, -0.688191,  0.58778501 },
	{ -0.16246, -0.26286599,  0.951056 },
	{  0.44286299, -0.238856,  0.86418802 },
	{  0.16246, -0.26286599,  0.951056 },
	{  0.309017, -0.5,  0.809017 },
	{  0.14762101, -0.71656698,  0.68171799 },
	{  0.0, -0.52573103,  0.85065103 },
	{  0.42532501, -0.688191,  0.58778501 },
	{  0.58778501, -0.42532501,  0.688191 },
	{  0.688191, -0.58778501,  0.42532501 },
	{ -0.955423,  0.29524201,  0.0 },
	{ -0.951056,  0.16246,  0.26286599 },
	{ -1.0,  0.0,  0.0 },
	{ -0.85065103,  0.0,  0.52573103 },
	{ -0.955423, -0.29524201,  0.0 },
	{ -0.951056, -0.16246,  0.26286599 },
	{ -0.86418802,  0.44286299, -0.238856 },
	{ -0.951056,  0.16246, -0.26286599 },
	{ -0.809017,  0.309017, -0.5 },
	{ -0.86418802, -0.44286299, -0.238856 },
	{ -0.951056, -0.16246, -0.26286599 },
	{ -0.809017, -0.309017, -0.5 },
	{ -0.68171799,  0.14762101, -0.71656698 },
	{ -0.68171799, -0.14762101, -0.71656698 },
	{ -0.85065103,  0.0, -0.52573103 },
	{ -0.688191,  0.58778501, -0.42532501 },
	{ -0.58778501,  0.42532501, -0.688191 },
	{ -0.42532501,  0.688191, -0.58778501 },
	{ -0.42532501, -0.688191, -0.58778501 },
	{ -0.58778501, -0.42532501, -0.688191 },
	{ -0.688191, -0.58778501, -0.42532501 }
};

static unsigned int holdrand = 0x89abcdef;

// golden-angle rotation used to spread points along a spiral
#define GOLDEN_SIN -0.67549032f
#define GOLDEN_COS -0.73736888f

/*
==============
randomf
==============
*/
float randomf()
{
	return rand() / 2147483648.0f;
}

/*
==============
crandom
==============
*/
float crandom()
{
	return randomf() * 2.0f - 1.0f;
}
















float LinearTrack( float tgt, float cur, float rate, float deltaTime );




/*
==============
DiffTrack

Moves cur toward tgt in proportion to the remaining error.
==============
*/
float DiffTrack( float tgt, float cur, float rate, float deltaTime )
{
	float err;
	float step;

	err = tgt - cur;
	step = rate * err * deltaTime;

	if ( I_fabs(err) > 0.001f )
	{
		if ( I_fabs(err) < I_fabs(step) )
			return tgt;
		else
			return cur + step;
	}
	else
		return tgt;
}





/*
==============
Q_log2
==============
*/
int Q_log2( int val )
{
	int answer;

	answer = 0;

	while ( val >>= 1 )
		answer++;

	return answer;
}







/*
==============
DirToByte
==============
*/
byte DirToByte( const vec3_t dir )
{
	byte i;
	byte best;
	float d;
	float bestd;

	if ( !dir )
	{
		return 0;
	}

	bestd = 0.0;
	best = 0;

	for ( i = 0; i < sizeof(bytedirs) / sizeof(bytedirs[0]); ++i )
	{
		d = DotProduct(dir, bytedirs[i]);

		if ( d > bestd )
		{
			bestd = d;
			best = i;
		}
	}

	return best;
}



/*
==============
VecNCompareCustomEpsilon
==============
*/
int VecNCompareCustomEpsilon( const float *v0, const float *v1, float epsilon, int coordCount )
{
	int i;

	for ( i = 0; i < coordCount; i++ )
	{
		if ( (v0[i] - v1[i]) * (v0[i] - v1[i]) > epsilon * epsilon )
			return 0;
	}

	return 1;
}

/*
==============
Vec3Distance
==============
*/
float Vec3Distance( const vec3_t v1, const vec3_t v2 )
{
	vec3_t dir;

	VectorSubtract(v2, v1, dir);
	return VectorLength(dir);
}

/*
==============
Vec3DistanceSq
==============
*/
float Vec3DistanceSq( const vec3_t v1, const vec3_t v2 )
{
	vec3_t dir;

	VectorSubtract(v2, v1, dir);
	return dir[0] * dir[0] + dir[1] * dir[1] + dir[2] * dir[2];
}



/*
==============
Vec2Distance
==============
*/
float Vec2Distance( const vec2_t v1, const vec2_t v2 )
{
	vec2_t dir;

	Vector2Subtract(v2, v1, dir);
	return Vec2Length(dir);
}

/*
==============
Vec2DistanceSq
==============
*/
float Vec2DistanceSq( const vec2_t v1, const vec2_t v2 )
{
	vec2_t dir;

	Vector2Subtract(v2, v1, dir);
	return dir[0] * dir[0] + dir[1] * dir[1];
}

/*
==============
Vec3Cross
==============
*/
void Vec3Cross( const vec3_t v0, const vec3_t v1, vec3_t cross )
{
	cross[0] = v0[1] * v1[2] - v0[2] * v1[1];
	cross[1] = v0[2] * v1[0] - v0[0] * v1[2];
	cross[2] = v0[0] * v1[1] - v0[1] * v1[0];
}



/*
==============
PickProjectionAxes

Picks the two axes of the plane most facing normal, wound to keep its facing.
==============
*/
void PickProjectionAxes( const vec3_t normal, int *i, int *j )
{
	vec3_t sq;

	Vec3Mul(normal, normal, sq);

	if ( sq[2] >= sq[0] && sq[2] >= sq[1] )
	{
		if ( normal[2] > 0 )
		{
			*i = 0;
			*j = 1;
		}
		else
		{
			*i = 1;
			*j = 0;
		}
	}
	else if ( sq[1] >= sq[0] && sq[1] >= sq[2] )
	{
		if ( normal[1] > 0 )
		{
			*i = 2;
			*j = 0;
		}
		else
		{
			*i = 0;
			*j = 2;
		}
	}
	else
	{
		if ( normal[0] > 0 )
		{
			*i = 1;
			*j = 2;
		}
		else
		{
			*i = 2;
			*j = 1;
		}
	}
}

/*
==============
Vec3Normalize
==============
*/
vec_t Vec3Normalize( vec3_t v )
{
	float length, ilength;

	length = v[0] * v[0] + v[1] * v[1] + v[2] * v[2];
	length = I_sqrt( length );

	if ( length )
	{
		ilength = 1 / length;
		v[0] *= ilength;
		v[1] *= ilength;
		v[2] *= ilength;
	}

	return length;
}

/*
==============
Vec2Normalize
==============
*/
vec_t Vec2Normalize( vec3_t v )
{
	float length, ilength;

	length = v[0] * v[0] + v[1] * v[1];
	length = I_sqrt( length );

	if ( length )
	{
		ilength = 1 / length;
		v[0] *= ilength;
		v[1] *= ilength;
	}

	return length;
}

/*
==============
Vec4Normalize
==============
*/
vec_t Vec4Normalize( vec4_t v )
{
	float length, ilength;

	length = v[0] * v[0] + v[1] * v[1] + v[2] * v[2] + v[3] * v[3];
	length = I_sqrt( length );

	if ( length )
	{
		ilength = 1 / length;
		v[0] *= ilength;
		v[1] *= ilength;
		v[2] *= ilength;
		v[3] *= ilength;
	}

	return length;
}

/*
==============
Vec3NormalizeTo
==============
*/
vec_t Vec3NormalizeTo( const vec3_t v, vec3_t out )
{
	float length;
	float ilength;

	length = v[0] * v[0] + v[1] * v[1] + v[2] * v[2];
	length = I_sqrt(length);

	if ( length != 0.0f )
	{
		ilength = 1.0f / length;
		out[0] = v[0] * ilength;
		out[1] = v[1] * ilength;
		out[2] = v[2] * ilength;
	}
	else
	{
		VectorClear(out);
	}

	return length;
}

/*
==============
Vec2NormalizeTo
==============
*/
vec_t Vec2NormalizeTo( const vec2_t v, vec2_t out )
{
	float length;
	float ilength;

	length = v[0] * v[0] + v[1] * v[1];
	length = I_sqrt(length);

	if ( length != 0.0f )
	{
		ilength = 1.0f / length;
		out[0] = v[0] * ilength;
		out[1] = v[1] * ilength;
	}
	else
	{
		Vector2Clear(out);
	}

	return length;
}



/*
==============
Vec3UnpackUnitVec
==============
*/
void Vec3UnpackUnitVec( int packed, vec3_t v )
{
	int x;
	int y;
	int z;

	x = ((packed & 0x3ff) << 22) >> 22;
	y = (((packed >> 10) & 0x3ff) << 22) >> 22;
	z = (((packed >> 20) & 0x3ff) << 22) >> 22;

	v[0] = x * (1.0f / 511.0f);
	v[1] = y * (1.0f / 511.0f);
	v[2] = z * (1.0f / 511.0f);
}

/*
==============
Vec3MaxComponent
==============
*/
float Vec3MaxComponent( const vec3_t v )
{
	float m;

	m = v[0] >= v[1] ? v[0] : v[1];
	return m >= v[2] ? m : v[2];
}






void RotatePointAroundVector( vec3_t dst, const vec3_t dir, const vec3_t point, float degrees );




/*
==============
MakeNormalVectors
==============
*/
void MakeNormalVectors( const vec3_t forward, vec3_t right, vec3_t up )
{
	float d;

	// this rotate and negate guarantees a vector not colinear with the original
	right[1] = -forward[0];
	right[2] = forward[1];
	right[0] = forward[2];

	d = DotProduct(right, forward);
	VectorMA(right, -d, forward, right);
	Vec3Normalize(right);
	Vec3Cross(right, forward, up);
}


float vectoyaw( const vec3_t vec );





float vectopitch( const vec3_t vec );



float vectosignedpitch( const vec3_t vec );



void vectoangles( const vec3_t value1, vec3_t angles );



void vectoanglessigned( const vec3_t value1, vec3_t angles );



void AngleVectors( const vec3_t angles, vec3_t forward, vec3_t right, vec3_t up );



void YawVectors( const float yaw, vec3_t forward, vec3_t right );



void PerpendicularVector( const vec3_t src, vec3_t dst );


/*
==============
PlaneNormalFromPoints
==============
*/
void PlaneNormalFromPoints( const vec3_t p0, const vec3_t p1, const vec3_t p2, vec3_t normal )
{
	vec3_t d1;
	vec3_t d2;

	VectorSubtract(p0, p1, d1);
	Vec3Normalize(d1);
	VectorSubtract(p0, p2, d2);
	Vec3Normalize(d2);
	Vec3Cross(d1, d2, normal);
	Vec3Normalize(normal);
}

/*
==============
ProjectPointOntoLine
==============
*/
void ProjectPointOntoLine( const vec3_t point, const vec3_t start, const vec3_t end, vec3_t out )
{
	vec3_t dir;
	vec3_t v;
	float lenSq;
	float dot;

	VectorSubtract(end, start, dir);
	VectorSubtract(point, start, v);
	dot = DotProduct(v, dir);
	lenSq = DotProduct(dir, dir);

	if ( lenSq == 0 )
	{
		VectorCopy(start, out);
	}
	else
	{
		VectorMA(start, dot / lenSq, dir, out);
	}
}



/*
==============
PointToBoxDistSq
==============
*/
float PointToBoxDistSq( const vec3_t point, const vec3_t mins, const vec3_t maxs )
{
	int i;
	float distSq;
	float d;

	distSq = 0;

	for ( i = 0; i < 3; i++ )
	{
		d = mins[i] - point[i];

		if ( d > 0 )
		{
			distSq += d * d;
		}
		else
		{
			d = point[i] - maxs[i];

			if ( d > 0 )
			{
				distSq += d * d;
			}
		}
	}

	return distSq;
}



extern const float identityMatrix44[4][4];
const float identityMatrix44[4][4] =
{
	{ 1, 0, 0, 0 },
	{ 0, 1, 0, 0 },
	{ 0, 0, 1, 0 },
	{ 0, 0, 0, 1 }
};



/*
==============
MatrixSet44
==============
*/
void MatrixSet44( float out[4][4], const vec3_t origin, const vec3_t axis[3], float scale )
{
	out[0][0] = axis[0][0] * scale;
	out[0][1] = axis[0][1] * scale;
	out[0][2] = axis[0][2] * scale;
	out[0][3] = 0.0f;
	out[1][0] = axis[1][0] * scale;
	out[1][1] = axis[1][1] * scale;
	out[1][2] = axis[1][2] * scale;
	out[1][3] = 0.0f;
	out[2][0] = axis[2][0] * scale;
	out[2][1] = axis[2][1] * scale;
	out[2][2] = axis[2][2] * scale;
	out[2][3] = 0.0f;
	out[3][0] = origin[0];
	out[3][1] = origin[1];
	out[3][2] = origin[2];
	out[3][3] = 1.0f;
}

/*
==============
MatrixMultiply
==============
*/
void MatrixMultiply( const float in1[3][3], const float in2[3][3], float out[3][3] )
{
	out[0][0] = in1[0][0] * in2[0][0] + in1[0][1] * in2[1][0] + in1[0][2] * in2[2][0];
	out[0][1] = in1[0][0] * in2[0][1] + in1[0][1] * in2[1][1] + in1[0][2] * in2[2][1];
	out[0][2] = in1[0][0] * in2[0][2] + in1[0][1] * in2[1][2] + in1[0][2] * in2[2][2];
	out[1][0] = in1[1][0] * in2[0][0] + in1[1][1] * in2[1][0] + in1[1][2] * in2[2][0];
	out[1][1] = in1[1][0] * in2[0][1] + in1[1][1] * in2[1][1] + in1[1][2] * in2[2][1];
	out[1][2] = in1[1][0] * in2[0][2] + in1[1][1] * in2[1][2] + in1[1][2] * in2[2][2];
	out[2][0] = in1[2][0] * in2[0][0] + in1[2][1] * in2[1][0] + in1[2][2] * in2[2][0];
	out[2][1] = in1[2][0] * in2[0][1] + in1[2][1] * in2[1][1] + in1[2][2] * in2[2][1];
	out[2][2] = in1[2][0] * in2[0][2] + in1[2][1] * in2[1][2] + in1[2][2] * in2[2][2];
}

/*
==============
MatrixMultiplyInPlace

inout = in1 * inout
==============
*/
void MatrixMultiplyInPlace( const float in1[3][3], float inout[3][3] )
{
	float temp[2][3];

	temp[0][0] = in1[0][0] * inout[0][0] + in1[0][1] * inout[1][0] + in1[0][2] * inout[2][0];
	temp[0][1] = in1[0][0] * inout[0][1] + in1[0][1] * inout[1][1] + in1[0][2] * inout[2][1];
	temp[0][2] = in1[0][0] * inout[0][2] + in1[0][1] * inout[1][2] + in1[0][2] * inout[2][2];
	temp[1][0] = in1[1][0] * inout[0][0] + in1[1][1] * inout[1][0] + in1[1][2] * inout[2][0];
	temp[1][1] = in1[1][0] * inout[0][1] + in1[1][1] * inout[1][1] + in1[1][2] * inout[2][1];
	temp[1][2] = in1[1][0] * inout[0][2] + in1[1][1] * inout[1][2] + in1[1][2] * inout[2][2];
	inout[2][0] = in1[2][0] * inout[0][0] + in1[2][1] * inout[1][0] + in1[2][2] * inout[2][0];
	inout[2][1] = in1[2][0] * inout[0][1] + in1[2][1] * inout[1][1] + in1[2][2] * inout[2][1];
	inout[2][2] = in1[2][0] * inout[0][2] + in1[2][1] * inout[1][2] + in1[2][2] * inout[2][2];

	VectorCopy(temp[0], inout[0]);
	VectorCopy(temp[1], inout[1]);
}








void MatrixTranspose( const float in[3][3], float out[3][3] );




















/*
==============
MatrixTransformVector43Equals
==============
*/
void MatrixTransformVector43Equals( vec3_t inout, const float in2[4][3] )
{
	float temp[2];

	temp[0] = inout[0] * in2[0][0] + inout[1] * in2[1][0] + inout[2] * in2[2][0] + in2[3][0];
	temp[1] = inout[0] * in2[0][1] + inout[1] * in2[1][1] + inout[2] * in2[2][1] + in2[3][1];
	inout[2] = inout[0] * in2[0][2] + inout[1] * in2[1][2] + inout[2] * in2[2][2] + in2[3][2];
	inout[0] = temp[0];
	inout[1] = temp[1];
}



/*
==============
QuatMultiply
==============
*/
void QuatMultiply( const float *in1, const float *in2, float *out )
{
	out[0] = in1[0] * in2[3] + in1[3] * in2[0] + in1[2] * in2[1] - in1[1] * in2[2];
	out[1] = in1[1] * in2[3] - in1[2] * in2[0] + in1[3] * in2[1] + in1[0] * in2[2];
	out[2] = in1[2] * in2[3] + in1[1] * in2[0] - in1[0] * in2[1] + in1[3] * in2[2];
	out[3] = in1[3] * in2[3] - in1[0] * in2[0] - in1[1] * in2[1] - in1[2] * in2[2];
}

/*
==============
QuatInverse
==============
*/
void QuatInverse( const vec4_t in, vec4_t out )
{
	out[0] = -in[0];
	out[1] = -in[1];
	out[2] = -in[2];
	out[3] = in[3];
}



/*
==============
QuatAxisLengthSq

Fraction of a quaternion's squared length held by its axis part.
==============
*/
float QuatAxisLengthSq( const vec4_t q )
{
	float x;
	float y;
	float z;
	float mag;

	x = q[0] * q[0];
	y = q[1] * q[1];
	z = q[2] * q[2];
	mag = x + y + z + q[3] * q[3];

	if ( mag != 0 )
	{
		mag = 1.0f / mag;
		x *= mag;
		y *= mag;
		z *= mag;
		return x + y + z;
	}

	return 0;
}



/*
==============
QuatDiffAxisLengthSq
==============
*/
float QuatDiffAxisLengthSq( const vec4_t a, const vec4_t b )
{
	vec4_t inv;
	vec4_t diff;

	QuatInverse(b, inv);
	QuatMultiply(a, inv, diff);
	return QuatAxisLengthSq(diff);
}























/*
==============
ColorBytesFromRGB
==============
*/
unsigned int ColorBytesFromRGB( float r, float g, float b )
{
	unsigned char c[4];

	c[0] = (unsigned char)(r * 255.0f);
	c[1] = (unsigned char)(g * 255.0f);
	c[2] = (unsigned char)(b * 255.0f);
	c[3] = 0xff;

	return *(unsigned int *)c;
}

/*
==============
ColorBytesFromRGBA
==============
*/
unsigned int ColorBytesFromRGBA( float r, float g, float b, float a )
{
	unsigned char c[4];

	c[0] = (unsigned char)(r * 255.0f);
	c[1] = (unsigned char)(g * 255.0f);
	c[2] = (unsigned char)(b * 255.0f);
	c[3] = (unsigned char)(a * 255.0f);

	return *(unsigned int *)c;
}

/*
==============
Vec3NormalizeByMax
==============
*/
float Vec3NormalizeByMax( const vec3_t v, vec3_t out )
{
	float max;

	max = v[0];

	if ( v[1] > max )
	{
		max = v[1];
	}

	if ( v[2] > max )
	{
		max = v[2];
	}

	if ( max == 0 )
	{
		VectorClear(out);
	}
	else
	{
		out[0] = v[0] / max;
		out[1] = v[1] / max;
		out[2] = v[2] / max;
	}

	return max;
}

/*
==============
AngleMod
==============
*/
float AngleMod( float a )
{
	return ( ( 360.0f / 65536 ) * ( (int)( a * ( 65536 / 360.0f ) ) & 65535 ) );
}

/*
==============
AngleNormalize360
==============
*/
float AngleNormalize360( float angle )
{
	return ( 360.0f / 65536 ) * ( (int)( angle * ( 65536 / 360.0f ) ) & 65535 );
}

/*
==============
LerpAngle

Lerps from -> to along the shorter arc.
==============
*/
float LerpAngle( float from, float to, float frac )
{
	float result;
	float target;

	target = to;

	if ( target - from > 180 )
		target -= 360;

	if ( target - from < -180 )
		target += 360;

	result = from + frac * (target - from);
	return result;
}

/*
==============
AngleSubtract
==============
*/
float AngleSubtract( float a1, float a2 )
{
	float a = a1 - a2;

	while ( a > 180 )
	{
		a -= 360;
	}

	while ( a < -180 )
	{
		a += 360;
	}

	return a;
}

/*
==============
AnglesSubtract
==============
*/
void AnglesSubtract( const vec3_t v1, const vec3_t v2, vec3_t v3 )
{
	v3[0] = AngleSubtract(v1[0], v2[0]);
	v3[1] = AngleSubtract(v1[1], v2[1]);
	v3[2] = AngleSubtract(v1[2], v2[2]);
}

/*
==============
AngleNormalize180
==============
*/
float AngleNormalize180( float angle )
{
	float normalized;

	normalized = AngleNormalize360(angle);

	if ( normalized > 180.0f )
		normalized = normalized - 360.0f;

	return normalized;
}

/*
==============
AngleNormalize360Accurate
==============
*/
float AngleNormalize360Accurate( float angle )
{
	if ( angle < 0.0f )
	{
		do
			angle = angle + 360.0f;
		while ( angle < 0.0f );
		return angle;
	}

	if ( angle >= 360.0f )
	{
		do
			angle = angle - 360.0f;
		while ( angle >= 360.0f );
		return angle;
	}

	return angle;
}

/*
==============
AngleNormalize180Accurate
==============
*/
float AngleNormalize180Accurate( float angle )
{
	if ( angle <= -180.0f )
	{
		do
			angle = angle + 360.0f;
		while ( angle <= -180.0f );
		return angle;
	}

	if ( angle > 180.0f )
	{
		do
			angle = angle - 360.0f;
		while ( angle > 180.0f );
		return angle;
	}

	return angle;
}



/*
==============
RadiusFromBounds
==============
*/
float RadiusFromBounds( const vec3_t mins, const vec3_t maxs )
{
	int i;
	vec3_t corner;
	float a, b;

	for ( i = 0 ; i < 3 ; i++ )
	{
		a = I_fabs( mins[i] );
		b = I_fabs( maxs[i] );
		corner[i] = a > b ? a : b;
	}

	return VectorLength( corner );
}

/*
==============
RadiusFromBounds2D
==============
*/
float RadiusFromBounds2D( const vec2_t mins, const vec2_t maxs )
{
	int i;
	vec2_t corner;
	float a, b;

	for ( i = 0 ; i < 2 ; i++ )
	{
		a = I_fabs( mins[i] );
		b = I_fabs( maxs[i] );
		corner[i] = a > b ? a : b;
	}

	return Vec2Length( corner );
}

/*
==============
ExpandBoundsByDelta

Grows the bounds along a signed delta.
==============
*/
void ExpandBoundsByDelta( vec3_t mins, vec3_t maxs, const vec3_t delta )
{
	if ( delta[0] > 0 )
		maxs[0] += delta[0];
	else
		mins[0] += delta[0];

	if ( delta[1] > 0 )
		maxs[1] += delta[1];
	else
		mins[1] += delta[1];

	if ( delta[2] > 0 )
		maxs[2] += delta[2];
	else
		mins[2] += delta[2];
}





/*
==============
ClearBounds
==============
*/
void ClearBounds( vec3_t mins, vec3_t maxs )
{
	VectorSet(mins, 131072, 131072, 131072);
	VectorSet(maxs, -131072, -131072, -131072);
}

/*
==============
ClearBounds2D
==============
*/
void ClearBounds2D( vec2_t mins, vec2_t maxs )
{
	Vector2Set(mins, 131072.0f, 131072.0f);
	Vector2Set(maxs, -131072.0f, -131072.0f);
}

/*
==============
AddPointToBounds
==============
*/
void AddPointToBounds( const vec3_t v, vec3_t mins, vec3_t maxs )
{
	if ( v[0] < mins[0] )
		mins[0] = v[0];
	if ( v[0] > maxs[0] )
		maxs[0] = v[0];
	if ( v[1] < mins[1] )
		mins[1] = v[1];
	if ( v[1] > maxs[1] )
		maxs[1] = v[1];
	if ( v[2] < mins[2] )
		mins[2] = v[2];
	if ( v[2] > maxs[2] )
		maxs[2] = v[2];
}

/*
==============
AddPointToBounds2D
==============
*/
void AddPointToBounds2D( const vec2_t v, vec2_t mins, vec2_t maxs )
{
	if ( v[0] < mins[0] )
	{
		mins[0] = v[0];
	}

	if ( v[0] > maxs[0] )
	{
		maxs[0] = v[0];
	}

	if ( v[1] < mins[1] )
	{
		mins[1] = v[1];
	}

	if ( v[1] > maxs[1] )
	{
		maxs[1] = v[1];
	}
}





/*
==============
BoundsOverlap
==============
*/
int BoundsOverlap( const vec3_t mins1, const vec3_t maxs1, const vec3_t mins2, const vec3_t maxs2 )
{
	if ( mins1[0] > maxs2[0] || mins2[0] > maxs1[0] )
	{
		return 0;
	}

	if ( mins1[1] > maxs2[1] || mins2[1] > maxs1[1] )
	{
		return 0;
	}

	if ( mins1[2] > maxs2[2] || mins2[2] > maxs1[2] )
	{
		return 0;
	}

	return 1;
}

/*
==============
BoundsOverlap2D
==============
*/
int BoundsOverlap2D( const vec2_t mins1, const vec2_t maxs1, const vec2_t mins2, const vec2_t maxs2 )
{
	if ( mins1[0] > maxs2[0] || mins2[0] > maxs1[0] )
	{
		return 0;
	}

	if ( mins1[1] > maxs2[1] || mins2[1] > maxs1[1] )
	{
		return 0;
	}

	return 1;
}

/*
==============
BoundsOverlapEpsilon
==============
*/
int BoundsOverlapEpsilon( const vec3_t mins1, const vec3_t maxs1, const vec3_t mins2, const vec3_t maxs2, float epsilon )
{
	if ( mins1[0] > maxs2[0] + epsilon || mins2[0] > maxs1[0] + epsilon )
	{
		return 0;
	}

	if ( mins1[1] > maxs2[1] + epsilon || mins2[1] > maxs1[1] + epsilon )
	{
		return 0;
	}

	if ( mins1[2] > maxs2[2] + epsilon || mins2[2] > maxs1[2] + epsilon )
	{
		return 0;
	}

	return 1;
}

/*
==============
BoundsOverlapEpsilon2D
==============
*/
int BoundsOverlapEpsilon2D( const vec2_t mins1, const vec2_t maxs1, const vec2_t mins2, const vec2_t maxs2, float epsilon )
{
	if ( mins1[0] > maxs2[0] + epsilon || mins2[0] > maxs1[0] + epsilon )
	{
		return 0;
	}

	if ( mins1[1] > maxs2[1] + epsilon || mins2[1] > maxs1[1] + epsilon )
	{
		return 0;
	}

	return 1;
}

/*
==============
ExpandBounds
==============
*/
void ExpandBounds( const vec3_t addedmins, const vec3_t addedmaxs, vec3_t mins, vec3_t maxs )
{
	if ( mins[0] > addedmins[0] )
	{
		mins[0] = addedmins[0];
	}

	if ( maxs[0] < addedmaxs[0] )
	{
		maxs[0] = addedmaxs[0];
	}

	if ( mins[1] > addedmins[1] )
	{
		mins[1] = addedmins[1];
	}

	if ( maxs[1] < addedmaxs[1] )
	{
		maxs[1] = addedmaxs[1];
	}

	if ( mins[2] > addedmins[2] )
	{
		mins[2] = addedmins[2];
	}

	if ( maxs[2] < addedmaxs[2] )
	{
		maxs[2] = addedmaxs[2];
	}
}

/*
==============
ExpandBounds2D
==============
*/
void ExpandBounds2D( const vec2_t addedmins, const vec2_t addedmaxs, vec2_t mins, vec2_t maxs )
{
	if ( mins[0] > addedmins[0] )
	{
		mins[0] = addedmins[0];
	}

	if ( maxs[0] < addedmaxs[0] )
	{
		maxs[0] = addedmaxs[0];
	}

	if ( mins[1] > addedmins[1] )
	{
		mins[1] = addedmins[1];
	}

	if ( maxs[1] < addedmaxs[1] )
	{
		maxs[1] = addedmaxs[1];
	}
}

/*
==============
TransformBounds

Axis-aligned bounds of a box after rotating by axis and moving to origin;
the sign bit of each axis entry picks the min or max corner.
==============
*/
void TransformBounds( const vec3_t bounds[2], const vec3_t origin, const vec3_t axis[3], vec3_t out[2] )
{
	int i;
	int offset;

	for ( i = 0; i < 3; i++ )
	{
		out[0][i] = origin[i];
		out[1][i] = origin[i];

		offset = FloatAsInt(axis[0][i]) < 0 ? 12 : 0;
		out[0][i] += ((const float *)((const char *)bounds + offset))[0] * axis[0][i];
		out[1][i] += ((const float *)((const char *)bounds - offset))[3] * axis[0][i];

		offset = FloatAsInt(axis[1][i]) < 0 ? 12 : 0;
		out[0][i] += ((const float *)((const char *)bounds + offset))[1] * axis[1][i];
		out[1][i] += ((const float *)((const char *)bounds - offset))[4] * axis[1][i];

		offset = FloatAsInt(axis[2][i]) < 0 ? 12 : 0;
		out[0][i] += ((const float *)((const char *)bounds + offset))[2] * axis[2][i];
		out[1][i] += ((const float *)((const char *)bounds - offset))[5] * axis[2][i];
	}
}

/*
==============
TransformBoundsExpand
==============
*/
void TransformBoundsExpand( const vec3_t bounds[2], const vec3_t origin, const vec3_t axis[3], vec3_t out[2] )
{
	vec3_t transformed[2];

	TransformBounds(bounds, origin, axis, transformed);
	ExpandBounds(transformed[0], transformed[1], out[0], out[1]);
}

/*
==============
AxisIdentity
==============
*/
void AxisIdentity( vec3_t axis[3] )
{
	axis[0][0] = 1.0f;
	axis[0][1] = 0;
	axis[0][2] = 0;
	axis[1][0] = 0;
	axis[1][1] = 1.0f;
	axis[1][2] = 0;
	axis[2][0] = 0;
	axis[2][1] = 0;
	axis[2][2] = 1.0f;
}

/*
==============
AxisCopy
==============
*/
void AxisCopy( const vec3_t in[3], vec3_t out[3] )
{
	VectorCopy(in[0], out[0]);
	VectorCopy(in[1], out[1]);
	VectorCopy(in[2], out[2]);
}



/*
==============
AxisTransformComponents

x * axis[0] + y * axis[1] + z * axis[2]
==============
*/
void AxisTransformComponents( const vec3_t axis[3], float x, float y, float z, vec3_t out )
{
	out[0] = x * axis[0][0] + y * axis[1][0] + z * axis[2][0];
	out[1] = x * axis[0][1] + y * axis[1][1] + z * axis[2][1];
	out[2] = x * axis[0][2] + y * axis[1][2] + z * axis[2][2];
}









/*
==============
IntersectPlanes

Point shared by three planes; false when they are nearly parallel.
==============
*/
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

	invDet = 1.0 / det;

	v[0] = plane[0][3] * (plane[1][1] * plane[2][2] - plane[2][1] * plane[1][2]);
	v[1] = plane[1][3] * (plane[2][1] * plane[0][2] - plane[0][1] * plane[2][2]);
	v[2] = plane[2][3] * (plane[0][1] * plane[1][2] - plane[1][1] * plane[0][2]);
	xyz[0] = (v[0] + v[1] + v[2]) * invDet;

	v[0] = plane[0][3] * (plane[1][2] * plane[2][0] - plane[2][2] * plane[1][0]);
	v[1] = plane[1][3] * (plane[2][2] * plane[0][0] - plane[0][2] * plane[2][0]);
	v[2] = plane[2][3] * (plane[0][2] * plane[1][0] - plane[1][2] * plane[0][0]);
	xyz[1] = (v[0] + v[1] + v[2]) * invDet;

	v[0] = plane[0][3] * (plane[1][0] * plane[2][1] - plane[2][0] * plane[1][1]);
	v[1] = plane[1][3] * (plane[2][0] * plane[0][1] - plane[0][0] * plane[2][1]);
	v[2] = plane[2][3] * (plane[0][0] * plane[1][1] - plane[1][0] * plane[0][1]);
	xyz[2] = (v[0] + v[1] + v[2]) * invDet;

	return 1;
}





/*
==============
PointInPolygon

True when point lies inside the convex polygon, tested in its dominant plane.
==============
*/
int PointInPolygon( const vec3_t *verts, int vertCount, const vec3_t normal, const vec3_t point )
{
	int i;
	int j;
	int k;
	int prev;
	vec2_t edge;
	vec2_t delta;
	float dot;

	PickProjectionAxes(normal, &i, &j);
	prev = vertCount - 1;

	for ( k = 0; k < vertCount; k++ )
	{
		edge[0] = verts[k][j] - verts[prev][j];
		edge[1] = verts[prev][i] - verts[k][i];
		delta[0] = point[i] - verts[prev][i];
		delta[1] = point[j] - verts[prev][j];
		dot = Dot2Product(delta, edge);

		if ( dot < 0 )
		{
			return 0;
		}

		prev = k;
	}

	return 1;
}

/*
==============
PlaneFromPoints
==============
*/
int PlaneFromPoints( vec4_t plane, const vec3_t a, const vec3_t b, const vec3_t c )
{
	vec3_t d1;
	vec3_t d2;

	VectorSubtract(b, a, d1);
	VectorSubtract(c, a, d2);
	Vec3Cross(d2, d1, plane);

	if ( Vec3Normalize(plane) == 0 )
	{
		return 0;
	}

	plane[3] = DotProduct(a, plane);
	return 1;
}


void ProjectPointOnPlane( const vec3_t p, const vec3_t normal, vec3_t dst );


/*
==============
SetPlaneSignbits
==============
*/
void SetPlaneSignbits( cplane_t *out )
{
	unsigned char bits;
	int j;

	bits = 0;

	for ( j = 0; j < 3; j++ )
	{
		if ( out->normal[j] < 0 )
		{
			bits |= 1 << j;
		}
	}

	out->signbits = bits;
}







/*
==============
Q_round
==============
*/
float Q_round( float x )
{
	return floor(x + 0.5f);
}

/*
==============
Vec3ScaleToUnitMax

Scales v so its largest component is 1 and returns that component.
==============
*/
float Vec3ScaleToUnitMax( const vec3_t v, vec3_t out )
{
	float max;
	float scale;

	max = v[0];

	if ( v[1] > max )
		max = v[1];

	if ( v[2] > max )
		max = v[2];

	if ( max == 0 )
	{
		out[0] = out[1] = out[2] = 1.0f;
		return 0;
	}

	scale = 1.0f / max;
	VectorScale(v, scale, out);
	return max;
}


void VectorRotate( const vec3_t vIn, const vec3_t vRotation, vec3_t out );








/*
==============
Rand_Init
==============
*/
void Rand_Init( int seed )
{
	holdrand = seed;
}

/*
==============
flrand
==============
*/
float flrand( float min, float max )
{
	float result;

	holdrand = 214013 * holdrand + 2531011;
	result = (float)(holdrand >> 17);
	result = (max - min) * result / 32768.0f + min;
	return result;
}

/*
==============
irand
==============
*/
int irand( int min, int max )
{
	int result;

	holdrand = holdrand * 214013 + 2531011;
	result = holdrand >> 17;
	result = ((max - min) * result >> 15) + min;
	return result;
}

/*
==============
TransformVectorByAnimMat
==============
*/






/*
==============
SnapFloatBits

Rounds away the low mantissa bits when they are within tolerance of a multiple.
==============
*/
float SnapFloatBits( float f, int tolerance, int bits )
{
	union
	{
		float f;
		int i;
	} u;
	int low;
	int one;
	int mask;

	one = 1 << bits;
	mask = one - 1;
	u.f = f;
	low = u.i & mask;

	if ( low <= tolerance )
	{
		u.i -= low;
	}
	else if ( one - low <= tolerance )
	{
		u.i += one - low;
	}

	return u.f;
}


