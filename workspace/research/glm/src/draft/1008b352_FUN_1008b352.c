extern int FUN_1008b1b3();


unsigned int FUN_1008b352(unsigned int param_1,unsigned int param_2,unsigned int param_3)

{
  unsigned int uVar1;
  
  uVar1 = FUN_1008b1b3(param_2,param_3);
  if (uVar1 == 0) {
    if (param_1 < param_2) {
      uVar1 = 0xffffffff;
    }
    else {
      uVar1 = (unsigned int)(param_2 < param_1);
    }
  }
  return uVar1;
}


