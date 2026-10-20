
void __thiscall FUN_0043f3c0(int param_1,int param_2,undefined4 *param_3)

{
  uint uVar1;
  uint uVar2;
  
  *param_3 = 0;
  FUN_004fc069(1);
  uVar1 = *(uint *)(param_1 + 0x244);
  uVar2 = (int)uVar1 >> 0x1f;
  if (*(int *)(param_2 + 0x10) < 0) {
    FUN_004733f0((uVar1 ^ uVar2) - uVar2);
    FUN_0043f460();
    return;
  }
  FUN_004733f0(-((uVar1 ^ uVar2) - uVar2));
  FUN_0043f460();
  return;
}

