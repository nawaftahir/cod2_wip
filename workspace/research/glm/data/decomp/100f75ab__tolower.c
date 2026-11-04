// 100f75ab size=34 _tolower

/* Library Function - Single Match
    _tolower
   
   Library: Visual Studio 2003 Release */

int __cdecl _tolower(int _C)

{
  _ptiddata p_Var1;
  pthreadlocinfo ptVar2;
  int iVar3;
  
  p_Var1 = __getptd();
  ptVar2 = (pthreadlocinfo)p_Var1->_tfpecode;
  if (ptVar2 != (pthreadlocinfo)PTR_DAT_101a4684) {
    ptVar2 = ___updatetlocinfo();
  }
  iVar3 = ___tolower_mt(ptVar2,_C);
  return iVar3;
}


