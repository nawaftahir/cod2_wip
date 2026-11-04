// 1002bd20 size=113 FUN_1002bd20

uint FUN_1002bd20(void)

{
  int iVar1;
  int *in_ECX;
  int *piVar2;
  int *piStack_28;
  undefined *puStack_24;
  int aiStack_20 [8];
  
  aiStack_20[0] = 0;
  puStack_24 = &DAT_101977cc;
  piStack_28 = aiStack_20 + 1;
  iVar1 = DirectDrawCreateEx();
  if (iVar1 < 0) {
    return 0;
  }
  aiStack_20[1] = 0;
  aiStack_20[2] = 0;
  aiStack_20[3] = 0;
  piVar2 = aiStack_20;
  aiStack_20[0] = 0x4000;
  iVar1 = (**(code **)(*in_ECX + 0x5c))(in_ECX,piVar2,&piStack_28,&puStack_24);
  (**(code **)(*piVar2 + 8))(piVar2);
  return (iVar1 < 0) - 1 & (uint)piVar2;
}


