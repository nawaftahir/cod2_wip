
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00440ca0(void)

{
  int iVar1;
  undefined4 uVar2;
  int iVar3;
  int iVar4;
  undefined1 local_40 [21];
  char local_2b;
  int local_28;
  short local_24;
  short local_22;
  int local_14;
  int local_10;
  int local_c;
  int local_8;
  
  iVar1 = FUN_00480440(DAT_01233508,&DAT_0053d753,0,&local_c,10);
  iVar4 = 0;
  local_8 = iVar1;
  if (0 < local_c) {
    do {
      uVar2 = FUN_004969e0("materials/%s",*(undefined4 *)(iVar1 + iVar4 * 4));
      _DAT_01143494 = 1;
      FUN_0047ed20(uVar2,&local_10,0,0);
      iVar3 = local_10;
      if (local_10 != 0) {
        local_14 = FUN_0047f570(local_40,0x2c,local_10);
        FUN_0047e300(iVar3);
        if ((((local_14 == 0x2c) && (local_2b != '\0')) && (local_28 != 0)) &&
           ((local_24 != 0 && (local_22 != 0)))) {
          uVar2 = *(undefined4 *)(iVar1 + iVar4 * 4);
          iVar3 = FUN_00440c70();
          iVar1 = local_8;
          if (iVar3 == 0) {
            FUN_004406c0(uVar2,0);
            iVar1 = local_8;
          }
        }
      }
      iVar4 = iVar4 + 1;
    } while (iVar4 < local_c);
  }
  FUN_00480d00(iVar1,10);
  return;
}

