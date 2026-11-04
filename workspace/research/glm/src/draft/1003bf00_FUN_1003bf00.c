extern unsigned int DAT_101ce708;
extern unsigned int DAT_101d1b9c;
extern unsigned int DAT_1072ddc8;
extern int FUN_1003b750();
extern int FUN_1003b990();


void FUN_1003bf00(int param_1)

{
  float fVar1;
  
  fVar1 = *(float *)(g_101d1b9c + 0x1b4) * *(float *)(g_1072ddc8 + 0xc) +
 
	int g_1072ddc8 = DAT_1072ddc8;  
	int g_101d1b9c = DAT_101d1b9c;       *(float *)(g_101d1b9c + 0x1b8) * *(float *)(g_1072ddc8 + 0x10) +
          *(float *)(g_101d1b9c + 0x1bc) * *(float *)(g_1072ddc8 + 0x14);
  *(float *)(param_1 + 0x1c) = fVar1;
  if (fVar1 < 0.0 != (fVar1 == 0.0)) {
    return;
  }
  if (*(int *)(DAT_101ce708 + 8) == 2) {
    FUN_1003b750();
    return;
  }
  FUN_1003b990();
  return;
}


