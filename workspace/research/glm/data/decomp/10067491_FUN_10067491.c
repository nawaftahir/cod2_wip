// 10067491 size=29 FUN_10067491

undefined4 FUN_10067491(uint param_1)

{
  undefined4 uVar1;
  int in_ECX;
  
  if (param_1 < 5) {
    *(uint *)(in_ECX + 0x10) = param_1;
    uVar1 = 0;
  }
  else {
    uVar1 = 0x80004005;
  }
  return uVar1;
}


