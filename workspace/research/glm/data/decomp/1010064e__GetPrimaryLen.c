// 1010064e size=29 _GetPrimaryLen

/* Library Function - Single Match
    _GetPrimaryLen
   
   Library: Visual Studio 2003 Release */

int _GetPrimaryLen(void)

{
  char cVar1;
  int iVar2;
  char *in_EDX;
  
  iVar2 = 0;
  while( true ) {
    cVar1 = *in_EDX;
    in_EDX = in_EDX + 1;
    if (((cVar1 < 'A') || ('Z' < cVar1)) && ((cVar1 < 'a' || ('z' < cVar1)))) break;
    iVar2 = iVar2 + 1;
  }
  return iVar2;
}


