// 1008158b size=82 FUN_1008158b

int FUN_1008158b(undefined4 param_1,undefined4 param_2,int param_3,undefined4 param_4,uint param_5)

{
  int iVar1;
  uint uVar2;
  int iVar3;
  
  if (param_3 < 0) {
    iVar3 = -param_3;
  }
  else {
    iVar1 = FUN_100811b0(param_3,&param_3);
    iVar3 = param_3;
    if (iVar1 < 0) {
      return iVar1;
    }
  }
  uVar2 = param_5 >> 2;
  do {
    iVar1 = FUN_1007e699(iVar3,param_2,param_4,uVar2,0);
    if (iVar1 < 0) {
      return iVar1;
    }
    iVar3 = *(int *)(iVar3 + 0x24);
  } while (iVar3 != 0);
  return 0;
}


