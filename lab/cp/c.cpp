// crosshair yaw-store probe; V selects the spelling
typedef float vec3_t[3];
struct cg_t { int pad[64]; float gunPitch; float gunYaw; float pad2[9]; float refdefViewAngles[3]; float axis[3][3]; struct { float fov_x, fov_y; float viewaxis[3][3]; } refdef; };
#if 0
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

__declspec(align(128)) cg_t cgArray[1];
extern "C" int _fltused = 0;
#undef cg
extern cg_t * const cg = cgArray;
