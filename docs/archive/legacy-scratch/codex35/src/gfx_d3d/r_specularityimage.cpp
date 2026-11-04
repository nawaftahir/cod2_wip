// Specular power lookup texture: 32 exponents x 256 intensities.
#include "gfx.h"
#include <math.h>
#include <stdlib.h>

void Image_BuildSpecularityMap(float shift, unsigned char *pic)
{
	int power;
	int level;
	double normalized;
	double exponent;
	unsigned char *dst;

	for (power = 0; power < 32; power++)
	{
		if (power == 31)
		{
			exponent = 30.0;
		}
		else
		{
			normalized = __min(1.0, __max(0.0, power * (1.0f / 30.0f) + shift));
			// cos^n of the half angle falls to 0.1 at the lobe edge
			exponent = log(0.1f) / log(cos((180.0 - normalized * 175.0) * (3.14159265358979323846 / 720.0)));
		}
		dst = pic + power;
		for (level = 0; level < 256; level++)
		{
			*dst = (unsigned char)I_fround((float)(pow((double)(level * (1.0f / 255.0f)), exponent) * 255.0));
			dst += 32;
		}
	}
}

// Cubemap pixel callback: half-angle between the sun and the face direction, packed as a byte color.
void Image_GetSunHalfAngleForVector(const float *facePos, int unused, unsigned char *pixel)
{
    float dirFromEye[3];
    float halfAngle[3];
    const float *sunPos;
    float s0;
    float s1;
    float s2;

    Vec3NormalizeTo(facePos, dirFromEye);
    sunPos = rgp.world->sunLight.position;
    halfAngle[0] = sunPos[0] - dirFromEye[0];
    halfAngle[1] = sunPos[1] - dirFromEye[1];
    halfAngle[2] = sunPos[2] - dirFromEye[2];
    Vec3Normalize(halfAngle);
    s0 = (halfAngle[0] + 1.0f) * 0.5f;
    s1 = (halfAngle[1] + 1.0f) * 0.5f;
    s2 = (halfAngle[2] + 1.0f) * 0.5f;
    pixel[2] = (unsigned char)I_fround(s0 * 255.0f);
    pixel[1] = (unsigned char)I_fround(s1 * 255.0f);
    pixel[0] = (unsigned char)I_fround(s2 * 255.0f);
    pixel[3] = 0x80;
}
