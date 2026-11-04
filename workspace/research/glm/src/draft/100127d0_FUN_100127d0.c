extern unsigned int DAT_101d1bf4;
extern int FUN_10012770();


unsigned int FUN_100127d0(void)

{
  int iVar1;
  unsigned int uVar2;
  int iVar3;
  unsigned int uVar4;
  unsigned int uVar5;
  
  iVar1 = FUN_10012770();
  uVar4 = 0;
  uVar2 = (**(void **)(*g_101d1bf4 + 0x10))(g_101d1bf4);
  u
	int g_101d1bf4 = DAT_101d1bf4;Var5 = 0;
  if (uVar2 != 0) {
    do {
      if (iVar1 != 0) {
        iVar3 = (**(void **)(*g_101d1bf4 + 0x3c))(g_101d1bf4,uVar5);
        if (iVar3 == iVar1) {
          uVar4 = uVar5;
        }
      }
      uVar5 = uVar5 + 1;
    } while (uVar5 < uVar2);
  }
  return uVar4;
}


