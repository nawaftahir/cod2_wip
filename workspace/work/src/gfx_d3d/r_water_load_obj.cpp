// Water setups loaded with materials (FFT ocean tiles).
#include "gfx.h"
#include <math.h>
#include <string.h>
#include <stddef.h>

// R_CreateWaterSetup / R_LoadWaterSetup (0x1002cd00 / 0x1000dd70) wait for R_CreateWaterMap (r_image, 0x10010b30).

void GaussianRandom(float *f0, float *f1);
GfxImage *R_CreateWaterMap(char *name, int imageWidth, int imageHeight);

// PINNED 101d5d28/101d5d2c: these records belong to rg, not a second allocation.
typedef char waterSetupOwnershipCheck[(sizeof(water_t) == 68 &&
    offsetof(r_globals_t, sceneWaterMapSetupsCount) == 0x1028 &&
    offsetof(r_globals_t, sceneWaterMapSetups) == 0x102c &&
    offsetof(r_globals_t, fogSettings) == 0x146c) ? 1 : -1];

qboolean R_WatersEquivalent(const water_t *w0, const water_t *w1)
{
	float dot;
	float mag0Sq;
	float mag1Sq;
	float denom;
	float dirAngleCos;

	if (w0->M != w1->M || w0->N != w1->N)
		return 0;
	if (w0->Lx != w1->Lx || w0->Lz != w1->Lz)
		return 0;
	if (I_fabs(w0->amplitude - w1->amplitude) > 0.001f)
		return 0;
	if (I_fabs(w0->gravity - w1->gravity) > 0.1)
		return 0;
	if (I_fabs(w0->windvel - w1->windvel) > 0.1)
		return 0;
	dot = w0->winddir[0] * w1->winddir[0] + w1->winddir[1] * w0->winddir[1];
	mag0Sq = Vec2Multiply(w0->winddir);
	mag1Sq = Vec2Multiply(w1->winddir);
	denom = I_sqrt(mag0Sq * mag1Sq);
	denom = denom + 1.0e-10;
	dirAngleCos = I_fabs(dot / denom - 1.0f);
	if (dirAngleCos > 0.001f)
		return 0;
	return 1;
}

void R_ShutdownLoadWater()
{
    rg.sceneWaterMapSetupsCount = 0;
}

void R_PickWaterFrequencies(water_t *water)
{
	int i;
	int n;
	int m;
	float kx;
	float kz;
	float n_scale;
	float m_scale;
	float windvelsqrd;
	float L_sqrd;
	float K_sqrd;
	float w_sqrd;
	float windfactor;
	float Ph;
	float scale;
	complex_t E;

	windvelsqrd = water->windvel * water->windvel;
	L_sqrd = windvelsqrd * windvelsqrd / water->gravity;
	n_scale = 6.2831855f / (water->N * water->Lx);
	m_scale = 6.2831855f / (water->M * water->Lz);
	i = 0;
	for (n = -water->N / 2; n < water->N / 2; ++n)
	{
		kx = n * n_scale;
		for (m = -water->M / 2; m < water->M / 2; ++m)
		{
			kz = m * m_scale;
			GaussianRandom(&E.real, &E.imag);
			K_sqrd = kx * kx + kz * kz;
			w_sqrd = water->gravity * sqrt(K_sqrd);
			windfactor = water->winddir[0] * kx + water->winddir[1] * kz;
			if (windfactor <= 0.0f)
			{
				water->H0[i].real = 0.0f;
				water->H0[i].imag = 0.0f;
				water->wTerm[i] = 0.0f;
			}
			else
			{
				Ph = water->amplitude * exp(-1.0f / (L_sqrd * K_sqrd)) / (K_sqrd * K_sqrd * K_sqrd) * (windfactor * windfactor);
				scale = sqrt(Ph * 0.5f) * water->amplitude;
				water->H0[i].real = E.real * scale;
				water->H0[i].imag = E.imag * scale;
				water->wTerm[i] = sqrt(w_sqrd);
			}
			++i;
		}
	}
}

void R_CreateWaterSetup(const water_t *source, int waterMapSetupIndex, water_t *destination)
{
	int elementCount;

	elementCount = source->M * source->N;
	memcpy(destination, source, sizeof(*destination));
	destination->H0 = (complex_t *)ri.Hunk_AllocInternal(elementCount * sizeof(*destination->H0));
	destination->wTerm = (float *)ri.Hunk_AllocInternal(elementCount * sizeof(*destination->wTerm));
	R_PickWaterFrequencies(destination);
	destination->image = R_CreateWaterMap(va("watersetup%i", waterMapSetupIndex),
		(unsigned short)source->M, (unsigned short)source->N);
}
