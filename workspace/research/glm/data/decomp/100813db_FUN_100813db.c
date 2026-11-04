// 100813db size=139 FUN_100813db

int FUN_100813db(undefined4 param_1,int param_2,int param_3,uint *param_4)

{
  uint *puVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  int extraout_ECX;
  uint uVar5;
  uint uVar6;
  
  puVar1 = param_4;
  iVar2 = param_3;
  if ((param_3 == 0) && (param_4 == (uint *)0x0)) {
    iVar2 = -0x7789f794;
  }
  else {
    if (param_2 < 0) {
      iVar4 = -param_2;
    }
    else {
      iVar3 = FUN_100811b0(param_2,&param_3);
      iVar4 = param_3;
      if (iVar3 < 0) {
        return iVar3;
      }
    }
    uVar5 = 0;
    uVar6 = 1;
    for (iVar3 = iVar4; iVar3 != 0; iVar3 = *(int *)(iVar3 + 0x24)) {
      uVar5 = uVar5 + 1;
    }
    if (puVar1 != (uint *)0x0) {
      if (*puVar1 != 0) {
        uVar6 = *puVar1;
      }
      if (uVar5 < uVar6) {
        uVar6 = uVar5;
      }
      *puVar1 = uVar5;
    }
    if (iVar2 != 0) {
      for (; (iVar4 != 0 && (uVar6 != 0)); uVar6 = uVar6 - 1) {
        iVar4 = FUN_1007d9d4(iVar2);
        if (iVar4 < 0) {
          return iVar4;
        }
        iVar4 = *(int *)(extraout_ECX + 0x24);
        iVar2 = iVar2 + 0x30;
      }
    }
    iVar2 = 0;
  }
  return iVar2;
}


