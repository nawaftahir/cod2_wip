extern int FUN_10044020();


void FUN_10044520(int *param_1)

{
  int iVar1;
  unsigned int uVar2;
  unsigned int uVar3;
  unsigned int uVar4;
  unsigned int uVar5;
  unsigned int uVar6;
  unsigned int uVar7;
  char cVar8;
  unsigned int uVar9;
  unsigned int uVar10;
  
  iVar1 = param_1[0x59];
  uVar2 = *(unsigned int *)param_1[8];
  uVar3 = ((unsigned int *)param_1[8])[1];
  uVar10 = *(unsigned int *)(iVar1 + 0xc);
  uVar9 = *(unsigned int *)(iVar1 + 0x10);
  uVar4 = *(unsigned int *)(iVar1 + 0x14);
  uVar5 = *(unsigned int *)(iVar1 + 0x18);
  uVar6 = *(unsigned int *)(iVar1 + 0x1c);
  uVar7 = *(unsigned int *)(iVar1 + 0x20);
  cVar8 = FUN_10044020(0x7f);
  if (cVar8 == '\0') {
    *(unsigned int *)(*param_1 + 0x14) = 0x18;
    (**(void **)*param_1)(param_1);
  }
  else {
    uVar10 = 0;
    uVar9 = 0;
  }
  *(unsigned int *)param_1[8] = uVar2;
  *(unsigned int *)(param_1[8] + 4) = uVar3;
  *(unsigned int *)(iVar1 + 0xc) = uVar10;
  *(unsigned int *)(iVar1 + 0x10) = uVar9;
  *(unsigned int *)(iVar1 + 0x14) = uVar4;
  *(unsigned int *)(iVar1 + 0x18) = uVar5;
  *(unsigned int *)(iVar1 + 0x1c) = uVar6;
  *(unsigned int *)(iVar1 + 0x20) = uVar7;
  return;
}


