// 100426d0 size=207 FUN_100426d0

void FUN_100426d0(int param_1)

{
  int iVar1;
  int *piVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  int iStack_8;
  int iStack_4;
  
  iVar3 = *(int *)(param_1 + 0x158);
  iVar1 = (*(code *)**(undefined4 **)(param_1 + 4))(param_1,1,0x2000);
  iVar4 = 0;
  *(int *)(iVar3 + 8) = iVar1;
  iVar5 = 0;
  iVar7 = 0;
  iVar6 = 0;
  iStack_4 = 0;
  iStack_8 = 0;
  param_1 = 0x807fff;
  iVar3 = 0x8000;
  piVar2 = (int *)(iVar1 + 0x800);
  do {
    piVar2[0x300] = param_1;
    piVar2[0x400] = iStack_8;
    piVar2[0x500] = iStack_4;
    param_1 = param_1 + 0x8000;
    iStack_8 = iStack_8 + -0x6b2f;
    *piVar2 = iVar3;
    piVar2[-0x200] = iVar4;
    piVar2[-0x100] = iVar6;
    piVar2[0x100] = iVar7;
    piVar2[0x200] = iVar5;
    iVar3 = iVar3 + 0x1d2f;
    iStack_4 = iStack_4 + -0x14d1;
    iVar4 = iVar4 + 0x4c8b;
    piVar2 = piVar2 + 1;
    iVar6 = iVar6 + 0x9646;
    iVar7 = iVar7 + -0x2b33;
    iVar5 = iVar5 + -0x54cd;
  } while (iVar3 < 0x1d91d2);
  return;
}


