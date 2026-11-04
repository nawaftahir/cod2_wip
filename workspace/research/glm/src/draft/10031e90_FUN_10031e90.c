extern int FUN_10031d20();


void FUN_10031e90(int *param_1)

{
  int iVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  
  iVar3 = *param_1;
  iVar4 = (int)*(short *)(iVar3 + 0xe);
  iVar5 = (iVar4 + 1) * 0x10;
  iVar1 = iVar5 + iVar4 * 0xc;
  iVar2 = iVar1 + iVar4 * 4;
  FUN_10031d20(iVar2 + iVar4 * 8 + iVar3,*(short *)(iVar3 + 0xe),iVar3 + 0x10,iVar5 + iVar3,
               iVar1 + iVar3,iVar2 + iVar3);
  *param_1 = (unsigned int)*(unsigned short *)(*param_1 + 2) + *param_1;
  return;
}


