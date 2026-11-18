#pragma once

/* CFilterSettings is the retail class name (RTTI); only the members written here are declared. */
class CFilterSettings : public CDialog
{
public:
  CString m_text470; // offset 0x70, bound to edit 0x470
  CFilterSettings(CWnd *pParent);
  virtual void DoDataExchange(CDataExchange *pDX);
  virtual BOOL OnInitDialog();
  void OnShowWindow(BOOL bShow, UINT nStatus);
  virtual void OnOK();
  void FUN_0040e4f0();
  void FUN_0040e660();
  virtual BOOL OnCommand(WPARAM wParam, LPARAM lParam);
};
