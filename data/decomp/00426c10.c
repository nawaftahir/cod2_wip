
float10 __fastcall FUN_00426c10(int param_1)

{
  int in_EAX;
  float *pfVar1;
  float10 fVar2;
  float local_8;
  
  local_8 = 0.0;
  if (0 < in_EAX) {
    pfVar1 = (float *)(param_1 + 0x28);
    do {
      fVar2 = (float10)FUN_004d98d4((double)((pfVar1[0xe] - *pfVar1) * (pfVar1[0xe] - *pfVar1) +
                                            (pfVar1[0xd] - pfVar1[-1]) * (pfVar1[0xd] - pfVar1[-1])
                                            + (pfVar1[0xf] - pfVar1[1]) * (pfVar1[0xf] - pfVar1[1]))
                                   );
      pfVar1 = pfVar1 + 0xe;
      in_EAX = in_EAX + -1;
      local_8 = (float)fVar2 + local_8;
    } while (in_EAX != 0);
  }
  return (float10)local_8;
}

