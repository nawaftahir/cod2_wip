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
