
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_0047af50(undefined4 param_1,undefined4 param_2)

{
  uint uVar1;
  uint unaff_ESI;
  undefined1 local_28 [8];
  undefined4 local_20;
  undefined4 local_1c;
  undefined4 local_18;
  undefined4 local_14;
  undefined4 local_10;
  tagPOINT local_c;
  
  GetCursorPos(&local_c);
  DAT_01139e44 = local_c.x;
  DAT_01139e40 = local_c.y;
  local_10 = 0;
  local_c.x = 0;
  local_c.y = (LONG)(_DAT_00556a58 / DAT_01139e60);
  FUN_0047aed0();
  local_1c = 0;
  local_18 = 0;
  local_14 = 0;
  uVar1 = ((*(int *)(DAT_01233b64 + 0x2b0) != 2) - 1 & 0xfffffff2) + 0x10;
  if ((((unaff_ESI == 1) || (unaff_ESI == 5)) || (unaff_ESI == 0x10)) ||
     (unaff_ESI == (uVar1 | 0xc))) {
    FUN_00460fe0(param_1,param_2,&local_1c,&local_10,local_28);
  }
  else if ((unaff_ESI == (uVar1 | 8)) || (unaff_ESI == 9)) {
    *(undefined4 *)(*(int *)(DAT_01233488 + 0x78c) + 0x68) = local_20;
    DAT_0123348c = DAT_0123348c | 0xd;
    return;
  }
  return;
}

