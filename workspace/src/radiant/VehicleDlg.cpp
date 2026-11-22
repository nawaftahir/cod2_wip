#include "stdafx.h"
#include <stdlib.h>
#include "PrefsDlg.h"
#include "../universal/assertive.h"

struct epair_t;

struct entity_t
{
    unsigned char pad00[0x64];
    epair_t *epairs;
};

struct entityInst_t
{
    unsigned char pad00[8];
    entity_t *def;
};

struct brushdef_t
{
    unsigned char pad00[8];
    entity_t *owner;
};

struct brush_t
{
    brush_t *prev;
    brush_t *next;
    entityInst_t *owner;
    unsigned char pad0c[8];
    brushdef_t *def;
};

extern brush_t selected_brushes;
extern entityInst_t *DAT_012334ec;
extern CPrefsDlg *dword_01233b64;
extern HWND dword_010bcd58;
extern int g_nUpdateBits;
void DeleteKey(epair_t *&e, const char *key);
void FUN_00465bf0(entity_t *e, const char *key, const char *value);
void FUN_004655f0(entity_t *e, const char *key);
void FUN_004657a0(entity_t *e, const char *key);
void FUN_0045c6b0();

void FUN_004454f0(const char *text);
void FUN_004452f0();
void FUN_00445310(const char *group);
void FUN_00445370(const char *key, const char *value);
void FUN_00445420(const char *key);

class CVehicleDlg : public CDialog
{
    DECLARE_DYNAMIC(CVehicleDlg)

public:
    enum { IDD = 228 };

    CVehicleDlg(CWnd *pParent = NULL);
    virtual ~CVehicleDlg();

protected:
    virtual void DoDataExchange(CDataExchange *pDX);
    virtual BOOL OnInitDialog();
    afx_msg void FUN_00445510();
    afx_msg void FUN_00445520();
    afx_msg void FUN_00445530();
    afx_msg void FUN_00445540();
    afx_msg void FUN_00445550();
    afx_msg void FUN_00445560();
    afx_msg void FUN_00445570();
    afx_msg void FUN_00445580();
    afx_msg void FUN_00445590();
    afx_msg void FUN_004455a0();
    afx_msg void FUN_004455c0();
    afx_msg void FUN_004455e0();
    afx_msg void FUN_00445600();
    afx_msg void FUN_00445620();
    afx_msg void FUN_00445640();
    afx_msg void FUN_00445660();
    afx_msg void FUN_00445680();
    afx_msg void FUN_004456a0();
    afx_msg void FUN_004456c0();
    afx_msg void FUN_004456e0();
    afx_msg void FUN_00445700();
    afx_msg void FUN_00445720();
    afx_msg void FUN_00445740();
    afx_msg void FUN_00445760();
    afx_msg void FUN_00445780();
    afx_msg void FUN_004457a0();
    afx_msg void FUN_004457c0();
    afx_msg void FUN_004457e0();
    afx_msg void FUN_00445800();
    afx_msg void FUN_00445820();
    afx_msg void FUN_00445840();
    afx_msg void FUN_00445860();
    afx_msg void FUN_00445880();
    afx_msg void FUN_004458a0();
    afx_msg void FUN_004458c0();
    afx_msg void FUN_004458e0();
    afx_msg void FUN_00445900();
    afx_msg void FUN_004459b0();
    afx_msg void FUN_004459d0();
    afx_msg void FUN_004459f0();
    afx_msg void FUN_00445ac0(NMHDR *pNMHDR, LRESULT *pResult);
    afx_msg void FUN_00445bc0();
    afx_msg void FUN_00445c60();
    afx_msg void FUN_00445d10();
    afx_msg void FUN_00445d30();
    afx_msg void FUN_00445d40();
    afx_msg void FUN_00445d60();
    afx_msg void FUN_00445d80();
    afx_msg void FUN_00445da0();
    afx_msg void FUN_00445dc0();
    afx_msg void FUN_00445e20();
    afx_msg void FUN_00445e30();
    afx_msg void FUN_00445e50();
    afx_msg void FUN_00445f00();
    afx_msg void FUN_00445f20();
    afx_msg void FUN_00445f40();
    afx_msg void FUN_00445ff0();
    afx_msg void FUN_00446010();
    DECLARE_MESSAGE_MAP()

    CEdit m_editHealth;
    CEdit m_editAccuracy;
    CEdit m_editSpeed;
    CEdit m_editLookahead;
    CSliderCtrl m_slider;
    CComboBox m_combo;
};

typedef char CVehicleDlgSize[(sizeof(CVehicleDlg) == 0x250) ? 1 : -1];

