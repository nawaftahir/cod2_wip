// 1008b352 size=44 FUN_1008b352

uint FUN_1008b352(uint param_1,uint param_2,undefined4 param_3)

{
  uint uVar1;
  
  uVar1 = FUN_1008b1b3(param_2,param_3);
  if (uVar1 == 0) {
    if (param_1 < param_2) {
      uVar1 = 0xffffffff;
    }
    else {
      uVar1 = (uint)(param_2 < param_1);
    }
  }
  return uVar1;
}


