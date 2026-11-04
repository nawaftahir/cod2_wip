#include <stdio.h>
#include <string.h>
#include <math.h>
#include <windows.h>
#include "../universal/assertive.h"



extern char currentmap[1024];
typedef float vec_t;
typedef float vec3_t[3];
static inline void VectorCopy(const vec3_t a, vec3_t b) { b[0] = a[0]; b[1] = a[1]; b[2] = a[2]; }
static inline void VectorSubtract(const vec3_t a, const vec3_t b, vec3_t c) { c[0] = a[0] - b[0]; c[1] = a[1] - b[1]; c[2] = a[2] - b[2]; }
extern void Sys_Printf(const char *fmt, ...);





static int s_check_point; static int s_num_points; static float s_pointvecs[8192][3];










void Pointfile_Delete(void)
{
	char name[1024];
	strcpy(name, currentmap);
	{
		int length = (int)strlen(name) - 1;
		while (length > 0) {
			if (name[length] == '.') break;
			--length;
			if (name[length] == '/') goto extension_done;
		}
		if (length) name[length] = 0;
	}
extension_done:
	strcat(name, ".lin");
	remove(name);
}

struct PointCamWnd
{
    unsigned char reserved[0x60];
    float origin[3];
    float pitch;
    float yaw;
};
struct PointXYWnd
{
    unsigned char reserved[0x70];
    float origin[3];
};
struct PointMainFrame
{
    unsigned char reserved[0x788];
    PointXYWnd *xy;
    PointCamWnd *cam;
};
extern PointMainFrame *g_pParentWnd;
extern HWND g_statusWnd;
extern int g_nUpdateBits;
extern float Vec3Normalize(vec3_t v);
static __forceinline void PointMoveCameras()
{
    int i = s_check_point;
    VectorCopy(s_pointvecs[i], g_pParentWnd->cam->origin);
    VectorCopy(s_pointvecs[i], g_pParentWnd->xy->origin);
    vec3_t dir;
    VectorSubtract(s_pointvecs[i + 1], g_pParentWnd->cam->origin, dir);
    Vec3Normalize(dir);
    PointCamWnd *yawCam = g_pParentWnd->cam;
    float a = (float)atan2((double)dir[1], (double)dir[0]);
    yawCam->yaw = (float)(a * 180.0f / 3.14159);
    PointCamWnd *pitchCam = g_pParentWnd->cam;
    float b = (float)asin((double)dir[2]);
    g_nUpdateBits = -1;
    pitchCam->pitch = (float)((b * 180.0f) / 3.14159);
}
void Pointfile_Next(void)
{
    if (s_check_point >= s_num_points - 2)
    {
        SendMessageA(g_statusWnd, 0x401, 0, (LPARAM)"End of pointfile");
        return;
    }
    ++s_check_point;
    PointMoveCameras();
}
void Pointfile_Prev(void)
{
    if (s_check_point == 0)
    {
        SendMessageA(g_statusWnd, 0x401, 0, (LPARAM)"Start of pointfile");
        return;
    }
    --s_check_point;
    PointMoveCameras();
}











#line 59
void Pointfile_Check(void)
{
	char name[1024];
	FILE *f;
	vec3_t v;
	strcpy(name, currentmap);
	{
		int length = (int)strlen(name) - 1;
		while (length > 0) {
			if (name[length] == '.') break;
			--length;
			if (name[length] == '/') goto extension_done;
		}
		if (length) name[length] = 0;
	}
extension_done:
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
	unsigned int packed;
	GfxPointVertex verts[1362];
	int vertCount;
	int i;

	Byte4PackPixelColor( colorRed, &packed );
	i = 1;
	vertCount = 0;

	if ( i < s_num_points )
	{
		do
		{
			vertCount = R_Add3DLine( verts, s_pointvecs[i - 1], s_pointvecs[i],
				&packed, 4, vertCount, 1362 );
			++i;
		}
		while ( i < s_num_points );

		if ( vertCount )
			R_AddCmd_Line3D( vertCount / 2, 4, verts );
	}
}





















void Pointfile_Clear(void) { s_num_points = 0; }
int Pointfile_HasPoints(void) { return s_num_points != 0; }
