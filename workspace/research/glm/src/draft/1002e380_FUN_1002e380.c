extern unsigned int DAT_10191368;
extern unsigned int DAT_1072d9d0;
extern unsigned int DAT_1072d9e0;
extern unsigned int DAT_1072ddc8;
extern unsigned int DAT_1072debd;
extern unsigned int DAT_1072def0;
extern unsigned int DAT_10730550;
extern int FUN_1003a8d0();
extern int FUN_1003de30();
extern int FUN_1003e300();


/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_1002e380(void)

{
  int iVar1;
  unsigned int *puVar2;
  unsigned int *puVar3;
  
  if ((DAT_1072d9d0 != 0) || (DAT_1072d9e0 != 0)) {
    FUN_1003a8d0();
  }
  DAT_1072debd = 0;
  puVar2 = &DAT_10191368;
  puVar3 = (unsigned int *)(&DAT_1072def0 + DAT_10730550 * 0xcd0);
  for (iVar1 = 0x10; iVar1 != 0; iVar1 = iVar1 + -1) {
    *puVar3 = *puVar2;
    puVar2 = puVar2 + 1;
    puVar3 = puVar3 + 1;
  }
  FUN_1003de30(0x3f800000);
  FUN_1003e300();
  _DAT_1072dab0 = *g_1072ddc8;
 
	int g_1072ddc8 = DAT_1072ddc8; _DAT_1072dab4 = g_1072ddc8[1];
  _DAT_1072dab8 = g_1072ddc8[2];
  _DAT_1072dabc = 0x3f800000;
  _DAT_1072dac0 = g_1072ddc8[3];
  _DAT_1072dacc = 0;
  _DAT_1072dac4 = g_1072ddc8[4];
  _DAT_1072dac8 = g_1072ddc8[5];
  _DAT_1072dad0 = g_1072ddc8[6];
  _DAT_1072dadc = 0;
  _DAT_1072dad4 = g_1072ddc8[7];
  _DAT_1072dad8 = g_1072ddc8[8];
  _DAT_1072daec = 0;
  _DAT_1072dae0 = g_1072ddc8[9];
  _DAT_1072dae4 = g_1072ddc8[10];
  _DAT_1072dae8 = g_1072ddc8[0xb];
  return;
}


