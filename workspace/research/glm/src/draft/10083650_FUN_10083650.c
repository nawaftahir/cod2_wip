extern int FUN_100827bb();


unsigned int * FUN_10083650(unsigned int param_1,unsigned int param_2)

{
  unsigned int *extraout_EDX;
  
  FUN_100827bb(0x11);
  extraout_EDX[4] = param_1;
  extraout_EDX[5] = param_2;
  *extraout_EDX = &PTR_FUN_1011008c;
  return extraout_EDX;
}


