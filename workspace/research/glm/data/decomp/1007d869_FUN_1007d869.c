// 1007d869 size=113 FUN_1007d869

int FUN_1007d869(undefined4 param_1,undefined4 *param_2,int param_3,undefined4 param_4,
                undefined4 param_5)

{
  int *piVar1;
  int *piVar2;
  undefined4 *in_ECX;
  int iVar3;
  int extraout_EDX;
  undefined4 *puVar4;
  undefined4 *puVar5;
  
  *in_ECX = param_1;
  puVar4 = param_2;
  puVar5 = in_ECX;
  for (iVar3 = 5; puVar5 = puVar5 + 1, iVar3 != 0; iVar3 = iVar3 + -1) {
    *puVar5 = *puVar4;
    puVar4 = puVar4 + 1;
  }
  piVar1 = in_ECX + 0xd;
  piVar2 = in_ECX + 0xb;
  in_ECX[7] = param_4;
  in_ECX[8] = param_5;
  in_ECX[6] = param_3;
  in_ECX[9] = 0;
  *piVar2 = 0;
  *piVar1 = 0;
  FUN_1007d733(param_1,param_2,param_3,1,piVar2,piVar1);
  *(uint *)(extraout_EDX + 0x28) = (uint)*(ushort *)(param_3 + 8) * *piVar2;
  *(uint *)(extraout_EDX + 0x30) = (uint)*(ushort *)(param_3 + 8) * *piVar1;
  *(undefined4 *)(extraout_EDX + 0x38) = 0;
  *(undefined4 *)(extraout_EDX + 0x3c) = 0;
  *(undefined4 *)(extraout_EDX + 0x40) = 0;
  return extraout_EDX;
}


