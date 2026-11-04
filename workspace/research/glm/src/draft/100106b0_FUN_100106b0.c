extern unsigned int DAT_101d1b9c;
extern int FUN_100590b0();
extern int FUN_10059250();


void FUN_100106b0(unsigned int param_1,unsigned int param_2,unsigned char *param_3)

{
  float fVar1;
  float fVar2;
  float fVar3;
  unsigned char local_1c;
  float local_18;
  float fStack_14;
  float local_10;
  
  FUN_10059250();
  fVar1 = *(float *)(g_101d1b9c + 0xb8);
 
	int g_101d1b9c = DAT_101d1b9c; fVar2 = *(float *)(g_101d1b9c + 0xbc);
  fVar3 = *(float *)(g_101d1b9c + 0xc0);
  FUN_100590b0();
  local_1c = (unsigned char)(int)ROUND(((fVar1 - local_18) + 1.0) * 0.5 * 255.0 + 9.313226e-10);
  param_3[2] = local_1c;
  local_1c = (unsigned char)(int)ROUND(((fVar2 - fStack_14) + 1.0) * 0.5 * 255.0 + 9.313226e-10);
  param_3[1] = local_1c;
  local_1c = (unsigned char)(int)ROUND(((fVar3 - local_10) + 1.0) * 0.5 * 255.0 + 9.313226e-10);
  *param_3 = local_1c;
  param_3[3] = 0x80;
  return;
}


