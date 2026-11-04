// 100864e9 size=79 FUN_100864e9

undefined4 FUN_100864e9(int param_1,int param_2,int param_3)

{
  int iVar1;
  int iVar2;
  undefined4 uVar3;
  
  iVar1 = *(int *)(*(int *)(param_3 + 0x14) + param_2 * 4);
  iVar2 = *(int *)(*(int *)(param_3 + 0x14) + param_1 * 4);
  if (*(uint *)(iVar2 + 4) < *(uint *)(iVar1 + 4)) {
LAB_1008651a:
    uVar3 = 0xffffffff;
  }
  else {
    if (*(uint *)(iVar2 + 4) == *(uint *)(iVar1 + 4)) {
      if (*(double *)(iVar2 + 0x20) < *(double *)(iVar1 + 0x20)) goto LAB_1008651a;
      if (*(double *)(iVar2 + 0x20) <= *(double *)(iVar1 + 0x20)) {
        return 0;
      }
    }
    uVar3 = 1;
  }
  return uVar3;
}


