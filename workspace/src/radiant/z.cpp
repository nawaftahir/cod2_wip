#include "stdafx.h"
#include <math.h>
#include <stdio.h>
#include "../universal/assertive.h"

struct z_t
{
	int cursory;
	int cursorx;
	int width;
	int height;
	int timing;
	float origin[3];
	float scale;
};
extern z_t z;

struct ZVert
{
	float xyz[3];
	unsigned color;
};

struct ZEclass { unsigned char pad_00[0x24]; float color[4]; };
struct ZEntityDef { unsigned char pad_00[0x08]; void *owner; unsigned char pad_0c[0x44]; ZEclass *eclass; };
struct ZEntity { unsigned char pad_00[0x08]; ZEntityDef *def; };
struct brushdef_t { unsigned char pad_00[0x08]; void *owner; unsigned char pad_0c[0x14]; float mins[3]; float maxs[3]; };
struct brush_t { brush_t *prev; brush_t *next; ZEntity *owner; unsigned char pad_0c[0x0c]; brushdef_t *def; };
class CPrefsDlg { public: unsigned char pad_00[0x2b0]; int m_nMouseButtons; };
class CCamWnd { public: unsigned char pad_00[0x68]; float field_68; };
class CMainFrame { public: unsigned char pad_00[0x78c]; CCamWnd *m_pCamWnd; };

// renderer export table, base 0x59c300; only the slots used here are typed
struct ZRefExport
{
	unsigned char pad000[0x11c];
	void (*DrawText)(const char *text, int font, const float *origin, const float *right, const float *up, const float *color);
	unsigned char pad120[0x34];
	void (*SetupZ)(const float *origin, const float *axis, float scale);
	unsigned char pad158[4];
	void (*AddLines)(int count, int width, const ZVert *verts);
	unsigned char pad160[4];
	void (*ColorToBytes)(const float *color, unsigned *out);
};
extern ZRefExport re;

extern brush_t selected_brushes;
extern brush_t active_brushes;
extern CPrefsDlg *g_PrefsDlg;
extern CMainFrame *g_pParentWnd;
extern unsigned g_nUpdateBits;
extern bool DAT_0112993c;
extern bool DAT_0112993d;
extern int d_showgrid;
extern int d_gridsize;
extern int g_font;
extern float region_mins[3];
extern float region_maxs[3];
extern float g_colorGridBack[4];
extern float g_colorGridMinor[4];
extern float g_colorGridMajor[4];
extern float g_colorGridText[4];
extern float g_colorCamera[4];
extern float g_colorSelected[4];
extern float g_colorBrushes[4];
extern float g_zTextOrient[16];
extern int g_zAxisInit;

void Sys_GetCursorPos(int *x, int *y);
void Drag_Begin(int x, int y, int buttons, float *right, float *up, float *origin, float *dir);
void Drag_MouseUp(int buttons);
void FUN_004623e0(int buttons, int x, int y, float *origin, float *dir);
int R_Add3DLine(float *p0, float *p1, const unsigned *color, int width, int count, int max, ZVert *verts);
int FUN_0040bf80(float x0, float y0, float x1, float y1, const unsigned *color, int width, int count, int max, ZVert *verts);
bool FUN_00458fa0(brush_t *b, float *origin, float *dir, float *t);
void FUN_0045d090(float *color);
void OrientationPosToWorldPos(float *orient, float *pos, float *out);

// 0x0047aea0 (41 B)
void Z_Init(void)
{
	z.origin[0] = 0;
	z.origin[1] = 20;
	z.origin[2] = 46;
	z.scale = 1.0f;
}

// 0x0047aed0: pick ray for a z view drag at window row y
void FUN_0047aed0(int y, float *origin, float *dir)
{
	origin[0] = z.origin[0];
	origin[1] = z.origin[1];
	origin[2] = z.origin[2];
	origin[2] = (float)(y - z.height / 2) / z.scale + origin[2];
	origin[1] = -262144.0f;
	brush_t *b = selected_brushes.next;
	if (b != &selected_brushes)
		origin[0] = (b->def->maxs[0] + b->def->mins[0]) * 0.5f;
	dir[0] = 0;
	dir[1] = 1;
	dir[2] = 0;
}

