// Probe: emit MFC/ATL header code with the game flags, to name header functions in the retail unit.
#include <afxwin.h>
#include <afxext.h>
#include <afxcmn.h>
#include <afxdlgs.h>
#include <afxtempl.h>
template class ATL::CSimpleStringT<char, false>;
template class ATL::CStringT<char, StrTraitMFC<char> >;
template class CArray<int, int>;
template class CArray<void*, void*>;
template class CList<void*, void*>;
template class CMap<CString, LPCSTR, CString, LPCSTR>;
template class CMap<int, int, void*, void*>;
