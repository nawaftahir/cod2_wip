extern int FUN_100827bb();


unsigned int *
FUN_10082aec(unsigned int param_1,unsigned int param_2,unsigned int param_3,unsigned int param_4)

{
  unsigned int *extraout_EDX;
  
  FUN_100827bb(4);
  extraout_EDX[4] = param_1;
  extraout_EDX[5] = param_2;
  extraout_EDX[6] = param_3;
  extraout_EDX[7] = param_4;
  *extraout_EDX = &PTR_FUN_1010fff0;
  return extraout_EDX;
}


