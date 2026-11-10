// crosshair yaw-store probe; V selects the spelling
typedef float vec3_t[3];
struct cg_t { int pad[64]; float gunPitch; float gunYaw; float pad2[9]; float refdefViewAngles[3]; float axis[3][3]; struct { float fov_x, fov_y; float viewaxis[3][3]; } refdef; };
#if 1
extern cg_t * const cg;
#else
extern __declspec(align(128)) cg_t cgArray[1];
#define cg (&cgArray[0])
#endif
#if A
static void FastSinCos(const float value, float *pSin, float *pCos)
{
	__asm
	{
		push eax
		push ecx
		fld value
		fsincos
		mov ecx, pCos
		mov eax, pSin
		fstp dword ptr [ecx]
		fstp dword ptr [eax]
		pop ecx
		pop eax
	}
}
#else
void FastSinCos(float a, float *s, float *c);
#endif
float g_out[3];
void AngleVectors(const vec3_t angles, vec3_t forward, vec3_t right, vec3_t up);
#include <math.h>
#include <string.h>
#define NULL 0
extern float DotProduct(const vec3_t a, const vec3_t b);
void probe(float *x, float *y)
{
    vec3_t gunAng;
    vec3_t gunDir;
    float forward;
    float horiz;
    float vert;

#if V == 0
    gunAng[0] = cg->gunPitch;
    gunAng[1] = cg->gunYaw;
    gunAng[2] = cg->refdefViewAngles[2];
    AngleVectors(gunAng, gunDir, 0, 0);
#elif V == 1
    AngleVectors(&cg->gunPitch, gunDir, 0, 0);
#elif V == 2
    { float *ang = &cg->gunPitch; gunAng[0] = ang[0]; gunAng[1] = ang[1]; }
    gunAng[2] = cg->refdefViewAngles[2];
    AngleVectors(gunAng, gunDir, 0, 0);
#elif V == 3
    gunAng[0] = cg->gunPitch;
    gunAng[1] = cg->gunYaw;
    gunAng[2] = 0.0f;
    AngleVectors(gunAng, gunDir, 0, 0);
#elif V == 4
    gunAng[2] = cg->refdefViewAngles[2];
    gunAng[1] = cg->gunYaw;
    gunAng[0] = cg->gunPitch;
    AngleVectors(gunAng, gunDir, 0, 0);
#elif V == 5
    gunAng[0] = cg->gunPitch;
    gunAng[1] = cg->gunYaw;
    gunAng[2] = cg->refdefViewAngles[2];
    AngleVectors(gunAng, gunDir, NULL, NULL);
    gunAng[1] = gunAng[1];
#elif V == 6
    memcpy(gunAng, &cg->gunPitch, 8);
    gunAng[2] = cg->refdefViewAngles[2];
    AngleVectors(gunAng, gunDir, 0, 0);
#endif

    forward = DotProduct(gunDir, cg->refdef.viewaxis[0]);
    if (forward <= 0.0f || cg->refdef.fov_x <= 0.0f || cg->refdef.fov_y <= 0.0f) {
        *x = 0.0f;
        *y = 0.0f;
        return;
    }

    horiz = DotProduct(gunDir, cg->refdef.viewaxis[1]);
    *x = horiz / (forward * (float)tan((double)(cg->refdef.fov_x * 0.0087266462f))) * -320.0f;
    vert = DotProduct(gunDir, cg->refdef.viewaxis[2]);
    *y = vert / (forward * (float)tan((double)(cg->refdef.fov_y * 0.0087266462f))) * -240.0f;
}
