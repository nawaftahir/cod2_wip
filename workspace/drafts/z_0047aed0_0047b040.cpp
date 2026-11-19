#include "stdafx.h"

typedef float vec3_t[3];

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

struct brushdef_t { unsigned char pad_00[0x20]; vec3_t mins; vec3_t maxs; };
struct brush_t { brush_t *prev; brush_t *next; unsigned char pad_08[0x0c]; brushdef_t *def; };
class CPrefsDlg { public: unsigned char pad_00[0x2b0]; int m_nMouseButtons; };
class CCamWnd { public: unsigned char pad_00[0x68]; float field_68; };
class CMainFrame { public: unsigned char pad_00[0x78c]; CCamWnd *m_pCamWnd; };

extern brush_t selected_brushes;
extern CPrefsDlg *g_PrefsDlg;
extern CMainFrame *g_pParentWnd;
extern unsigned g_nUpdateBits;
extern bool DAT_0112993c;
extern bool DAT_0112993d;
void Drag_MouseMoved(int x, int y, int buttons, float *origin, float *dir);

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
		vec3_t origin, dir;
		FUN_0047aed0(y, origin, dir);
		Drag_MouseMoved(x, y, 1, origin, dir);
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
