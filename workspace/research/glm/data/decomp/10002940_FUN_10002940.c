// 10002940 size=118 FUN_10002940

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_10002940(void)

{
  int iVar1;
  undefined4 *unaff_EBX;
  int iVar2;
  int iVar3;
  int iVar4;
  
  iVar2 = 0;
  if (*(short *)(unaff_EBX + 0xd) != 0) {
    iVar4 = 0;
    while( true ) {
      iVar3 = unaff_EBX[0xf] + iVar4;
      iVar1 = __stricmp(*(char **)(unaff_EBX[0xf] + iVar4),"colorMap");
      if (iVar1 == 0) break;
      iVar2 = iVar2 + 1;
      iVar4 = iVar4 + 0xc;
      if ((int)(uint)*(ushort *)(unaff_EBX + 0xd) <= iVar2) {
        return;
      }
    }
    if ((*(char *)(iVar3 + 5) == '\x05') || (**(int **)(iVar3 + 8) != 5)) {
      FUN_100138c0(1,"colorMap \'%s\' for sky material \'%s\' is not a cubemap\n",
                   *(undefined4 *)(*(int *)(iVar3 + 8) + 0x20),*unaff_EBX);
    }
    _DAT_101ae2a8 = *(undefined4 *)(iVar3 + 8);
    DAT_101ae2ac = *(undefined1 *)(iVar3 + 4);
  }
  return;
}