IMPLEMENT_DYNAMIC(CVehicleDlg, CDialog)

CVehicleDlg::CVehicleDlg(CWnd *pParent)
    : CDialog(IDD, pParent)
{
}

CVehicleDlg::~CVehicleDlg()
{
}

void CVehicleDlg::DoDataExchange(CDataExchange *pDX)
{
    DDX_Control(pDX, 1597, m_editHealth);
    DDX_Control(pDX, 1617, m_editSpeed);
    DDX_Control(pDX, 1622, m_editLookahead);
    DDX_Control(pDX, 1603, m_editAccuracy);
    DDX_Control(pDX, 1600, m_slider);
    DDX_Control(pDX, 1611, m_combo);
}

BEGIN_MESSAGE_MAP(CVehicleDlg, CDialog)
    ON_COMMAND(1540, FUN_00445510)
    ON_COMMAND(1542, FUN_00445520)
    ON_COMMAND(1543, FUN_00445530)
    ON_COMMAND(1545, FUN_00445540)
    ON_COMMAND(1546, FUN_00445550)
    ON_COMMAND(1552, FUN_00445560)
    ON_COMMAND(1553, FUN_00445570)
    ON_COMMAND(1554, FUN_00445580)
    ON_COMMAND(1555, FUN_00445590)
    ON_COMMAND(1556, FUN_004455a0)
    ON_COMMAND(1558, FUN_004455c0)
    ON_COMMAND(1548, FUN_004455e0)
    ON_COMMAND(1549, FUN_00445600)
    ON_COMMAND(1551, FUN_00445620)
    ON_COMMAND(1550, FUN_00445640)
    ON_COMMAND(1586, FUN_00445660)
    ON_COMMAND(1587, FUN_00445680)
    ON_COMMAND(1589, FUN_004456a0)
    ON_COMMAND(1590, FUN_004456c0)
    ON_COMMAND(1592, FUN_004456e0)
    ON_COMMAND(1593, FUN_00445700)
    ON_COMMAND(1561, FUN_00445720)
    ON_COMMAND(1563, FUN_00445740)
    ON_COMMAND(1565, FUN_00445760)
    ON_COMMAND(1567, FUN_00445780)
    ON_COMMAND(1569, FUN_004457a0)
    ON_COMMAND(1571, FUN_004457c0)
    ON_COMMAND(1572, FUN_004457e0)
    ON_COMMAND(1574, FUN_00445800)
    ON_COMMAND(1577, FUN_00445820)
    ON_COMMAND(1584, FUN_00445840)
    ON_COMMAND(1582, FUN_00445860)
    ON_COMMAND(1579, FUN_00445880)
    ON_COMMAND(1588, FUN_004458a0)
    ON_COMMAND(1591, FUN_004458c0)
    ON_COMMAND(1594, FUN_004458e0)
    ON_COMMAND(1596, FUN_00445900)
    ON_COMMAND(1598, FUN_004459b0)
    ON_COMMAND(1599, FUN_004459d0)
    ON_COMMAND(1602, FUN_004459f0)
    ON_NOTIFY(NM_CUSTOMDRAW, 1600, FUN_00445ac0)
    ON_EN_CHANGE(1603, FUN_00445bc0)
    ON_COMMAND(1604, FUN_00445c60)
    ON_COMMAND(1601, FUN_00445d10)
    ON_COMMAND(1605, FUN_00445d30)
    ON_COMMAND(1608, FUN_00445d40)
    ON_COMMAND(1609, FUN_00445d60)
    ON_COMMAND(1607, FUN_00445d80)
    ON_COMMAND(1610, FUN_00445da0)
    ON_COMMAND(1612, FUN_00445dc0)
    ON_COMMAND(1613, FUN_00445e20)
    ON_COMMAND(1614, FUN_00445e30)
    ON_COMMAND(1615, FUN_00445e50)
    ON_COMMAND(1616, FUN_00445f00)
    ON_COMMAND(1620, FUN_00445ff0)
    ON_COMMAND(1619, FUN_00445f40)
    ON_COMMAND(1618, FUN_00445f20)
    ON_COMMAND(1621, FUN_00446010)
END_MESSAGE_MAP()

BOOL CVehicleDlg::OnInitDialog()
{
    CDialog::OnInitDialog();
    m_slider.SetRange(0, 100);
    m_slider.SetPos(44);
    m_combo.SetCurSel(0);
    return TRUE;
}

void FUN_004452f0()
{
    HWND hWnd = GetActiveWindow();
    EndDialog(hWnd, 1);
    SetFocus(dword_010bcd58);
}

