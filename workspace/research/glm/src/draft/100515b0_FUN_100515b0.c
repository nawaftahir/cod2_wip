


void FUN_100515b0(int param_1)

{
  int iVar1;
  unsigned int uVar2;
  unsigned int uVar3;
  unsigned int uVar4;
  int in_stack_00000014;
  int *in_stack_00000018;
  int in_stack_0000001c;
  
  iVar1 = *(int *)(param_1 + 0x194);
  if (*(int *)(iVar1 + 0x18) == 0) {
    uVar2 = (**(void **)(*(int *)(param_1 + 4) + 0x1c))
                      (param_1,*(unsigned int *)(iVar1 + 8),*(unsigned int *)(iVar1 + 0x14),
                       *(unsigned int *)(iVar1 + 0x10),0);
    *(unsigned int *)(iVar1 + 0xc) = uVar2;
  }
  uVar4 = *(int *)(iVar1 + 0x10) - *(int *)(iVar1 + 0x18);
  uVar3 = in_stack_0000001c - *in_stack_00000018;
  if (uVar3 < uVar4) {
    uVar4 = uVar3;
  }
  uVar3 = *(int *)(param_1 + 0x68) - *(int *)(iVar1 + 0x14);
  if (uVar3 < uVar4) {
    uVar4 = uVar3;
  }
  (**(void **)(*(int *)(param_1 + 0x1b0) + 4))
            (param_1,*(int *)(iVar1 + 0xc) + *(int *)(iVar1 + 0x18) * 4,
             in_stack_00000014 + *in_stack_00000018 * 4,uVar4);
  *in_stack_00000018 = *in_stack_00000018 + uVar4;
  uVar4 = *(int *)(iVar1 + 0x18) + uVar4;
  *(unsigned int *)(iVar1 + 0x18) = uVar4;
  if (*(unsigned int *)(iVar1 + 0x10) <= uVar4) {
    *(int *)(iVar1 + 0x14) = *(int *)(iVar1 + 0x14) + *(unsigned int *)(iVar1 + 0x10);
    *(unsigned int *)(iVar1 + 0x18) = 0;
  }
  return;
}


