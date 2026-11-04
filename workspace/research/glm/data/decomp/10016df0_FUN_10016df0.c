// 10016df0 size=96 FUN_10016df0

void FUN_10016df0(void)

{
  undefined4 *puVar1;
  int iVar2;
  undefined4 uVar3;
  uint uVar4;
  
  uVar4 = 0;
  do {
    puVar1 = *(undefined4 **)((int)&DAT_101da564 + uVar4);
    if (puVar1 != (undefined4 *)0x0) {
      if (*(char *)((int)puVar1 + 10) == '\0') {
        iVar2 = (**(code **)(*DAT_101d1bf8 + 0x16c))();
      }
      else {
        iVar2 = (**(code **)(*DAT_101d1bf8 + 0x1a8))(DAT_101d1bf8,puVar1[1],puVar1 + 3);
      }
      if (iVar2 < 0) {
        uVar3 = FUN_100efe3c(iVar2,iVar2);
        (*(code *)RI_Error)(0,
                            "Couldn\'t reload shader \'%s\' when recovering from a lost device: %s (0x%08x)\n"
                            ,*puVar1,uVar3);
      }
    }
    uVar4 = uVar4 + 4;
  } while (uVar4 < 0x400);
  return;
}


