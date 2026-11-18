#pragma once

// Retail class views shared by MainFrm.cpp, TextureBar.cpp and brush.cpp.
class CLstToolBar : public CToolBar
{
public:
  CLstToolBar();
  virtual ~CLstToolBar();

protected:
  afx_msg void OnParentNotify(UINT message, LPARAM lParam);

  DECLARE_MESSAGE_MAP()
};

class CTextureBar : public CDialogBar
{
public:
  CTextureBar();

  CSpinButtonCtrl m_spinRotate;
  CSpinButtonCtrl m_spinVScale;
  CSpinButtonCtrl m_spinVShift;
  CSpinButtonCtrl m_spinHScale;
  CSpinButtonCtrl m_spinHShift;
  int m_nHShift;
  int m_nHScale;
  int m_nRotate;
  int m_nVShift;
  int m_nVScale;
  int m_nRotateAmt;

protected:
  virtual void DoDataExchange(CDataExchange *pDX);
  afx_msg int OnCreate(LPCREATESTRUCT lpCreateStruct);

public:
  void FUN_0043f460();
};