// 0x0047af50
void Z_MouseDown(int x, int y, int buttons)
{
	int cx, cy;
	float vup[3], vright[3], org[3], dir[3];

	Sys_GetCursorPos(&cx, &cy);
	z.cursorx = cx;
	z.cursory = cy;
	vup[0] = 0;
	vup[1] = 0;
	vup[2] = 1.0f / z.scale;
	FUN_0047aed0(y, org, dir);
	vright[0] = 0;
	vright[1] = 0;
	vright[2] = 0;

	int nMouseButton = g_PrefsDlg->m_nMouseButtons == 2 ? MK_RBUTTON : MK_MBUTTON;
	if (buttons == MK_LBUTTON || buttons == (MK_LBUTTON | MK_SHIFT) || buttons == MK_MBUTTON
		|| buttons == (nMouseButton | MK_SHIFT | MK_CONTROL))
	{
		Drag_Begin(x, y, buttons, vright, vup, org, dir);
		return;
	}
	if (buttons == (MK_CONTROL | nMouseButton) || buttons == (MK_CONTROL | MK_LBUTTON))
	{
		g_pParentWnd->m_pCamWnd->field_68 = org[2];
		g_nUpdateBits |= 0xd;
	}
}

// 0x0047b030 (8 B)
void Z_MouseUp(int x, int y, int buttons)
{
	Drag_MouseUp(buttons);
}

// 0x0047b040
void Z_MouseMoved(int x, int y, int buttons)
{
	if (!buttons)
		return;
	if (buttons == MK_LBUTTON)
	{
		if (DAT_0112993c || DAT_0112993d)
		{
			DAT_0112993c = false;
			DAT_0112993d = false;
			return;
		}
		float origin[3], dir[3];
		FUN_0047aed0(y, origin, dir);
		FUN_004623e0(1, x, y, origin, dir);
		g_nUpdateBits |= 0x10a;
		return;
	}
	if (buttons == MK_RBUTTON)
	{
		POINT cursor;
		GetCursorPos(&cursor);
		if (cursor.y != z.cursory)
		{
			z.origin[2] += (float)(cursor.y - z.cursory);
			SetCursorPos(z.cursorx, z.cursory);
			g_nUpdateBits |= 8;
		}
		return;
	}
	int nMouseButton = g_PrefsDlg->m_nMouseButtons == 2 ? MK_RBUTTON : MK_MBUTTON;
	if (buttons == (nMouseButton | MK_CONTROL) || buttons == (MK_LBUTTON | MK_CONTROL))
	{
		g_pParentWnd->m_pCamWnd->field_68 = (float)(y - z.height / 2) / z.scale;
		g_nUpdateBits |= 0xd;
	}
}

// 0x0047b180
void Z_DrawGrid(void)
{
	ZVert verts[0x552];
	char text[32];
	unsigned color;

	int w = (int)((float)z.width * 0.5f / z.scale);
	int h = (int)((float)z.height * 0.5f / z.scale);
	float zb = z.origin[2] - (float)h;
	if (!(zb >= region_mins[2]))
		zb = region_mins[2];
	zb = (float)floor(zb / 64.0f) * 64.0f;
	float zt = (float)h + z.origin[2];
	if (!(zt <= region_maxs[2]))
		zt = region_maxs[2];
	zt = (float)ceil(zt / 64.0f) * 64.0f;

	re.ColorToBytes(g_colorGridMajor, &color);
	float p0[3] = {0, zb, 0};
	float p1[3] = {0, zt, 0};
	OrientationPosToWorldPos(g_zTextOrient, p0, verts[0].xyz);
	OrientationPosToWorldPos(g_zTextOrient, p1, verts[1].xyz);
	verts[0].color = color;
	verts[1].color = color;
	int count = 2;
	for (float zg = zb; zg < zt; zg += 64.0f)
	{
		p0[0] = (float)-w;
		p0[1] = zg;
		p0[2] = 0;
		p1[0] = (float)w;
		p1[1] = zg;
		p1[2] = 0;
		count = R_Add3DLine(p0, p1, &color, 1, count, 0x552, verts);
	}

	if (d_showgrid)
	{
		if (!((float)d_gridsize * z.scale < 4.0f)
			&& (g_colorGridMinor[0] != g_colorGridBack[0] || g_colorGridMinor[1] != g_colorGridBack[1]
				|| g_colorGridMinor[2] != g_colorGridBack[2]))
		{
			re.ColorToBytes(g_colorGridMinor, &color);
			for (float zg = zb; zg < zt; zg += (float)d_gridsize)
			{
				if (((int)zg & 63) != 0)
				{
					p0[0] = (float)-w;
					p0[1] = zg;
					p0[2] = 0;
					p1[0] = (float)w;
					p1[1] = zg;
					p1[2] = 0;
					count = R_Add3DLine(p0, p1, &color, 1, count, 0x552, verts);
				}
			}
		}
	}
	if (count)
		re.AddLines(count / 2, 1, verts);

	float pos[3] = {(float)(1 - w), 0, 0};
	float right[3] = {1.0f / z.scale, 0, 0};
	float up[3] = {0, -1.0f / z.scale, 0};
	for (float zg = zb; zg < zt; zg += 64.0f)
	{
		sprintf(text, "%i", (int)zg);
		pos[1] = zg;
		re.DrawText(text, g_font, pos, right, up, g_colorGridText);
	}
}

