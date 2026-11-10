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
#pragma function(tan)
#include <string.h>
#define NULL 0
extern float DotProduct(const vec3_t a, const vec3_t b);
static void probe(float *x, float *y)
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
#elif V == 7
    vec3_t ang = { cg->gunPitch, cg->gunYaw, cg->refdefViewAngles[2] };
    AngleVectors(ang, gunDir, 0, 0);
#elif V == 8
    struct { float p, y, r; } a3; a3.p = cg->gunPitch; a3.y = cg->gunYaw; a3.r = cg->refdefViewAngles[2];
    AngleVectors(&a3.p, gunDir, 0, 0);
#elif V == 9
#define VectorSet(v, x, y, z) ((v)[0] = (x), (v)[1] = (y), (v)[2] = (z))
    VectorSet(gunAng, cg->gunPitch, cg->gunYaw, cg->refdefViewAngles[2]);
    AngleVectors(gunAng, gunDir, 0, 0);
#elif V == 10
    float pitch = cg->gunPitch;
    gunAng[0] = pitch;
    gunAng[1] = cg->gunYaw;
    gunAng[2] = cg->refdefViewAngles[2];
    AngleVectors(gunAng, gunDir, 0, 0);
#elif V == 11
    gunAng[0] = cg->gunPitch;
    gunAng[1] = cg->gunYaw;
    gunAng[2] = cg->gunPitch;
    AngleVectors(gunAng, gunDir, 0, 0);
#elif V == 12
    gunAng[0] = cg->gunPitch + 0.0f;
    gunAng[1] = cg->gunYaw;
    gunAng[2] = cg->refdefViewAngles[2];
    AngleVectors(gunAng, gunDir, 0, 0);
#elif V == 13
    gunAng[0] = cg->gunPitch;
    gunAng[1] = cg->gunYaw;
    gunAng[2] = cg->refdefViewAngles[2];
    AngleVectors(gunAng, gunDir, (float *)0, (float *)0);
    forward = gunAng[0];
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

float g_x[8];
void drive(int n)
{
    probe(&g_x[0], &g_x[1]);
    if (n) probe(&g_x[2], &g_x[3]);
    if (n > 1) probe(&g_x[4], &g_x[5]);
    if (n > 2) probe(&g_x[6], &g_x[7]);
}
