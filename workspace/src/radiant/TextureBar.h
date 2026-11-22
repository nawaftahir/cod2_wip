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
  afx_msg void OnDeltaposSpinHshift(NMHDR *pNMHDR, LRESULT *pResult);
  afx_msg void OnDeltaposSpinVshift(NMHDR *pNMHDR, LRESULT *pResult);
  afx_msg void OnDeltaposSpinHScale(NMHDR *pNMHDR, LRESULT *pResult);
  afx_msg void OnDeltaposSpinVScale(NMHDR *pNMHDR, LRESULT *pResult);
  afx_msg void OnDeltaposSpinRotate(NMHDR *pNMHDR, LRESULT *pResult);
  afx_msg void FUN_0043f420();
  afx_msg int OnCreate(LPCREATESTRUCT lpCreateStruct);
  afx_msg void OnBtnApplytexturestuff();

  DECLARE_MESSAGE_MAP()

public:
  void FUN_0043f460();
  void SetSurfaceAttributes();
};