void FUN_00445310(const char *group)
{
    dword_01233b64->m_strScriptGroup = group;
    FUN_0045c6b0();
    HWND hWnd = GetActiveWindow();
    EndDialog(hWnd, 1);
    SetFocus(dword_010bcd58);
    g_nUpdateBits = -1;
}

void FUN_00445370(const char *key, const char *value)
{
    for (brush_t *b = selected_brushes.next; b != &selected_brushes; b = b->next)
    {
        if (b->owner && b->owner != DAT_012334ec)
        {
#line 133
            assert(b->owner->def == b->def->owner);
            FUN_00465bf0(b->owner->def, key, value);
        }
    }
    HWND hWnd = GetActiveWindow();
    EndDialog(hWnd, 1);
    SetFocus(dword_010bcd58);
    g_nUpdateBits = -1;
}

void FUN_00445420(const char *key)
{
    for (brush_t *b = selected_brushes.next; b != &selected_brushes; b = b->next)
    {
        if (b->owner && b->owner != DAT_012334ec)
        {
#line 151
            assert(b->owner->def == b->def->owner);
            entity_t *e = b->owner->def;
            DeleteKey(e->epairs, key);
            FUN_004655f0(e, key);
            FUN_004657a0(e, key);
        }
    }
    HWND hWnd = GetActiveWindow();
    EndDialog(hWnd, 1);
    SetFocus(dword_010bcd58);
    g_nUpdateBits = -1;
}

void FUN_004454f0(const char *text)
{
    HWND hWnd = GetActiveWindow();
    MessageBox(hWnd, text, "Help", MB_ICONASTERISK);
}

#define ShowHelp FUN_004454f0

void CVehicleDlg::FUN_00445510()
{
    FUN_00445310("script_vehiclespawngroup");
}

void CVehicleDlg::FUN_00445520()
{
    FUN_00445310("script_vehiclestartmove");
}

void CVehicleDlg::FUN_00445530()
{
    FUN_00445310("script_vehiclegroupdelete");
}

void CVehicleDlg::FUN_00445540()
{
    FUN_00445310("script_vehicleride");
}

void CVehicleDlg::FUN_00445550()
{
    FUN_00445310("script_vehiclewalk");
}

void CVehicleDlg::FUN_00445560()
{
    FUN_00445310("script_vehicleattackgroup");
}

void CVehicleDlg::FUN_00445570()
{
    FUN_00445310("script_vehiclefocusfiregroup");
}

void CVehicleDlg::FUN_00445580()
{
    FUN_00445310("script_vehicledetour");
}

void CVehicleDlg::FUN_00445590()
{
    FUN_00445310("script_gatetrigger");
}

void CVehicleDlg::FUN_004455a0()
{
    FUN_00445370("script_deathroll", "1");
}

void CVehicleDlg::FUN_004455c0()
{
    FUN_00445370("script_deathroll", "0");
}

void CVehicleDlg::FUN_004455e0()
{
    FUN_00445370("script_team", "allies");
}

void CVehicleDlg::FUN_00445600()
{
    FUN_00445370("script_team", "axis");
}

void CVehicleDlg::FUN_00445620()
{
    FUN_00445370("script_turretmg", "1");
}

void CVehicleDlg::FUN_00445640()
{
    FUN_00445370("script_turretmg", "0");
}

void CVehicleDlg::FUN_00445660()
{
    FUN_00445370("script_turret", "1");
}

void CVehicleDlg::FUN_00445680()
{
    FUN_00445370("script_turret", "0");
}

void CVehicleDlg::FUN_004456a0()
{
    FUN_00445370("script_badplace", "1");
}

void CVehicleDlg::FUN_004456c0()
{
    FUN_00445370("script_badplace", "0");
}

void CVehicleDlg::FUN_004456e0()
{
    FUN_00445370("script_avoidvehicles", "1");
}

void CVehicleDlg::FUN_00445700()
{
    FUN_00445370("script_avoidvehicles", "0");
}

void CVehicleDlg::FUN_00445720()
{
    ShowHelp("Must have trigger(s) and vehicle(s) selected.\n\nWhen one of the grouped triggers is triggered all of the grouped vehicles will spawn and attach to their targeted path nodes.");
}

void CVehicleDlg::FUN_00445740()
{
    ShowHelp("Must have trigger(s) and vehicle(s) selected.\n\nWhen one of the grouped triggers is triggered all of the grouped vehicles will start moving along their vehicle paths (vehicle must be spawned first)");
}

void CVehicleDlg::FUN_00445760()
{
    ShowHelp("Must have trigger(s) and vehicle(s) selected\n\nWhen one of the grouped triggers is triggered all of the grouped vehicles will be deleted (works well to get rid of a vehicle that will never be seen by the player again)");
}

