#include <stdlib.h>
#include <math.h>

extern "C" {

double fabs(double);

float randomf()
{
    return (float)rand() / 32768.0f;
}

float crandom()
{
    return (float)rand() / 32768.0f * 2.0f - 1.0f;
}

float LinearTrack( float tgt, float cur, float rate, float deltaTime )
{
	float err = tgt - cur;
	float step;
	float absStep;

	if ( err > 0.0f )
		step = rate * deltaTime;
	else
		step = -rate * deltaTime;

	if ( (float)fabs(err) > 0.001f )
	{
		absStep = (float)fabs(step);
		if ( absStep > (float)fabs(err) )
			return tgt;
		else
			return cur + step;
	}
	else
		return tgt;
}

float AngleNormalize360(float angle);
float AngleNormalize180(float angle);

float LinearTrackAngle(float tgt, float cur, float rate, float deltaTime)
{
    while (tgt - cur > 180.0f)
        tgt -= 360.0f;
    while (tgt - cur < -180.0f)
        tgt += 360.0f;
    tgt = LinearTrack(tgt, cur, rate, deltaTime);
    return AngleNormalize360(tgt);
}

float DiffTrack( float tgt, float cur, float rate, float deltaTime )
{
	float err = tgt - cur;
	float step = rate * err * deltaTime;
	float absStep;

	if ( (float)fabs(err) > 0.001f )
	{
		absStep = (float)fabs(step);
		if ( absStep > (float)fabs(err) )
			return tgt;
		else
			return cur + step;
	}
	else
		return tgt;
}

float DiffTrackAngle(float tgt, float cur, float rate, float deltaTime)
{
    while (tgt - cur > 180.0f)
        tgt -= 360.0f;
    while (tgt - cur < -180.0f)
        tgt += 360.0f;
    tgt = DiffTrack(tgt, cur, rate, deltaTime);
    return AngleNormalize360(tgt);
}

static int VectorCompareEpsilon( float *v1, float *v2, float epsilon, int count )
{
	volatile float epsSq = epsilon * epsilon;
	int i;

	for ( i = 0; i < count; i++ )
	{
		volatile float diff = v1[i] - v2[i];
		if ( !(diff * diff <= epsSq) )
			return 0;
	}
	return 1;
}

static float Vec3DistanceSq(const float *v1, const float *v2);
static float Vec2DistanceSq(const float *v1, const float *v2);
static float Vec3MaxComponent(const float *v);
static float SnapFloatBits(float f, int tolerance, int bits);

#define ANCHOR_BLOCK(a, b) \
    do { \
        float r_ = Vec2DistanceSq((a), (b)); \
        r_ += Vec3DistanceSq((a), (b)); \
        r_ += Vec3MaxComponent((a)); \
        r_ += SnapFloatBits(r_, 4, 12); \
        volatile float sink_ = r_; \
        (void)sink_; \
    } while (0)

float Q_acos(float c)
{
    static float anchor_vec[4] = { 0, 0, 0, 0 };
    ANCHOR_BLOCK(anchor_vec, anchor_vec);
    float v = (float)acos(c);
    if (v > 3.1415927410125732f)
        return 3.1415927410125732f;
    if (v < -3.1415927410125732f)
        return 3.1415927410125732f;
    return v;
}

static float Vec3DistanceSq(const float *v1, const float *v2)
{
	float dir[3];

	dir[0] = v2[0] - v1[0];
	dir[1] = v2[1] - v1[1];
	dir[2] = v2[2] - v1[2];
	return dir[0] * dir[0] + dir[1] * dir[1] + dir[2] * dir[2];
}

static float Vec2DistanceSq(const float *v1, const float *v2)
{
	float dir[2];

	dir[0] = v2[0] - v1[0];
	dir[1] = v2[1] - v1[1];
	return dir[0] * dir[0] + dir[1] * dir[1];
}

static float Vec3MaxComponent(const float *v)
{
	float m;

	m = v[0] >= v[1] ? v[0] : v[1];
	return m >= v[2] ? m : v[2];
}

float AngleDelta(float angle1, float angle2)
{
	return AngleNormalize180(angle1 - angle2);
}

float Q_round(float x)
{
	return floor(x + 0.5f);
}

static float SnapFloatBits(float f, int tolerance, int bits)
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

	if (low <= tolerance)
	{
		u.i -= low;
	}
	else if (one - low <= tolerance)
	{
		u.i += one - low;
	}

	return u.f;
}

}
