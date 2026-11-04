
undefined4 FUN_00463240(void)

{
  undefined4 *puVar1;
  undefined4 *puVar2;
  int *in_EAX;
  int iVar3;
  int iVar4;
  undefined4 *puVar5;
  
  iVar4 = *in_EAX;
  puVar5 = (undefined4 *)(iVar4 + 8);
  *(undefined4 **)(iVar4 + 0xc) = puVar5;
  *puVar5 = puVar5;
  iVar3 = FUN_00468260();
  if (iVar3 != 0) {
    for (puVar1 = *(undefined4 **)(iVar4 + 0xc); puVar1 != puVar5; puVar1 = (undefined4 *)puVar1[1])
    {
      iVar4 = puVar1[0x1e];
      puVar1[0x1e] = iVar4 + 1;
      if ((iVar4 + 1 != 1) && (DAT_0124a2d2 == '\0')) {
        iVar4 = FUN_0047d980("e->refCount == 1",".\\eclass.cpp",0x7e,1,1);
        if (iVar4 == 0) {
          DebugBreak();
        }
        else if (iVar4 == 2) {
          DAT_0124a2d2 = '\x01';
        }
      }
      for (puVar2 = (undefined4 *)puVar1[3]; puVar2 != puVar1 + 2; puVar2 = (undefined4 *)puVar2[1])
      {
        puVar2[7] = puVar2[7] + 1;
        FUN_0045a220(1);
        if ((DAT_011298b0 == 1) || (DAT_011298b0 == 2)) {
          FUN_00475350();
        }
        *(short *)((int)puVar2 + 0x42) = *(short *)((int)puVar2 + 0x42) + 1;
      }
    }
    return 1;
  }
  *(undefined4 *)(iVar4 + 0xc) = 0;
  *puVar5 = 0;
  return 0;
}

