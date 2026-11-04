// 100afe7d size=79 FUN_100afe7d

undefined4 FUN_100afe7d(int param_1,uint *param_2)

{
  uint uVar1;
  int in_ECX;
  uint uVar2;
  
  uVar2 = (uint)*(byte *)(param_1 + 0x6d);
  uVar1 = *(uint *)(param_1 + 0x6c) & 0xff;
  if (uVar1 == 1) {
    if (*(uint *)(in_ECX + 0x28) <= uVar2) {
      return 0x80004005;
    }
  }
  else {
    if (uVar1 != 3) {
      if (uVar1 == 5) {
        *param_2 = 0xc;
        return 0;
      }
      return 0x80004005;
    }
    if (*(uint *)(in_ECX + 0x3c) <= uVar2) {
      return 0x80004005;
    }
    uVar2 = uVar2 + 2;
  }
  *param_2 = uVar2;
  return 0;
}


