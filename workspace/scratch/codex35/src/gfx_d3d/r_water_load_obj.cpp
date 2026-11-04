// Water setups loaded with materials (FFT ocean tiles).
#include "gfx.h"
#include <math.h>

// R_CreateWaterSetup / R_LoadWaterSetup (0x1002cd00 / 0x1000dd70) wait for R_CreateWaterMap (r_image, 0x10010b30).

void GaussianRandom(float *f0, float *f1);

int sceneWaterMapSetupsCount;
water_t sceneWaterMapSetups[16];

qboolean R_WatersEquivalent(const water_t *w0, const water_t *w1)
{
	float dot;
	float len0Sq;
	float len1Sq;
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
	dot = Dot2Product(w0->winddir, w1->winddir);
	len1Sq = Vec2Multiply(w1->winddir);
	len0Sq = Vec2Multiply(w0->winddir);
	denom = I_sqrt(len0Sq * len1Sq);
	denom = denom + 1.0e-10;
	dirAngleCos = I_fabs(dot / denom - 1.0f);
	if (dirAngleCos > 0.001f)
		return 0;
	return 1;
}

void R_ShutdownLoadWater()
{
	sceneWaterMapSetupsCount = 0;
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
