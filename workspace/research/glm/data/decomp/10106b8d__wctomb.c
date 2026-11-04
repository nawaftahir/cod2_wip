// 10106b8d size=39 _wctomb

/* Library Function - Single Match
    _wctomb
   
   Library: Visual Studio 2003 Release */

int __cdecl _wctomb(char *_MbCh,wchar_t _WCh)

{
  _ptiddata p_Var1;
  pthreadlocinfo ptVar2;
  int iVar3;
  undefined2 in_stack_0000000a;
  
  p_Var1 = __getptd();
  ptVar2 = (pthreadlocinfo)p_Var1->_tfpecode;
  if (ptVar2 != (pthreadlocinfo)PTR_DAT_101a4684) {
    ptVar2 = ___updatetlocinfo();
  }
  iVar3 = ___wctomb_mt(ptVar2,_MbCh,__WCh);
  return iVar3;
}


