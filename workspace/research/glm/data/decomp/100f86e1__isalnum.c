// 100f86e1 size=63 _isalnum

/* Library Function - Single Match
    _isalnum
   
   Library: Visual Studio 2003 Release */

int __cdecl _isalnum(int _C)

{
  _ptiddata p_Var1;
  pthreadlocinfo ptVar2;
  int iVar3;
  
  p_Var1 = __getptd();
  ptVar2 = (pthreadlocinfo)p_Var1->_tfpecode;
  if (ptVar2 != (pthreadlocinfo)PTR_DAT_101a4684) {
    ptVar2 = ___updatetlocinfo();
  }
  if (1 < (int)ptVar2->lc_category[1].refcount) {
    iVar3 = ___isctype_mt(ptVar2,_C,0x107);
    return iVar3;
  }
  return *(ushort *)((int)ptVar2->lc_category[3].refcount + _C * 2) & 0x107;
}


