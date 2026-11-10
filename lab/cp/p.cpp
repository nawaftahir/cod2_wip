// crosshair yaw-store probe; V selects the spelling
typedef float vec3_t[3];
struct cg_t { int pad[64]; float gunPitch; float gunYaw; float pad2[9]; float refdefViewAngles[3]; float axis[3][3]; };
#if C
extern cg_t * const cg;
#else
extern cg_t cgArray[1];
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

void AngleVectors(const vec3_t angles, vec3_t forward, vec3_t right, vec3_t up)
{
	float angle, sp, sy, cp, cy;
	angle = angles[1] * 0.017453292f;
	FastSinCos(angle, &sy, &cy);
	angle = angles[0] * 0.017453292f;
	FastSinCos(angle, &sp, &cp);
	if (forward) { forward[0] = cp * cy; forward[1] = cp * sy; forward[2] = -sp; }
	if (right) right[0] = 0;
	if (up) up[0] = 0;
}

void probe(void)
{
	vec3_t gunDir;
#if V == 0
	vec3_t gunAng;
	gunAng[0] = cg->gunPitch;
	gunAng[1] = cg->gunYaw;
	gunAng[2] = cg->refdefViewAngles[2];
	AngleVectors(gunAng, gunDir, 0, 0);
#elif V == 1
	vec3_t gunAng;
	gunAng[2] = cg->refdefViewAngles[2];
	gunAng[1] = cg->gunYaw;
	gunAng[0] = cg->gunPitch;
	AngleVectors(gunAng, gunDir, 0, 0);
#elif V == 2
	AngleVectors(&cg->gunPitch, gunDir, 0, 0);
#elif V == 3
	vec3_t gunAng;
	float *ang = &cg->gunPitch;
	gunAng[0] = ang[0];
	gunAng[1] = ang[1];
	gunAng[2] = cg->refdefViewAngles[2];
	AngleVectors(gunAng, gunDir, 0, 0);
#elif V == 4
	vec3_t gunAng;
	gunAng[0] = cg->gunPitch;
	gunAng[1] = cg->gunYaw;
	gunAng[2] = 0;
	AngleVectors(gunAng, gunDir, 0, 0);
#elif V == 5
	vec3_t gunAng;
	float yaw = cg->gunYaw;
	gunAng[0] = cg->gunPitch;
	gunAng[1] = yaw;
	gunAng[2] = cg->refdefViewAngles[2];
	AngleVectors(gunAng, gunDir, 0, 0);
#elif V == 6
	vec3_t gunAng;
	gunAng[0] = cg->gunPitch;
	gunAng[1] = cg->gunYaw;
	AngleVectors(gunAng, gunDir, 0, 0);
#endif
	g_out[0] = gunDir[0]; g_out[1] = gunDir[1]; g_out[2] = gunDir[2];
}
