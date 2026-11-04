// 10002ed0 size=115 FUN_10002ed0

undefined1 FUN_10002ed0(char *param_1,char *param_2,int param_3,int param_4)

{
  int iVar1;
  undefined1 uVar2;
  int iVar3;
  char *_Src;
  undefined4 *unaff_EDI;
  
  iVar3 = 1;
  uVar2 = 1;
  if (1 < param_4) {
    do {
      iVar1 = __stricmp(*(char **)(param_3 + iVar3 * 8),param_1);
      if (iVar1 == 0) {
        _Src = *(char **)(param_3 + 4 + iVar3 * 8);
        if (_Src != (char *)0x0) goto LAB_10002f14;
        break;
      }
      iVar3 = iVar3 + 1;
    } while (iVar3 < param_4);
  }
  uVar2 = 0;
  _Src = param_2;
LAB_10002f14:
  *unaff_EDI = 0;
  unaff_EDI[1] = 0;
  unaff_EDI[2] = 0;
  _sscanf(_Src,"%f %f %f");
  return uVar2;
}


