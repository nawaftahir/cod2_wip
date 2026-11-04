// 1001bcc0 size=97 FUN_1001bcc0

bool FUN_1001bcc0(void)

{
  int iVar1;
  ushort *unaff_ESI;
  undefined1 local_44 [12];
  uint local_38;
  uint local_34;
  undefined4 local_30;
  undefined4 local_2c;
  undefined4 local_28;
  undefined4 local_24;
  undefined4 local_20;
  undefined4 local_1c;
  undefined4 local_18;
  undefined4 local_4;
  
  local_38 = (uint)*unaff_ESI;
  local_2c = *(undefined4 *)(unaff_ESI + 4);
  local_24 = *(undefined4 *)(unaff_ESI + 8);
  local_30 = *(undefined4 *)(unaff_ESI + 2);
  local_20 = *(undefined4 *)(unaff_ESI + 10);
  local_1c = *(undefined4 *)(unaff_ESI + 0xc);
  local_18 = *(undefined4 *)(unaff_ESI + 6);
  local_28 = 0x44480000;
  local_4 = 0;
  local_34 = local_38;
  iVar1 = FUN_1000dd70(local_44);
  *(int *)(unaff_ESI + 0xe) = iVar1;
  return iVar1 != 0;
}


