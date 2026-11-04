// 100865c6 size=26 FUN_100865c6

uint FUN_100865c6(uint param_1,uint param_2)

{
  uint uVar1;
  
  if (param_1 < param_2) {
    uVar1 = 0xffffffff;
  }
  else {
    uVar1 = (uint)(param_2 < param_1);
  }
  return uVar1;
}


