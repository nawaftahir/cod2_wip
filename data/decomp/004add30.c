
uint __thiscall FUN_004add30(uint param_1,int *param_2,undefined4 *param_3)

{
  int iVar1;
  uint uVar2;
  uint uVar3;
  undefined4 *puVar4;
  
  uVar2 = param_2[1];
  uVar3 = uVar2;
  if (param_1 < uVar2) {
    uVar3 = param_1;
  }
  if (uVar3 == 0) {
    return 0;
  }
  param_2[1] = uVar2 - uVar3;
  if (*(int *)(param_2[7] + 0x18) == 0) {
    iVar1 = FUN_004acfc0(param_2[0xc],*param_2,uVar3);
    param_2[0xc] = iVar1;
  }
  puVar4 = (undefined4 *)*param_2;
  for (uVar2 = uVar3 >> 2; uVar2 != 0; uVar2 = uVar2 - 1) {
    *param_3 = *puVar4;
    puVar4 = puVar4 + 1;
    param_3 = param_3 + 1;
  }
  for (uVar2 = uVar3 & 3; uVar2 != 0; uVar2 = uVar2 - 1) {
    *(undefined1 *)param_3 = *(undefined1 *)puVar4;
    puVar4 = (undefined4 *)((int)puVar4 + 1);
    param_3 = (undefined4 *)((int)param_3 + 1);
  }
  param_2[2] = param_2[2] + uVar3;
  *param_2 = *param_2 + uVar3;
  return uVar3;
}

