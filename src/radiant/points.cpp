#include <stdio.h>
#include <string.h>
#include <math.h>
#include <windows.h>
extern "C" __declspec(dllimport) void __stdcall DebugBreak(void);
int FUN_0047d980(const char *expr, const char *file, int line, int a4, int a5);
#undef assert
#define assert(expr) do { static bool s_assertDisable; if ( !(expr) && !s_assertDisable ) { switch ( FUN_0047d980( #expr, __FILE__, __LINE__, 0, 1 ) ) { case 0: DebugBreak(); break; case 2: s_assertDisable = true; break; } } } while ( 0 )
extern char currentmap[1024];
typedef float vec_t;
typedef float vec3_t[3];
static inline void VectorCopy(const vec3_t a, vec3_t b) { b[0] = a[0]; b[1] = a[1]; b[2] = a[2]; }
static inline void VectorSubtract(const vec3_t a, const vec3_t b, vec3_t c) { c[0] = a[0] - b[0]; c[1] = a[1] - b[1]; c[2] = a[2] - b[2]; }
struct camera_t { char pad[0x60]; vec3_t origin; vec3_t angles; };
struct CCamWnd { camera_t m_camera; camera_t &Camera() { return m_camera; } };
struct CXYWnd { char pad[0x70]; vec3_t m_vOrigin; vec3_t &GetOrigin() { return m_vOrigin; } };
struct CMainFrame { char pad[0x788]; CXYWnd *m_pXYWnd; CCamWnd *m_pCamWnd; CCamWnd *GetCamera() { return m_pCamWnd; } CXYWnd *GetXYWnd() { return m_pXYWnd; } };
extern CMainFrame *g_pParentWnd; extern HWND g_hwndStatus; extern int g_nUpdateBits;
extern void Sys_Printf(const char *fmt, ...); vec_t Vec3Normalize(vec3_t v);
static int s_check_point; static int s_num_points; static float s_pointvecs[8192][3];
static inline void StripExtension(char *path)
{
	int length = (int)strlen(path) - 1;
	while (length > 0) {
		if (path[length] == '.') break;
		--length;
		if (path[length] == '/') return;
	}
	if (length) path[length] = 0;
}
void Pointfile_Delete(void)
{
	char name[1024];
	strcpy(name, currentmap);
	StripExtension(name);
	strcat(name, ".lin");
	remove(name);
}
void Pointfile_Next(void)
{
	vec3_t dir;
	if (s_check_point >= s_num_points - 2) {
		SendMessageA(g_hwndStatus, 0x401, 0, (LPARAM)"End of pointfile");
		return;
	}
	s_check_point++;
	VectorCopy(s_pointvecs[s_check_point], g_pParentWnd->GetCamera()->Camera().origin);
	VectorCopy(s_pointvecs[s_check_point], g_pParentWnd->GetXYWnd()->GetOrigin());
	VectorSubtract(s_pointvecs[s_check_point + 1], g_pParentWnd->GetCamera()->Camera().origin, dir);
	Vec3Normalize(dir);
	g_pParentWnd->GetCamera()->Camera().angles[1] = (float)(atan2(dir[1], dir[0]) * 180 / 3.141592653589793);
	g_pParentWnd->GetCamera()->Camera().angles[0] = (float)(asin(dir[2]) * 180 / 3.141592653589793);
	g_nUpdateBits = -1;
}
void Pointfile_Prev(void)
{
	vec3_t dir;
	if (s_check_point == 0) {
		SendMessageA(g_hwndStatus, 0x401, 0, (LPARAM)"Start of pointfile");
		return;
	}
	s_check_point--;
	VectorCopy(s_pointvecs[s_check_point], g_pParentWnd->GetCamera()->Camera().origin);
	VectorCopy(s_pointvecs[s_check_point], g_pParentWnd->GetXYWnd()->GetOrigin());
	VectorSubtract(s_pointvecs[s_check_point + 1], g_pParentWnd->GetCamera()->Camera().origin, dir);
	Vec3Normalize(dir);
	g_pParentWnd->GetCamera()->Camera().angles[1] = (float)(atan2(dir[1], dir[0]) * 180 / 3.141592653589793);
	g_pParentWnd->GetCamera()->Camera().angles[0] = (float)(asin(dir[2]) * 180 / 3.141592653589793);
	g_nUpdateBits = -1;
}
void Pointfile_Check(void)
{
	char name[1024];
	FILE *f;
	vec3_t v;
	strcpy(name, currentmap);
	StripExtension(name);
	strcat(name, ".lin");
	f = fopen(name, "r");
	if (!f) return;
	Sys_Printf("Reading pointfile %s\n", name);
	assert(s_num_points == 0);
	while (fscanf(f, "%f %f %f\n", &v[0], &v[1], &v[2]) == 3) {
		if (s_num_points < 8192) {
			VectorCopy(v, s_pointvecs[s_num_points]);
			s_num_points++;
		}
	}
	s_check_point = 0;
	fclose(f);
}
struct GfxPointVertex
{
	float xyz[3];
	unsigned char color[4];
};
extern void (*Byte4PackPixelColor)(const float *from, void *to);
extern void (*R_AddCmd_Line3D)(int count, int width, const void *verts);
extern const float colorRed[4];
int R_Add3DLine(GfxPointVertex *verts, const float *p1, const float *p2, const void *color, int width, int vertCount, int maxVertCount);

void Pointfile_Draw(void)
{
	unsigned int color;
	GfxPointVertex verts[1362];
	int vertCount;
	int i;

	Byte4PackPixelColor(colorRed, &color);
	i = 1;
	vertCount = 0;
	if (s_num_points > 1) {
		do {
			vertCount = R_Add3DLine(verts, s_pointvecs[i - 1], s_pointvecs[i], &color, 4, vertCount, 1362);
			i++;
		} while (i < s_num_points);

		if (vertCount != 0) {
			R_AddCmd_Line3D(vertCount / 2, 4, verts);
		}
	}
}

void Pointfile_Clear(void) { s_num_points = 0; }
int Pointfile_HasPoints(void) { return s_num_points != 0; }
