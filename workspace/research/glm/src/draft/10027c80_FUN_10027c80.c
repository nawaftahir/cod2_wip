extern unsigned int DAT_10191368;
extern unsigned int DAT_10191488;
extern unsigned int DAT_101d1b50;
extern unsigned int DAT_101d4c6c;
extern int FUN_10021ae0();


void FUN_10027c80(void)

{
  float fVar1;
  int iVar2;
  unsigned int *puVar3;
  unsigned int *puVar4;
  unsigned int local_40 [16];
  
  fVar1 = (float)DAT_101d4c6c;
  puVar3 = &DAT_10191368;
  puVar4 = local_40;
  for (iVar2 = 0x10; iVar2 != 0; iVar2 = iVar2 + -1) {
    *puVar4 = *puVar3;
    puVar3 = puVar3 + 1;
    puVar4 = puVar4 + 1;
  }
  FUN_10021ae0(local_40,0x3f800000);
  R_SetMaterialColor(0x40800000,0x40800000,fVar1 * 0.25,fVar1 * 0.25,0,0,0x3f800000,0x3f800000,
                     &DAT_10191488,DAT_101d1b50);
  return;
}


