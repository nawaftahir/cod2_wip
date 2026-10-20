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

float Q_acos(float c)
{
    float v = (float)acos(c);
    if (v > 3.1415927410125732f)
        return 3.1415927410125732f;
    if (v < -3.1415927410125732f)
        return 3.1415927410125732f;
    return v;
}

}
