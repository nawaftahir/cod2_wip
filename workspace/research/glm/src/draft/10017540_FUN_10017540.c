extern unsigned int DAT_101d7fc8;
extern unsigned int DAT_101d7fcc;
extern unsigned int DAT_101d82d0;
extern unsigned int DAT_101d92d4;
extern unsigned int DAT_101da2d4;
extern unsigned int DAT_101da3dc;
extern unsigned int DAT_101da460;
extern unsigned int DAT_101da564;
extern int FUN_10016db0();
extern int FUN_10017470();


void FUN_10017540(void)

{
  unsigned int uVar1;
  int iVar2;
  unsigned int *puVar3;
  
  FUN_10017470();
  puVar3 = &DAT_101d7fcc;
  for (iVar2 = 0xc0; iVar2 != 0; iVar2 = iVar2 + -1) {
    *puVar3 = 0;
    puVar3 = puVar3 + 1;
  }
  DAT_101d7fc8 = 0;
  FUN_10016db0();
  uVar1 = 0;
  puVar3 = &DAT_101da564;
  for (iVar2 = 0x100; iVar2 != 0; iVar2 = iVar2 + -1) {
    *puVar3 = 0;
    puVar3 = puVar3 + 1;
  }
  DAT_101da2d4 = 0;
  do {
    if (*(int *)((int)&g_101da460 + uVar1) != 0) {
 
	int g_101da460 = DAT_101da460;     *(unsigned int *)((int)&g_101da460 + uVar1) = 0;
    }
    uVar1 = uVar1 + 4;
  } while (uVar1 < 0x100);
  uVar1 = 0;
  do {
    if (*(int *)((int)&g_101da3dc + uVar1) != 0) {
     
	int g_101da3dc = DAT_101da3dc; *(unsigned int *)((int)&g_101da3dc + uVar1) = 0;
    }
    uVar1 = uVar1 + 4;
  } while (uVar1 < 0x80);
  uVar1 = 0;
  do {
    if (*(int *)((int)&g_101d92d4 + uVar1) != 0) {
      *(u
	int g_101d92d4 = DAT_101d92d4;nsigned int *)((int)&g_101d92d4 + uVar1) = 0;
    }
    uVar1 = uVar1 + 4;
  } while (uVar1 < 0x1000);
  uVar1 = 0;
  do {
    if (*(int *)((int)&g_101d82d0 + uVar1) != 0) {
      *(unsig
	int g_101d82d0 = DAT_101d82d0;ned int *)((int)&g_101d82d0 + uVar1) = 0;
    }
    uVar1 = uVar1 + 4;
  } while (uVar1 < 0x1000);
  return;
}


