#include "stdafx.h"
#include <afxtempl.h>
#include <stdlib.h>
#include "../universal/assertive.h"

#define mapinfo_assert1(expr) do { static bool s_assertDisable; if (!(expr) && !s_assertDisable) { switch (FUN_0047d980(#expr, __FILE__, __LINE__, 1, 1)) { case 0: DebugBreak(); break; case 2: s_assertDisable = true; break; } } } while (0)

struct eclass_t
{
	int pad00;
	char *name;
	int fixedsize;
	unsigned char pad0c[0x154];
	unsigned int flags;
};

struct entdef_t
{
	unsigned char pad00[0x50];
	eclass_t *eclass;
};

struct entity_t;

struct brushdef_t
{
	unsigned char pad00[8];
	entdef_t *owner;
};

struct brush_t
{
	brush_t *prev;
	brush_t *next;
	entity_t *owner;
	unsigned char pad0c[8];
	brushdef_t *def;
	unsigned char pad18[8];
	void **patch;
};

struct entdef_t;

struct prefab_t;

struct entity_t
{
	entity_t *prev;
	entity_t *next;
	entdef_t *def;
	unsigned char pad0c[0x2c];
	prefab_t *prefab;
};

struct prefab_t
{
	entity_t *prev;
	entity_t *next;
	unsigned char pad08[4];
	brush_t brushes;
};

extern brush_t active_brushes;
extern entity_t entities;
void FUN_0046fbe0(int a);
bool FUN_00463d60(eclass_t *eclass);

static void FUN_0041f670(brush_t *b, int *stats)
{
#line 30
	assert(b);
#line 31
	assert(stats);
	if (b->patch)
	{
		if (((unsigned char *)*b->patch)[0x10] & 0x40)
			stats[2]++;
		else
			stats[1]++;
	}
	else
		stats[0]++;
}

void FUN_0041f710(int *worldStats, int *prefabStats, brush_t *brushList, entity_t *entList)
{
#line 54
	assert(worldStats);
#line 55
	assert(prefabStats);
#line 56
	assert(brushList);
	for (brush_t *b = brushList->next; b != brushList; b = b->next)
	{
#line 60
		mapinfo_assert1(b->owner);
#line 61
		assert(b->owner->def == b->def->owner);
		if (b->owner->def->eclass->fixedsize == 0)
			FUN_0041f670(b, worldStats);
	}
	for (entity_t *e = entList->next; e != entList; e = e->next)
	{
		eclass_t *ec = e->def->eclass;
		if (ec->fixedsize)
		{
			if (ec->flags & 0x10)
			{
				worldStats[6]++;
				if (e->prefab)
					FUN_0041f710(prefabStats, prefabStats, &e->prefab->brushes, (entity_t *)e->prefab);
			}
			else if ((ec->flags & 8) || FUN_00463d60(ec))
				worldStats[5]++;
			else
				worldStats[4]++;
		}
		else
			worldStats[3]++;
	}
}

void FUN_0041f910(CMapStringToPtr *map, entity_t *entList)
{
#line 99
	assert(entList);
	int nValue = 0;
	for (entity_t *e = entList->next; e != entList; e = e->next)
	{
		nValue = 0;
		map->Lookup(e->def->eclass->name, reinterpret_cast<void *&>(nValue));
		nValue++;
		void *v = reinterpret_cast<void *>(nValue);
		(*map)[e->def->eclass->name] = v;
		if ((e->def->eclass->flags & 0x10) && e->prefab)
			FUN_0041f910(map, (entity_t *)e->prefab);
	}
}

class CMapInfo : public CDialog
{
public:
	enum { IDD = 0x80 };
	CMapInfo(CWnd *pParent = NULL);
	CListBox m_lstEntity;

protected:
	virtual void DoDataExchange(CDataExchange *pDX);
	virtual BOOL OnInitDialog();
	void FUN_0041fa90(int id, int value);
	DECLARE_MESSAGE_MAP()
};

CMapInfo::CMapInfo(CWnd *pParent)
	: CDialog(CMapInfo::IDD, pParent)
{
}

void CMapInfo::DoDataExchange(CDataExchange *pDX)
{
	DDX_Control(pDX, 0x3f5, m_lstEntity);
}

BEGIN_MESSAGE_MAP(CMapInfo, CDialog)
END_MESSAGE_MAP()

void CMapInfo::FUN_0041fa90(int id, int value)
{
	CWnd *item = GetDlgItem(id);
#line 149
	assert(item);
	char buf[32];
	_itoa(value, buf, 10);
	item->SetWindowText(buf);
}

BOOL CMapInfo::OnInitDialog()
{
	CDialog::OnInitDialog();
	int w[7] = {0};
	int p[7] = {0};
	FUN_0046fbe0(1);
	FUN_0041f710(w, p, &active_brushes, &entities);
	int wBrushes = w[2] + w[1] + w[0];
	int pBrushes = p[2] + p[1] + p[0];
	int wEnts = w[3] + w[4] + w[5] + w[6];
	int pEnts = p[3] + p[4] + p[5] + p[6];
	FUN_0041fa90(0x5d2, w[0]);
	FUN_0041fa90(0x5d5, w[1]);
	FUN_0041fa90(0x5d8, w[2]);
	FUN_0041fa90(0x5db, wBrushes);
	FUN_0041fa90(0x5de, w[3]);
	FUN_0041fa90(0x5e1, w[4]);
	FUN_0041fa90(0x5e4, w[5]);
	FUN_0041fa90(0x5e7, w[6]);
	FUN_0041fa90(0x5ea, wEnts);
	FUN_0041fa90(0x5d3, p[0]);
	FUN_0041fa90(0x5d6, p[1]);
	FUN_0041fa90(0x5d9, p[2]);
	FUN_0041fa90(0x5dc, pBrushes);
	FUN_0041fa90(0x5df, p[3]);
	FUN_0041fa90(0x5e2, p[4]);
	FUN_0041fa90(0x5e5, p[5]);
	FUN_0041fa90(0x5e8, p[6]);
	FUN_0041fa90(0x5eb, pEnts);
	FUN_0041fa90(0x5d4, p[0] + w[0]);
	FUN_0041fa90(0x5d7, p[1] + w[1]);
	FUN_0041fa90(0x5da, p[2] + w[2]);
	FUN_0041fa90(0x5dd, p[2] + p[1] + p[0] + w[2] + w[1] + w[0]);
	FUN_0041fa90(0x5e0, p[3] + w[3]);
	FUN_0041fa90(0x5e3, p[4] + w[4]);
	FUN_0041fa90(0x5e6, p[5] + w[5]);
	FUN_0041fa90(0x5e9, p[6] + w[6]);
	FUN_0041fa90(0x5ec, pEnts + wEnts);

	CMapStringToPtr mapEntity(10);
	FUN_0041f910(&mapEntity, &entities);
	m_lstEntity.ResetContent();
	m_lstEntity.SetTabStops(196);
	CString strKey;
	POSITION pos = mapEntity.GetStartPosition();
	while (pos)
	{
		void *value;
		mapEntity.GetNextAssoc(pos, strKey, value);
		CString strList;
		strList.Format("%s\t%i", (const char *)strKey, (int)value);
		m_lstEntity.AddString(strList);
	}
	UpdateData(FALSE);
	return TRUE;
}
