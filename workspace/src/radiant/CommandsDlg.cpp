#include "stdafx.h"

#include "CommandsDlg.h"

CCommandsDlg::CCommandsDlg(CWnd *pParent)
    : CDialog(CCommandsDlg::IDD, pParent)
{
}

void CCommandsDlg::DoDataExchange(CDataExchange *pDX)
{
    DDX_Control(pDX, 0x40c, m_lstCommands);
}

BEGIN_MESSAGE_MAP(CCommandsDlg, CDialog)
END_MESSAGE_MAP()

const int RAD_SHIFT = 0x01;
const int RAD_ALT = 0x02;
const int RAD_CONTROL = 0x04;

struct SCommandInfo
{
    char *m_strCommand;
    unsigned int m_nKey;
    unsigned int m_nModifiers;
    unsigned int m_nCommand;
};

struct SKeyInfo
{
    char *m_strName;
    unsigned int m_nVKKey;
};

extern SCommandInfo g_Commands[];
extern int g_nCommandCount;
extern SKeyInfo g_Keys[];
extern int g_nKeyCount;

BOOL CCommandsDlg::OnInitDialog()
{
    CDialog::OnInitDialog();
    m_lstCommands.SetTabStops(96);
    int nCount = g_nCommandCount;

    CFile fileout;
    fileout.Open("c:/commandlist.txt", CFile::modeCreate | CFile::modeWrite);
    for (int n = 0; n < nCount; n++)
    {
        CString strLine;
        char c = g_Commands[n].m_nKey;
        CString strKeys = c;
        for (int k = 0; k < g_nKeyCount; k++)
        {
            if (g_Keys[k].m_nVKKey == g_Commands[n].m_nKey)
            {
                strKeys = g_Keys[k].m_strName;
                break;
            }
        }
        CString strMod("");
        if (g_Commands[n].m_nModifiers & RAD_SHIFT)
        {
            strMod = "Shift";
        }
        if (g_Commands[n].m_nModifiers & RAD_ALT)
        {
            strMod += (strMod.GetLength() > 0) ? " + Alt" : "Alt";
        }
        if (g_Commands[n].m_nModifiers & RAD_CONTROL)
        {
            strMod += (strMod.GetLength() > 0) ? " + Control" : "Control";
        }
        if (strMod.GetLength() > 0)
        {
            strMod += " + ";
        }
        strLine.Format("%s \t%s%s", g_Commands[n].m_strCommand, (const char *)strMod, (const char *)strKeys);
        m_lstCommands.AddString(strLine);
        strLine.Format("%s \t\t\t%s%s", g_Commands[n].m_strCommand, (const char *)strMod, (const char *)strKeys);

        fileout.Write(strLine, strLine.GetLength());
        fileout.Write("\r\n", 2);
    }
    fileout.Close();
    return TRUE;
}
