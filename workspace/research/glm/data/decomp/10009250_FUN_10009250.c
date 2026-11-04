// 10009250 size=88 FUN_10009250

void FUN_10009250(undefined4 param_1)

{
  int iVar1;
  int iVar2;
  int iVar3;
  
  iVar1 = DAT_1067850c;
  iVar2 = 0;
  if (0 < DAT_1067850c) {
    iVar3 = 0;
    do {
      if (*(int *)(iVar3 + DAT_10678510) < 2) {
        FUN_100087a0(iVar2,param_1);
      }
      else if (*(int *)(iVar3 + DAT_10678510) == 3) {
        FUN_100091d0(iVar2,param_1);
      }
      iVar2 = iVar2 + 1;
      iVar3 = iVar3 + 0x74;
    } while (iVar2 < iVar1);
  }
  return;
}


