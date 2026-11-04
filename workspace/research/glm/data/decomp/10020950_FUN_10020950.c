// 10020950 size=201 FUN_10020950

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_10020950(void)

{
  float fVar1;
  int iVar2;
  int iVar3;
  undefined1 *puVar4;
  float10 fVar5;
  int local_14;
  
  local_14 = 0;
  puVar4 = DAT_101da9bc;
  do {
    iVar2 = local_14;
    fVar1 = (float)local_14;
    local_14 = 0;
    fVar1 = ((fVar1 + 0.5) - _DAT_101da9b4) * DAT_101da9a8;
    do {
      fVar5 = (float10)FUN_10020590((((float)local_14 + 0.5) - DAT_101da9b0) * DAT_101da9a4,fVar1);
      iVar3 = (int)ROUND((float)((float10)_DAT_101da9a0 * fVar5 + (float10)_DAT_101da9b8) - 0.5);
      if (iVar3 < 0) {
        iVar3 = 0;
      }
      else if (0xff < iVar3) {
        iVar3 = 0xff;
      }
      *puVar4 = (char)iVar3;
      puVar4 = puVar4 + 1;
      local_14 = local_14 + 1;
    } while (local_14 != 0x200);
    local_14 = iVar2 + 1;
  } while (local_14 != 0x200);
  return;
}


