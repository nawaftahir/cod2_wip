// 100126d0 size=106 FUN_100126d0

int FUN_100126d0(undefined4 param_1,undefined4 param_2)

{
  int iVar1;
  int iVar2;
  
  while( true ) {
    (*(code *)RI_Printf)(0,"Creating Direct3D device...\n");
    iVar2 = 0;
    do {
      iVar1 = (**(code **)(*DAT_101d1bf4 + 0x40))(DAT_101d1bf4,DAT_101d1bfc,1,param_1,param_2);
      if (-1 < iVar1) {
        return iVar1;
      }
      Sleep(100);
      iVar2 = iVar2 + 1;
    } while (iVar2 != 0x14);
    if (DAT_101d1bfc == 0) break;
    DAT_101d1bfc = 0;
  }
  return iVar1;
}


