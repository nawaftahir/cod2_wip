// 10044520 size=195 FUN_10044520

void FUN_10044520(int *param_1)

{
  int iVar1;
  undefined4 uVar2;
  undefined4 uVar3;
  undefined4 uVar4;
  undefined4 uVar5;
  undefined4 uVar6;
  undefined4 uVar7;
  char cVar8;
  undefined4 uVar9;
  undefined4 uVar10;
  
  iVar1 = param_1[0x59];
  uVar2 = *(undefined4 *)param_1[8];
  uVar3 = ((undefined4 *)param_1[8])[1];
  uVar10 = *(undefined4 *)(iVar1 + 0xc);
  uVar9 = *(undefined4 *)(iVar1 + 0x10);
  uVar4 = *(undefined4 *)(iVar1 + 0x14);
  uVar5 = *(undefined4 *)(iVar1 + 0x18);
  uVar6 = *(undefined4 *)(iVar1 + 0x1c);
  uVar7 = *(undefined4 *)(iVar1 + 0x20);
  cVar8 = FUN_10044020(0x7f);
  if (cVar8 == '\0') {
    *(undefined4 *)(*param_1 + 0x14) = 0x18;
    (**(code **)*param_1)(param_1);
  }
  else {
    uVar10 = 0;
    uVar9 = 0;
  }
  *(undefined4 *)param_1[8] = uVar2;
  *(undefined4 *)(param_1[8] + 4) = uVar3;
  *(undefined4 *)(iVar1 + 0xc) = uVar10;
  *(undefined4 *)(iVar1 + 0x10) = uVar9;
  *(undefined4 *)(iVar1 + 0x14) = uVar4;
  *(undefined4 *)(iVar1 + 0x18) = uVar5;
  *(undefined4 *)(iVar1 + 0x1c) = uVar6;
  *(undefined4 *)(iVar1 + 0x20) = uVar7;
  return;
}


