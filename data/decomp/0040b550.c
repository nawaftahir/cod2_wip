
void __thiscall FUN_0040b550(int *param_1,float *param_2)

{
  int iVar1;
  undefined4 *puVar2;
  float *pfVar3;
  int iVar4;
  
  iVar1 = param_1[1];
  iVar4 = 0;
  if (0 < iVar1) {
    do {
      puVar2 = (undefined4 *)FUN_00407730();
      pfVar3 = (float *)(**(code **)(*param_1 + 0x14))(*puVar2);
      iVar4 = iVar4 + 1;
      *pfVar3 = *pfVar3 + *param_2;
      pfVar3[1] = param_2[1] + pfVar3[1];
      pfVar3[2] = pfVar3[2] + param_2[2];
    } while (iVar4 < iVar1);
  }
  return;
}

