// 100ff553 size=50 __Strftime

/* Library Function - Single Match
    __Strftime
   
   Library: Visual Studio 2003 Release */

size_t __cdecl __Strftime(char *param_1,size_t _Maxsize,char *param_3,tm *param_4,void *param_5)

{
  _ptiddata p_Var1;
  pthreadlocinfo ptVar2;
  size_t sVar3;
  
  p_Var1 = __getptd();
  ptVar2 = (pthreadlocinfo)p_Var1->_tfpecode;
  if (ptVar2 != (pthreadlocinfo)PTR_DAT_101a4684) {
    ptVar2 = ___updatetlocinfo();
  }
  sVar3 = __Strftime_mt(ptVar2,param_1,_Maxsize,param_3,param_4,param_5);
  return sVar3;
}