void CVehicleDlg::FUN_00445780()
{
    ShowHelp("Must have spawner(s) and 1 vehicle selected\n\nThe grouped AI will ride on/in the grouped vehicle. The spawners automatically spawn when the vehicle is spawned");
}

void CVehicleDlg::FUN_004457a0()
{
    ShowHelp("Must have spawner(s) and 1 vehicle selected\n\nThe grouped AI will walk beside the grouped vehicle. The spawners automatically spawn when the vehicle is spawned");
}

void CVehicleDlg::FUN_004457c0()
{
    ShowHelp("Must have am vehicle node and vehicle(s) selected\n\nWhen a vehicle gets to the selected vehicle node it will begin to attack all of the grouped vehicles on the opposing team. These grouped vehicles will automatically return fire");
}

void CVehicleDlg::FUN_004457e0()
{
    ShowHelp("Must have a vehicle node and vehicle(s) selected\n\nWorks opposite of attack groups. When a vehicle gets to the selected vehicle node all grouped enemy vehicles will begin attacking the triggering vehicle");
}

void CVehicleDlg::FUN_00445800()
{
    ShowHelp("Must have 2 vehicle nodes from seperate paths selected\n\nWhen a vehicle gets to a detour node it will drive to the other grouped detour node. Use this to make a vehicle at the end of it's path merge into another path. Can also be used to make one path split off into a fork");
}

void CVehicleDlg::FUN_00445820()
{
    ShowHelp("Must have trigger(s) and vehicle node(s) selected\n\nVehicles will not be allowed to drive past the selected vehicle nodes until the grouped trigger has been hit. Vehicles stop at the node and wait for the trigger. If the trigger is hit before the vehicle gets to the node then the vehicle will not stop");
}

void CVehicleDlg::FUN_00445840()
{
    ShowHelp("Must have vehicle path node(s) selected\n\nIf deathroll is on, a vehicle that is on a path that has reached this node will continue to drive the path after it dies (and will stop when it hits a deathrolloff node). This is helpful when you never want a vehicle to die blocking another path.");
}

void CVehicleDlg::FUN_00445860()
{
    ShowHelp("Must have vehicle(s) selected\n\nSpecifies which team a vehicle belongs to so other vehicles know who their enemies are");
}

void CVehicleDlg::FUN_00445880()
{
    ShowHelp("Must have vehicle(s) selected\n\nTurns on/off the hull mounted machine guns on tanks. Defaults to on.");
}

void CVehicleDlg::FUN_004458a0()
{
    ShowHelp("Must have vehicle(s) selected\n\nDefaults to 'enabled', which enables the automated turret behaviors. Disable if you want to manually control a turret");
}

void CVehicleDlg::FUN_004458c0()
{
    ShowHelp("Must have vehicle(s) selected\n\nDefaults to 'on', which enables the creation of badplaces around moving vehicles to make AI stay away from them");
}

void CVehicleDlg::FUN_004458e0()
{
    ShowHelp("Must have vehicle(s) selected\n\nDefaults to 'enabled', which makes a vehicle avoid running into other vehicles. Setting this to 'disabled' disables vehicle avoidance forever");
}

void CVehicleDlg::FUN_00445900()
{
    CString text;
    m_editHealth.GetWindowText(text);
    if (text.GetLength() > 0)
        FUN_00445370("script_startinghealth", text);
    else
    {
        m_editHealth.SetWindowText("");
        FUN_00445420("script_startinghealth");
    }
}

void CVehicleDlg::FUN_004459b0()
{
    m_editHealth.SetWindowText("");
    FUN_00445420("script_startinghealth");
}

void CVehicleDlg::FUN_004459d0()
{
    ShowHelp("Must have vehicle(s) selected\n\nSets the health value the selected vehicles will have. Type a value into the box and hit the 'Set Health' button. Vehicles get a health value by default so if you have entered a custom value and wish to return it to default click the 'Reset Default' button.");
}

void CVehicleDlg::FUN_004459f0()
{
    CString text;
    m_editAccuracy.GetWindowText(text);
    if (text.GetLength() > 0)
    {
        float accuracy = (float)atol(text) / 100.0f;
        text.Format("%.2f", accuracy);
        FUN_00445370("script_accuracy", text);
    }
    else
        FUN_00445c60();
}

void CVehicleDlg::FUN_00445ac0(NMHDR *pNMHDR, LRESULT *pResult)
{
    CString pos;
    CString text;
    pos.Format("%i", m_slider.GetPos());
    m_editAccuracy.GetWindowText(text);
    if (pos.Compare(text) != 0)
        m_editAccuracy.SetWindowText(pos);
    *pResult = 0;
}

