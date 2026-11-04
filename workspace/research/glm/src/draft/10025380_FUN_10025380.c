extern unsigned int DAT_10191488;
extern unsigned int DAT_101ce6e4;
extern unsigned int DAT_101ce6fc;
extern unsigned int DAT_101ce708;
extern unsigned int DAT_101ce730;
extern unsigned int DAT_101ce7c4;
extern unsigned int DAT_101d1b9c;
extern unsigned int DAT_10678ab8;
extern unsigned int DAT_10678abc;
extern int FUN_10007d60();
extern int FUN_1000a8d0();
extern int FUN_10014fc0();
extern int FUN_1001e540();
extern int FUN_10021890();
extern int FUN_100244b0();
extern int FUN_10025300();
extern int FUN_10027c80();
extern int FUN_10027d00();
extern int FUN_10027f40();
extern int FUN_10028170();


/* WARNING: Function: __chkstk replaced with injection: alloca_probe */

void FUN_10025380(unsigned int param_1,unsigned int param_2,unsigned int param_3)

{
  unsigned int uVar1;
  unsigned int uVar2;
  unsigned int uVar3;
  unsigned char bVar4;
  unsigned char auStack_16f0 [192];
  unsigned char auStack_1630 [2600];
  unsigned char auStack_c08 [3068];
  unsigned int uStack_c;
  
  uStack_c = 0x10025390;
  uVar2 = FUN_10007d60();
  if ((g_101d1b9c != 0) && (*(int *)(g_101d1b9c + 0x100) != 0)) {
   
	int g_101d1b9c = DAT_101d1b9c; FUN_1000a8d0(uVar2);
  }
  (*(void *)RI_DObjNumBones)();
  (*(void *)RI_RI_unk167)();
  uVar1 = DAT_10678abc;
  uVar2 = DAT_10678ab8;
  FUN_100244b0();
  if (*(int *)(g_101ce708 + 8) == 2) {
    b
	int g_101ce708 = DAT_101ce708;Var4 = false;
  }
  else {
    bVar4 = *(char *)(DAT_101ce7c4 + 8) != '\0';
    if (bVar4) {
      FUN_10027d00(param_2,auStack_16f0);
      FUN_10028170(auStack_16f0,auStack_1630,0x18,&LAB_10027170);
      FUN_10027f40(param_2,auStack_16f0);
    }
  }
  uVar3 = 0;
  if ((*(int *)(g_101ce708 + 8) != 2) && (*(int *)(DAT_101ce6fc + 8) != 0)) {
    uVar3 = FUN_10014fc0(uVar1,uVar2,auStack_c08);
  }
  FUN_10025300(param_3,uVar1,bVar4,auStack_1630,auStack_c08,uVar3);
  if (*(unsigned int *)(g_101ce6e4 + 8) != 0) {
    if ((
	int g_101ce6e4 = DAT_101ce6e4;*(unsigned int *)(g_101ce6e4 + 8) & 2) != 0) {
      R_BlendSavedScreen(6,&DAT_10191488,0x3f800000,0);
    }
    FUN_10021890(uVar1,uVar2,0x1d,0);
  }
  FUN_1001e540();
  if ((bVar4 == true) && (*(char *)(DAT_101ce730 + 8) != '\0')) {
    FUN_10027c80();
  }
  return;
}