// 0x0047b6c0
void ZDrawCameraIcon(void)
{
	ZVert verts[16];
	unsigned color;
	float p0[3], p1[3];
	int xCam = z.width / 4;
	float y = g_pParentWnd->m_pCamWnd->field_68;
	float xc = (float)xCam;
	float nx = -xc;

	re.ColorToBytes(g_colorCamera, &color);
	p0[2] = 0;
	p1[2] = 0;
	p0[0] = nx; p0[1] = y; p1[0] = 0; p1[1] = y + 8.0f;
	int n = R_Add3DLine(p0, p1, &color, 1, 0, 16, verts);
	p0[0] = xc; p0[1] = y; p1[0] = 0; p1[1] = y + 8.0f;
	n = R_Add3DLine(p0, p1, &color, 1, n, 16, verts);
	p0[0] = xc; p0[1] = y; p1[0] = 0; p1[1] = y - 8.0f;
	n = R_Add3DLine(p0, p1, &color, 1, n, 16, verts);
	p0[0] = nx; p0[1] = y; p1[0] = 0; p1[1] = y - 8.0f;
	n = R_Add3DLine(p0, p1, &color, 1, n, 16, verts);
	p0[0] = nx; p0[1] = y; p1[0] = xc; p1[1] = y;
	n = R_Add3DLine(p0, p1, &color, 1, n, 16, verts);
	p0[0] = xc; p0[1] = y; p1[0] = xc; p1[1] = y - 48.0f;
	n = R_Add3DLine(p0, p1, &color, 1, n, 16, verts);
	p0[0] = nx; p0[1] = y - 48.0f; p1[0] = xc; p1[1] = y - 48.0f;
	n = R_Add3DLine(p0, p1, &color, 1, n, 16, verts);
	p0[0] = nx; p0[1] = y - 48.0f; p1[0] = nx; p1[1] = y;
	n = R_Add3DLine(p0, p1, &color, 1, n, 16, verts);
	assert(n == 16);
	if (n)
		re.AddLines(n / 2, 1, verts);
}

