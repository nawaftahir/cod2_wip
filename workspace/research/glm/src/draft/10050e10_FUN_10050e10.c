extern int FUN_1004c8b0();
extern int FUN_100508f0();


unsigned int FUN_10050e10(int param_1,int param_2)

{
  unsigned int uVar1;
  int iVar2;
  unsigned short *puVar3;
  unsigned int uVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  int iVar8;
  unsigned int local_14;
  unsigned int local_10;
  int local_c;
  int local_8;
  int local_4;
  
  iVar6 = param_1;
  uVar1 = *(unsigned int *)(param_1 + 0x180);
  iVar2 = *(int *)(param_1 + 0x1a0);
  if (((*(int *)(param_1 + 0x104) != 0) && (*(int *)(iVar2 + 0x28) == 0)) &&
     (uVar4 = FUN_100508f0(), (char)uVar4 == '\0')) {
    return uVar4;
  }
  local_10 = (*(unsigned int **)(param_1 + 0x20))[1];
  local_14 = **(unsigned int **)(param_1 + 0x20);
  iVar5 = *(int *)(iVar2 + 0xc);
  iVar8 = 0;
  iVar7 = *(int *)(iVar2 + 0x10);
  local_4 = param_1;
  if (0 < *(int *)(param_1 + 0x148)) {
    do {
      puVar3 = *(unsigned short **)(param_2 + iVar8 * 4);
      if ((iVar7 < 1) &&
         (uVar4 = FUN_1004c8b0(&local_14,iVar5,iVar7,1), iVar5 = local_c, iVar7 = local_8,
         (char)uVar4 == '\0')) {
        return uVar4 & 0xffffff00;
      }
      iVar7 = iVar7 + -1;
      if ((iVar5 >> ((byte)iVar7 & 0x1f) & 1U) != 0) {
        param_1._0_2_ = (unsigned short)(1 << ((byte)uVar1 & 0x1f));
        *puVar3 = *puVar3 | (unsigned short)param_1;
      }
      iVar8 = iVar8 + 1;
    } while (iVar8 < *(int *)(iVar6 + 0x148));
  }
  **(unsigned int **)(iVar6 + 0x20) = local_14;
  *(unsigned int *)(*(int *)(iVar6 + 0x20) + 4) = local_10;
  *(int *)(iVar2 + 0xc) = iVar5;
  iVar6 = *(int *)(iVar2 + 0x28) + -1;
  *(int *)(iVar2 + 0x28) = iVar6;
  *(int *)(iVar2 + 0x10) = iVar7;
  return CONCAT31((int3)((unsigned int)iVar6 >> 8),1);
}


