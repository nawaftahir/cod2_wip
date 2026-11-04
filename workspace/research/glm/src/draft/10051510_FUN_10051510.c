


void FUN_10051510(int param_1,unsigned int param_2,unsigned int param_3,unsigned int param_4,
                 unsigned int param_5,int *param_6)

{
  unsigned int *puVar1;
  int iVar2;
  unsigned int uVar3;
  unsigned int uVar4;
  int iVar5;
  
  iVar2 = *(int *)(param_1 + 0x194);
  puVar1 = (unsigned int *)(iVar2 + 0x18);
  if (*(int *)(iVar2 + 0x18) == 0) {
    uVar4 = (**(void **)(*(int *)(param_1 + 4) + 0x1c))
                      (param_1,*(unsigned int *)(iVar2 + 8),*(unsigned int *)(iVar2 + 0x14),
                       *(unsigned int *)(iVar2 + 0x10),1);
    *(unsigned int *)(iVar2 + 0xc) = uVar4;
  }
  uVar3 = *puVar1;
  (**(void **)(*(int *)(param_1 + 0x1a8) + 4))
            (param_1,param_2,param_3,param_4,*(unsigned int *)(iVar2 + 0xc),puVar1,
             *(unsigned int *)(iVar2 + 0x10));
  if (uVar3 < *puVar1) {
    iVar5 = *puVar1 - uVar3;
    (**(void **)(*(int *)(param_1 + 0x1b0) + 4))(param_1,*(int *)(iVar2 + 0xc) + uVar3 * 4,0,iVar5);
    *param_6 = *param_6 + iVar5;
  }
  if (*(unsigned int *)(iVar2 + 0x10) <= *puVar1) {
    *(int *)(iVar2 + 0x14) = *(int *)(iVar2 + 0x14) + *(unsigned int *)(iVar2 + 0x10);
    *puVar1 = 0;
  }
  return;
}


