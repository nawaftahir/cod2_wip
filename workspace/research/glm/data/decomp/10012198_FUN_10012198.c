// 10012198 size=109 FUN_10012198

undefined4 FUN_10012198(void)

{
  int iVar1;
  undefined4 uVar2;
  undefined1 *puVar3;
  int iVar4;
  undefined1 *puVar5;
  
  puVar3 = &DAT_107645bc;
  do {
    iVar4 = 0;
    puVar5 = puVar3 + -8;
    do {
      iVar1 = (**(code **)(*DAT_101d1bf8 + 0x1d8))(DAT_101d1bf8,9,puVar5);
      if (iVar1 < 0) {
        uVar2 = FUN_100efe3c(iVar1,iVar1);
        (*(code *)RI_Printf)(0,"Occlusion query creation failed: %s (0x%08x)\n",uVar2);
      }
      puVar3[iVar4] = 0;
      iVar4 = iVar4 + 1;
      puVar5 = puVar5 + 4;
    } while (iVar4 < 2);
    puVar3 = puVar3 + 0x30;
  } while ((int)puVar3 < 0x1076467c);
  (*(code *)RI_Printf)(0,"Setting initial state...\n");
  FUN_1003c2a0();
  return 1;
}


