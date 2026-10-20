
void FUN_0045f720(int param_1)

{
  short *psVar1;
  int iVar2;
  int iVar3;
  undefined4 uVar4;
  
  for (iVar2 = *(int *)(param_1 + 4); iVar2 != param_1; iVar2 = *(int *)(iVar2 + 4)) {
    psVar1 = (short *)(*(int *)(iVar2 + 0x14) + 0x42);
    *psVar1 = *psVar1 + 1;
    if (*(int **)(iVar2 + 0x20) != (int *)0x0) {
      iVar3 = **(int **)(iVar2 + 0x20);
      if (*(void **)(iVar3 + 0x3824) != (void *)0x0) {
        _free(*(void **)(iVar3 + 0x3824));
      }
      uVar4 = FUN_004267d0(DAT_01128d94,0,0);
      *(short *)(iVar3 + 0x382c) = *(short *)(iVar3 + 0x382c) + 1;
      *(undefined4 *)(iVar3 + 0x3824) = uVar4;
    }
    if (*(int *)(iVar2 + 8) != 0) {
      iVar3 = *(int *)(*(int *)(iVar2 + 8) + 0x38);
      if (iVar3 != 0) {
        FUN_0045f720(iVar3 + 0xc);
      }
      psVar1 = (short *)(*(int *)(*(int *)(iVar2 + 8) + 8) + 0x68);
      *psVar1 = *psVar1 + 1;
    }
  }
  return;
}

