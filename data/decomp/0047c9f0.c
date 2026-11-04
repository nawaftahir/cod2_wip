
undefined4 FUN_0047c9f0(char *param_1,int param_2)

{
  char *pcVar1;
  FILE *unaff_EBX;
  int iVar2;
  int unaff_EDI;
  
  iVar2 = 0;
  if (0 < unaff_EDI) {
    do {
      pcVar1 = _fgets(param_1,param_2,unaff_EBX);
      if (pcVar1 == (char *)0x0) {
        MessageBoxA((HWND)0x0,"Unexpected end-of-file parsing .map file",".map parse error",0x10);
        return 0;
      }
      iVar2 = iVar2 + 1;
    } while (iVar2 < unaff_EDI);
  }
  return 1;
}

