// 10032c10 size=73 FUN_10032c10

void FUN_10032c10(int *param_1)

{
  int iVar1;
  
  iVar1 = *param_1;
  FUN_10032560(iVar1 + 0x2c,*(undefined4 *)(iVar1 + 0x28),*(undefined4 *)(iVar1 + 0xc),
               *(undefined4 *)(iVar1 + 4),*(undefined4 *)(iVar1 + 8),*(undefined4 *)(iVar1 + 0x10),
               *(undefined4 *)(iVar1 + 0x14),*(undefined4 *)(iVar1 + 0x18),
               *(undefined4 *)(iVar1 + 0x1c),*(undefined4 *)(iVar1 + 0x20),
               *(undefined1 *)(iVar1 + 0x24));
  *param_1 = (uint)*(ushort *)(*param_1 + 2) + *param_1;
  return;
}


