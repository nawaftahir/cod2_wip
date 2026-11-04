// 100868f2 size=46 FUN_100868f2

uint FUN_100868f2(int param_1,int param_2,int param_3)

{
  uint uVar1;
  uint uVar2;
  
  uVar2 = *(uint *)(*(int *)(*(int *)(param_3 + 0x14) + param_1 * 4) + 0x40);
  uVar1 = *(uint *)(*(int *)(*(int *)(param_3 + 0x14) + param_2 * 4) + 0x40);
  if (uVar2 < uVar1) {
    uVar2 = 0xffffffff;
  }
  else {
    uVar2 = (uint)(uVar1 < uVar2);
  }
  return uVar2;
}


