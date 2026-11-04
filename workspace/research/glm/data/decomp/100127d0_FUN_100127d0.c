// 100127d0 size=66 FUN_100127d0

uint FUN_100127d0(void)

{
  int iVar1;
  uint uVar2;
  int iVar3;
  uint uVar4;
  uint uVar5;
  
  iVar1 = FUN_10012770();
  uVar4 = 0;
  uVar2 = (**(code **)(*DAT_101d1bf4 + 0x10))(DAT_101d1bf4);
  uVar5 = 0;
  if (uVar2 != 0) {
    do {
      if (iVar1 != 0) {
        iVar3 = (**(code **)(*DAT_101d1bf4 + 0x3c))(DAT_101d1bf4,uVar5);
        if (iVar3 == iVar1) {
          uVar4 = uVar5;
        }
      }
      uVar5 = uVar5 + 1;
    } while (uVar5 < uVar2);
  }
  return uVar4;
}


