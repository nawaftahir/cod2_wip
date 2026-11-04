// Probe: MFC classes the editor constructs, so the unit emits their inline ctors, dtors, vtables
// and scalar deleting destructors with the game flags.
#include <afxwin.h>
#include <afxext.h>
#include <afxcmn.h>
#include <afxdlgs.h>
#include <afxtempl.h>
#include <afxcview.h>
#include <afxrich.h>
#define USE(T) void use_##T() { T *p = new T; delete p; }
USE(CEdit) USE(CButton) USE(CSliderCtrl) USE(CListBox) USE(CComboBox) USE(CScrollBar) USE(CSpinButtonCtrl)
USE(CTabCtrl) USE(CTreeCtrl) USE(CListCtrl) USE(CStatic) USE(CFont) USE(CMenu) USE(CBrush) USE(CPen)
USE(CBitmap) USE(CRgn) USE(CToolBar) USE(CStatusBar) USE(CDialogBar) USE(CReBar) USE(CStringArray)
USE(CStringList) USE(CPtrArray) USE(CPtrList) USE(CMapStringToPtr) USE(CMapPtrToPtr) USE(CMapStringToString)
USE(CByteArray) USE(CUIntArray) USE(CImageList) USE(CMemFile) USE(CRichEditCtrl) USE(CProgressCtrl)
USE(CToolTipCtrl) USE(CHeaderCtrl) USE(CSplitterWnd) USE(CDragListBox) USE(CAnimateCtrl) USE(CHotKeyCtrl)
USE(CStatusBarCtrl) USE(CToolBarCtrl) USE(CFrameWnd) USE(CMiniFrameWnd) USE(CWnd) USE(CFileFind) USE(CFile)
USE(CObList) USE(CDWordArray) USE(CWordArray) USE(CObArray) USE(CMapWordToPtr) USE(CMapPtrToWord) USE(CMapStringToOb)
void use_dc(CWnd *w) { CPaintDC a(w); CClientDC b(w); CWindowDC c(w); CDC d; CRect r; CPoint pt; CSize s; }
void use_dlg() { CColorDialog c; c.DoModal(); CFileDialog f(TRUE); f.DoModal(); CFontDialog fd; fd.DoModal(); }
