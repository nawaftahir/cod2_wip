// Sun sprite screen coverage.
#include "gfx.h"

extern r_backEndGlobals_t backEnd;
extern vidConfig_t vidConfig;
typedef char sun_projection_layout[(offsetof(GfxWorld, sun) + offsetof(sunflare_t, sunFxPosition) == 0x1b4
    && offsetof(GfxViewParms, viewProjectionMatrix) == 0xc8) ? 1 : -1];

// name unconfirmed: fraction of a width x height sun sprite that lands on screen
float RB_SunSpriteScreenFraction(int width, int height)
{
	const GfxViewParms *viewParms;
	const float *sunPos;
	float clipW;
	float clipX;
	float clipY;
	float invW;
	int screenW;
	int screenH;
	int left;
	int top;
	int right;
	int bottom;

	viewParms = backEnd.viewParms;
	sunPos = rgp.world->sun.sunFxPosition;
	clipW = viewParms->viewProjectionMatrix._34 * sunPos[2] + viewParms->viewProjectionMatrix._24 * sunPos[1] + viewParms->viewProjectionMatrix._14 * sunPos[0];
	// PINNED 1003b35a: greater and unordered values enter projection.
	if (clipW <= 0.0f)
		return 0.0f;
	{
		screenW = vidConfig.width;
		screenH = vidConfig.height;
		clipX = viewParms->viewProjectionMatrix._31 * sunPos[2] + viewParms->viewProjectionMatrix._21 * sunPos[1] + sunPos[0] * viewParms->viewProjectionMatrix._11;
		clipY = viewParms->viewProjectionMatrix._32 * sunPos[2] + viewParms->viewProjectionMatrix._22 * sunPos[1] + viewParms->viewProjectionMatrix._12 * sunPos[0];
		invW = 1.0f / clipW;
		left = I_fround(((invW * clipX + 1.0f) * screenW - width) * 0.5f);
		top = I_fround(((invW * clipY + 1.0f) * screenH - height) * 0.5f);
		right = left + width;
		bottom = top + height;
		if (left < 0)
			left = 0;
		if (right > screenW)
			right = screenW;
		if (top < 0)
			top = 0;
		if (bottom > screenH)
			bottom = screenH;
		if (left < right && top < bottom)
			return (float)((bottom - top) * (right - left)) / (float)(width * height);
	}
	return 0.0f;
}
