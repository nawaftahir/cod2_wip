extern unsigned int DAT_10191348;


/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

float FUN_10020590(unsigned int param_1,unsigned int param_2)

{
  float fVar1;
  float fVar2;
  unsigned int local_3c;
  unsigned int local_38;
  float local_34;
  unsigned int local_30;
  unsigned int local_2c;
  float local_28;
  float local_24 [9];
  
  fVar1 = _DAT_101da994 + 1.0;
  local_2c = param_2;
  local_30 = param_1;
  fVar2 = _DAT_101da988 - 1.0;
  local_24[1] = 0.0;
  local_24[2] = 0.0;
  local_24[3] = 0.0;
  local_24[4] = 0.0;
  local_24[5] = 0.0;
  local_24[6] = 0.0;
  local_24[7] = 0.0;
  local_3c = param_1;
  local_38 = param_2;
  local_24[8] = 0.0;
  local_24[0] = 1.0;
  local_34 = fVar2;
  local_28 = fVar1;
  (*(void *)RI_CM_SaveLump)(local_24,&local_30,&local_3c,&g_10191348,&g_10191348,0,0x2001);
  r
	int g_10191348 = DAT_10191348;eturn ((float)fVar2 - (float)fVar1) * (float)local_24[0] + (float)fVar1;
}


