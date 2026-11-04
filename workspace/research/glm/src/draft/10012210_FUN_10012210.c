extern unsigned int DAT_101d4938;
extern unsigned int DAT_101d4940;
extern unsigned int DAT_101d494c;
extern unsigned int DAT_101d49a8;
extern unsigned int DAT_101d49ac;
extern unsigned int DAT_101d49b4;
extern unsigned int DAT_107645b4;
extern unsigned int DAT_1076a830;
extern int FUN_10011e60();
extern int FUN_10023560();
extern int FUN_1002baf0();


void FUN_10012210(void)

{
  unsigned int uVar1;
  int *piVar2;
  int *piVar3;
  unsigned int *puVar4;
  unsigned int *puVar5;
  int iVar6;
  int iVar7;
  unsigned char bVar8;
  
  iVar6 = 0;
  if (0 < g_101d4938) {
 
	int g_101d4938 = DAT_101d4938;   puVar4 = &DAT_101d4940;
    do {
      do {
        (**(void **)(*(int *)*puVar4 + 8))((int *)*puVar4);
        bVar8 = g_1076a830 != (int *)0x0;
 
	int g_1076a830 = DAT_1076a830;       *puVar4 = 0;
      } while (bVar8);
      iVar6 = iVar6 + 1;
      puVar4 = puVar4 + 4;
    } while (iVar6 < g_101d4938);
  }
  FUN_10023560();
  FUN_1002baf0();
  piVar2 = g_101d49b4;
  w
	int g_101d49b4 = DAT_101d49b4;hile (piVar2 != (int *)0x0) {
    (**(void **)(*g_101d49b4 + 8))(g_101d49b4);
    g_101d49b4 = (int *)0x0;
    piVar2 = g_1076a830;
  }
  FUN_10011e60();
  piVar2 = g_101d49a8;
  if (g_101d4
	int g_101d49a8 = DAT_101d49a8;9a8 != (int *)0x0) {
    do {
      (**(void **)(*piVar2 + 8))(piVar2);
      piVar2 = (int *)0x0;
    } while (g_1076a830 != (int *)0x0);
    g_101d49a8 = (int *)0x0;
  }
  piVar3 = g_101d49ac;
  uVar1 = 0;
  
	int g_101d49ac = DAT_101d49ac;piVar2 = g_101d494c;
  if (g_101d49ac != (in
	int g_101d494c = DAT_101d494c;t *)0x0) {
    do {
      (**(void **)(*piVar3 + 8))(piVar3);
      piVar3 = (int *)0x0;
    } while (g_1076a830 != (int *)0x0);
    g_101d49ac = (int *)0x0;
    g_1076a830 = (int *)0x0;
    uVar1 = g_101d49ac;
    piVar2 = g_101d494c;
  }
  while (g_101d49ac = (int *)uVar1, piVar2 != (int *)0x0) {
    (**(void **)(*g_101d494c + 8))(g_101d494c);
    g_101d494c = (int *)0x0;
    uVar1 = g_101d49ac;
    piVar2 = g_1076a830;
  }
  puVar4 = &DAT_107645b4;
  iVar6 = 4;
  do {
    iVar7 = 2;
    puVar5 = puVar4;
    do {
      piVar2 = (int *)*puVar5;
      while (piVar2 != (int *)0x0) {
        (**(void **)(*(int *)*puVar5 + 8))((int *)*puVar5);
        piVar2 = g_1076a830;
        *puVar5 = 0;
      }
      puVar5 = puVar5 + 1;
      iVar7 = iVar7 + -1;
    } while (iVar7 != 0);
    puVar4 = puVar4 + 0xc;
    iVar6 = iVar6 + -1;
  } while (iVar6 != 0);
  return;
}


