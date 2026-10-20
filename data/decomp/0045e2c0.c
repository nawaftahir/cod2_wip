
void FUN_0045e2c0(int param_1)

{
  int iVar1;
  float *pfVar2;
  int iVar3;
  
  iVar3 = 0;
  if (0 < *(int *)(param_1 + 0x38)) {
    iVar1 = 0;
    do {
      pfVar2 = (float *)(*(int *)(param_1 + 0x3c) + iVar1);
      FUN_0047a5b0("Face %i\n",iVar3);
      FUN_0047a5b0("%g %g %g\n",(double)*pfVar2,(double)pfVar2[1],(double)pfVar2[2]);
      FUN_0047a5b0("%g %g %g\n",(double)pfVar2[3],(double)pfVar2[4],(double)pfVar2[5]);
      FUN_0047a5b0("%g %g %g\n",(double)pfVar2[6],(double)pfVar2[7]);
      iVar3 = iVar3 + 2;
      iVar1 = iVar1 + 0x150;
    } while (iVar3 < *(int *)(param_1 + 0x38));
  }
  return;
}

