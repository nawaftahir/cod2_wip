/* crosshair probe caller; V selects the spelling */
#if HP
#pragma optimize("p", on)
#endif
typedef float vec3_t[3];
typedef struct { int pad[64]; float gunPitch; float gunYaw; float pad2[9]; float refdefViewAngles[3]; float axis[3][3]; struct { float fov_x, fov_y; float viewaxis[3][3]; } refdef; } cg_t;
extern __declspec(align(128)) cg_t cgArray[1];
#if CG == 1
extern cg_t * const cgc;
#define cg cgc
#elif CG == 2
#define cg cgl
#else
#define cg (&cgArray[0])
#endif
void AngleVectors(const vec3_t angles, vec3_t forward, vec3_t right, vec3_t up);
#include <math.h>
#define NULL 0
#if DP
float DotProduct(const vec3_t a, const vec3_t b);
#else
#define DotProduct(a,b) ((a)[0]*(b)[0]+(a)[1]*(b)[1]+(a)[2]*(b)[2])
#endif
static void probe(float *x, float *y)
{
    vec3_t gunAng;
#if CG == 2
    cg_t *cgl = cgArray;
#endif
    vec3_t gunDir;
    float forward;
    float horiz;
    float vert;

    gunAng[0] = cg->gunPitch;
#if Y == 1
    gunAng[1] = cg->gunYaw * 1.0f;
#elif Y == 2
    gunAng[1] = (float)(double)cg->gunYaw;
#elif Y == 3
    { float yaw = cg->gunYaw; gunAng[1] = yaw; }
#elif Y == 4
    gunAng[1] = *(volatile float *)&cg->gunYaw;
#else
    gunAng[1] = cg->gunYaw;
#endif
    gunAng[2] = cg->refdefViewAngles[2];
#if V == 2
    AngleVectors(&cg->gunPitch, gunDir, NULL, NULL);
#elif V == 1
    AngleVectors(gunAng, gunDir, NULL, NULL);
#else
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

float g_x[8];
void drive(int n)
{
    probe(&g_x[0], &g_x[1]);
    if (n) probe(&g_x[2], &g_x[3]);
    if (n > 1) probe(&g_x[4], &g_x[5]);
    if (n > 2) probe(&g_x[6], &g_x[7]);
}