// 0x0047ba90
void Z_Draw(void)
{
	ZVert verts[0x552];
	ZVert boxVerts[0x552];
	unsigned color;
	unsigned cameraColor;
	float origin[3];
	float axis[9];
	float lo[3], hi[3], dirUp[3], dirDown[3];
	float tTop, tBottom;
	float lightColor[4];
	int xCam = z.height / 3;
	int linesCount = 0;
	int boxCount = 0;

	if (!active_brushes.prev)
		return;
	origin[0] = 0;
	origin[1] = 0;
	origin[2] = z.origin[2];
	axis[0] = 0; axis[1] = 0; axis[2] = 1.0f;
	axis[3] = -1.0f; axis[4] = 0; axis[5] = 0;
	axis[6] = 0; axis[7] = 1.0f; axis[8] = 0;
	re.SetupZ(origin, axis, z.scale);
	Z_DrawGrid();

	dirUp[0] = 0; dirUp[1] = 0; dirUp[2] = 1.0f;
	dirDown[0] = 0; dirDown[1] = 0; dirDown[2] = -1.0f;
	lo[0] = z.origin[0]; lo[1] = z.origin[1]; lo[2] = -131072.0f;
	hi[0] = z.origin[0]; hi[1] = z.origin[1]; hi[2] = 131072.0f;
	re.ColorToBytes(g_colorBrushes, &color);
	int width = (int)((float)(xCam * 2) * z.scale);

	for (brush_t *b = active_brushes.prev; b != &active_brushes; b = b->next)
	{
		brushdef_t *def = b->def;
		if (def->mins[0] < z.origin[0] && def->maxs[0] > z.origin[0]
			&& def->mins[1] < z.origin[1] && def->maxs[1] > z.origin[1])
		{
			if (FUN_00458fa0(b, hi, dirDown, &tTop))
			{
				tTop = 131072.0f - tTop;
				if (FUN_00458fa0(b, lo, dirUp, &tBottom))
				{
					tBottom = tBottom - 131072.0f;
					assert(b->owner);
					assert(b->owner->def);
					assert(b->owner->def == b->def->owner);
					assert(b->owner->def->eclass);
					lightColor[0] = b->owner->def->eclass->color[0];
					lightColor[1] = b->owner->def->eclass->color[1];
					lightColor[2] = b->owner->def->eclass->color[2];
					lightColor[3] = b->owner->def->eclass->color[3];
					FUN_0045d090(lightColor);
					re.ColorToBytes(lightColor, &color);
					linesCount = FUN_0040bf80(0, tBottom, 0, tTop, &color, width, linesCount, 0x552, verts);
					float fx = (float)xCam;
					float nx = (float)-xCam;
					boxCount = FUN_0040bf80(nx, tBottom, fx, tBottom, &color, 1, boxCount, 0x552, boxVerts);
					boxCount = FUN_0040bf80(fx, tBottom, fx, tTop, &color, 1, boxCount, 0x552, boxVerts);
					boxCount = FUN_0040bf80(fx, tTop, nx, tTop, &color, 1, boxCount, 0x552, boxVerts);
					boxCount = FUN_0040bf80(nx, tTop, nx, tBottom, &color, 1, boxCount, 0x552, boxVerts);
				}
			}
		}
	}
	if (linesCount)
		re.AddLines(linesCount / 2, width, verts);
	if (boxCount)
		re.AddLines(boxCount / 2, 1, boxVerts);

	linesCount = 0;
	boxCount = 0;
	re.ColorToBytes(g_colorSelected, &cameraColor);
	if (selected_brushes.prev != &selected_brushes)
	{
		for (brush_t *b = selected_brushes.prev; b != &selected_brushes; b = b->next)
		{
			brushdef_t *def = b->def;
			if (def->mins[0] < z.origin[0] && def->maxs[0] > z.origin[0]
				&& def->mins[1] < z.origin[1] && def->maxs[1] > z.origin[1])
			{
				if (FUN_00458fa0(b, hi, dirDown, &tTop))
				{
					tTop = 131072.0f - tTop;
					if (FUN_00458fa0(b, lo, dirUp, &tBottom))
					{
						tBottom = tBottom - 131072.0f;
						assert(b->owner);
						assert(b->owner->def);
						assert(b->owner->def == b->def->owner);
						assert(b->owner->def->eclass);
						lightColor[0] = b->owner->def->eclass->color[0];
						lightColor[1] = b->owner->def->eclass->color[1];
						lightColor[2] = b->owner->def->eclass->color[2];
						lightColor[3] = b->owner->def->eclass->color[3];
						FUN_0045d090(lightColor);
						re.ColorToBytes(lightColor, &color);
						linesCount = R_Add3DLine(lo, hi, &color, width, linesCount, 0x552, verts);
					}
				}
			}
			float zLo = b->def->mins[2];
			float zHi = b->def->maxs[2];
			float fx = (float)xCam;
			float nx = (float)-xCam;
			boxCount = FUN_0040bf80(nx, zLo, fx, zLo, &cameraColor, 1, boxCount, 0x552, boxVerts);
			boxCount = FUN_0040bf80(fx, zLo, fx, zHi, &cameraColor, 1, boxCount, 0x552, boxVerts);
			boxCount = FUN_0040bf80(fx, zHi, nx, zHi, &cameraColor, 1, boxCount, 0x552, boxVerts);
			boxCount = FUN_0040bf80(nx, zHi, nx, zLo, &cameraColor, 1, boxCount, 0x552, boxVerts);
		}
		if (linesCount)
			re.AddLines(linesCount / 2, width, verts);
		if (boxCount)
			re.AddLines(boxCount / 2, 1, boxVerts);
	}
	ZDrawCameraIcon();
}