void CVehicleDlg::FUN_00445bc0()
{
    CString text;
    m_editAccuracy.GetWindowText(text);
    m_slider.SetPos(atol(text));
}

void CVehicleDlg::FUN_00445c60()
{
    CString text;
    m_slider.SetPos(44);
    text.Format("%i", 44);
    m_editAccuracy.SetWindowText(text);
    FUN_00445420("script_accuracy");
}

void CVehicleDlg::FUN_00445d10()
{
    ShowHelp("Must have vehicle node(s), or vehicle(s) selected.\n\nDefines what a vehicles accuracy will be. 0 means it has poor accuracy, and higher numbers mean higher accuracy. If set on a vehicle, the vehicle will start with the set accuracy. This may also be set on vehicle path nodes causing a vehicle at that node to inherit it's accuracy value.");
}

void CVehicleDlg::FUN_00445d30()
{
    FUN_00445310("script_attackorgs");
}

void CVehicleDlg::FUN_00445d40()
{
    ShowHelp("Must have vehicle node(s) and script_origin(s) selected\n\nVehicles that get to the selected vehicle paths will fire their turrets at the grouped script_origin. If the grouped script_origin targets other script_origins the vehicle will fire at them in the order they are linked. If a trigger_radius targets the grouped script_origin the vehicle will fire at enemy AI within the radius of the trigger.");
}

void CVehicleDlg::FUN_00445d60()
{
    FUN_00445370("script_attackai", "1");
}

void CVehicleDlg::FUN_00445d80()
{
    FUN_00445370("script_attackai", "0");
}

void CVehicleDlg::FUN_00445da0()
{
    ShowHelp("Must have vehicle node(s), or vehicle(s) selected\n\nEnables or disables the vehicles ablility to seek out and shoot at enemy AI with it's main turret. It can be toggled on/off with vehicle nodes or set on the vehicle itself.");
}

void CVehicleDlg::FUN_00445dc0()
{
    int sel = m_combo.GetCurSel();
    if (sel == 0)
        FUN_00445370("script_crashtype", "default");
    else if (sel == 1)
        FUN_00445370("script_crashtype", "plane");
    else if (sel == 2)
        FUN_00445370("script_crashtype", "forced");
}

void CVehicleDlg::FUN_00445e20()
{
    FUN_00445420("script_crashtype");
}

void CVehicleDlg::FUN_00445e30()
{
    ShowHelp("Must have vehicle node(s) selected\n\nNode must first be grouped with another node using 'vehicle detour'. Then set this value on the first node of the crash path.\n\nWhen a vehicle is killed it will find the next available crash path that it hasn't passed and take that path when it gets there.\n\ndefault: once a vehicle has used this crash path other vehicles wont be able to use it (should use this most of the time)\n\nplane: multiple vehicles can take this crash path (causing vehicles to pile up at the end of the path). This is usually only helpful for planes that pileup off the screen or get deleted at the end of their paths.\n\nforced: all vehicles (including a vehicle that is still alive) will take this crash path. Only one vehicle will use the path.");
}

void CVehicleDlg::FUN_00445e50()
{
    CString text;
    m_editSpeed.GetWindowText(text);
    if (text.GetLength() > 0)
        FUN_00445370("speed", text);
    else
    {
        m_editSpeed.SetWindowText("");
        FUN_00445420("speed");
    }
}

void CVehicleDlg::FUN_00445f00()
{
    m_editSpeed.SetWindowText("");
    FUN_00445420("speed");
}

void CVehicleDlg::FUN_00445f20()
{
    ShowHelp("Must have vehicle node(s) selected\n\nSpeed a vehicle will drive when it's at this node. Setting a speed on one node, and another speed on another node will make the vehicle smoothly accelerate to the next keyed speed.");
}

void CVehicleDlg::FUN_00445f40()
{
    CString text;
    m_editLookahead.GetWindowText(text);
    if (text.GetLength() > 0)
        FUN_00445370("lookahead", text);
    else
    {
        m_editLookahead.SetWindowText("");
        FUN_00445420("lookahead");
    }
}

void CVehicleDlg::FUN_00445ff0()
{
    m_editLookahead.SetWindowText("");
    FUN_00445420("lookahead");
}

void CVehicleDlg::FUN_00446010()
{
    ShowHelp("Must have vehicle node(s) selected\n\nDistance the vehicle path will lookahead to calculate the spline. Use this value to tune a vehicles spline path shape.");
}

