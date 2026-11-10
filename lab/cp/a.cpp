// crosshair yaw-store probe; V selects the spelling
#pragma optimize("p", on)
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
void AngleVectors( const vec3_t angles, vec3_t forward, vec3_t right, vec3_t up )
{
	float angle;
	float sr, sp, sy, cr, cp, cy;

	angle = angles[1] * 0.017453292f;
	FastSinCos( angle, &sy, &cy );

	angle = angles[0] * 0.017453292f;
	FastSinCos( angle, &sp, &cp );

	if ( forward )
	{
		forward[0] = cp * cy;
		forward[1] = cp * sy;
		forward[2] = -sp;
	}

	if ( right || up )
	{
		angle = angles[2] * 0.017453292f;
		FastSinCos( angle, &sr, &cr );

		if ( right )
		{
			right[0] = -1 * sr * sp * cy + -1 * cr * -sy;
			right[1] = -1 * sr * sp * sy + -1 * cr * cy;
			right[2] = -1 * sr * cp;
		}

		if ( up )
		{
			up[0] = cr * sp * cy + -sr * -sy;
			up[1] = cr * sp * sy + -sr * cy;
			up[2] = cr * cp;
		}
	}
}


__declspec(align(128)) cg_t cgArray[1];
extern "C" int _fltused = 0;
#undef cg
extern cg_t * const cg = cgArray;
float DotProduct(const vec3_t a, const vec3_t b) { return a[0]*b[0] + a[1]*b[1] + a[2]*b[2]; }
