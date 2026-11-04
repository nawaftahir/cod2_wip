// 100c445e size=71 FUN_100c445e

undefined4 FUN_100c445e(int param_1,uint *param_2,undefined4 *param_3)

{
  uint uVar1;
  undefined4 uVar2;
  int in_ECX;
  
  *param_3 = 1;
  uVar1 = *(uint *)(param_1 + 0xc);
  *param_2 = uVar1;
  if (uVar1 < *(uint *)(in_ECX + 0x28)) {
    uVar2 = 0;
  }
  else {
    FUN_1008b0b5();
    uVar2 = 0x80004005;
  }
  return uVar2;
}


