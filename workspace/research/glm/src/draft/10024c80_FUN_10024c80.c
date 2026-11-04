extern unsigned int DAT_101ce694;
extern unsigned int DAT_101ce708;
extern unsigned int DAT_101d4818;
extern unsigned int DAT_101d489c;
extern unsigned int DAT_1042e778;
extern unsigned int DAT_10678500;
extern int FUN_10021770();
extern int FUN_10021890();
extern int FUN_10021920();
extern int FUN_10021b50();
extern int FUN_10024920();


void FUN_10024c80(void)

{
  int *piVar1;
  int iVar2;
  int iVar3;
  unsigned int uVar4;
  unsigned short *puVar5;
  unsigned int uVar6;
  
  FUN_10021b50(DAT_10678500);
  iVar3 = g_1042e778;
 
	int g_1042e778 = DAT_1042e778; iVar2 = *(int *)(g_1042e778 + 0x30000);
  if (0x30000 - iVar2 < 8) {
    puVar5 = (unsigned short *)0x0;
    *(unsigned int *)(g_1042e778 + 0x30008) = 0;
  }
  else {
    puVar5 = (unsigned short *)(iVar2 + g_1042e778);
    *(int *)(g_1042e778 + 0x30000) = iVar2 + 8;
    piVar1 = (int *)(iVar3 + 0x30004);
    *piVar1 = *piVar1 + 8;
    *(unsigned short **)(iVar3 + 0x30008) = puVar5;
    *puVar5 = 0xe;
    puVar5[1] = 8;
  }
  *(unsigned int *)(puVar5 + 2) = 0;
  if ((((DAT_101d4818 == 0) || (*(int *)(DAT_101ce708 + 8) == 2)) ||
      (*(char *)(DAT_101ce694 + 8) == '\0')) || (uVar6 = 1, DAT_101d489c == 0)) {
    uVar6 = 7;
  }
  uVar4 = FUN_10024920();
  R_BlendSavedScreen(uVar6,uVar4,0x3f800000,0);
  FUN_10021770(0);
  FUN_10021890();
  FUN_10021890();
  FUN_10021920();
  FUN_10021890();
  return;
}


