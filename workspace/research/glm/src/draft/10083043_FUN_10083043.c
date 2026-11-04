extern int FUN_100827bb();


unsigned int *
FUN_10083043(unsigned int param_1,unsigned int param_2,unsigned int param_3,unsigned int param_4,
            unsigned int param_5,unsigned int param_6,unsigned int param_7,unsigned int param_8,
            unsigned int param_9)

{
  unsigned int *extraout_EDX;
  
  FUN_100827bb(0xb);
  extraout_EDX[4] = param_1;
  extraout_EDX[5] = param_2;
  extraout_EDX[6] = param_3;
  extraout_EDX[7] = param_4;
  extraout_EDX[8] = param_5;
  extraout_EDX[9] = param_6;
  extraout_EDX[10] = param_7;
  extraout_EDX[0xb] = param_8;
  extraout_EDX[0xc] = param_9;
  extraout_EDX[0xd] = 0;
  extraout_EDX[0xe] = 0;
  extraout_EDX[0xf] = 0;
  *extraout_EDX = &PTR_FUN_10110044;
  return extraout_EDX;
}


