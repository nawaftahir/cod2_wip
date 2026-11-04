// 10100619 size=53 _LcidFromHexString

/* Library Function - Single Match
    _LcidFromHexString
   
   Library: Visual Studio 2003 Release */

int _LcidFromHexString(void)

{
  int iVar1;
  char cVar2;
  char *in_EDX;
  
  iVar1 = 0;
  while (cVar2 = *in_EDX, cVar2 != '\0') {
    in_EDX = in_EDX + 1;
    if ((cVar2 < 'a') || ('f' < cVar2)) {
      if (('@' < cVar2) && (cVar2 < 'G')) {
        cVar2 = cVar2 + -7;
      }
    }
    else {
      cVar2 = cVar2 + -0x27;
    }
    iVar1 = (iVar1 + 0xffffffd) * 0x10 + (int)cVar2;
  }
  return iVar1;
}


