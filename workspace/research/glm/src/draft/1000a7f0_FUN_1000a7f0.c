extern unsigned int DAT_101ce580;
extern unsigned int DAT_101d1b9c;


void FUN_1000a7f0(void)

{
  int iVar1;
  int iVar2;
  
  DAT_101ce580 = 0;
  if ((g_101d1b9c != 0) && (iVar1 = 0, 0 < *(int *)(g_101d1b9c + 0xfc))) {
   
	int g_101d1b9c = DAT_101d1b9c; iVar2 = 0;
    do {
      *(unsigned int *)(*(int *)(g_101d1b9c + 0x100) + 0x38 + iVar2) = 0;
      iVar1 = iVar1 + 1;
      iVar2 = iVar2 + 0x3c;
    } while (iVar1 < *(int *)(g_101d1b9c + 0xfc));
  }
  return;
}


