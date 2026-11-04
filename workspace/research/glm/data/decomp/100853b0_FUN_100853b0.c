// 100853b0 size=31 FUN_100853b0

undefined4 FUN_100853b0(int param_1)

{
  undefined4 uVar1;
  int in_ECX;
  
  if (param_1 == 0) {
    uVar1 = 0x80004005;
  }
  else {
    *(undefined4 *)(in_ECX + 0x3c) = *(undefined4 *)(param_1 + 0x3c);
    uVar1 = 0;
  }
  return uVar1;
}


