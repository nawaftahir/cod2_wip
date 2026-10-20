
void __fastcall FUN_004b2020(int param_1)

{
  int in_EAX;
  int iVar1;
  
  iVar1 = *(int *)(in_EAX + 0x16b4);
  if (0xd < iVar1) {
    *(ushort *)(in_EAX + 0x16b0) =
         *(ushort *)(in_EAX + 0x16b0) | (ushort)(param_1 << ((byte)iVar1 & 0x1f));
    *(undefined1 *)(*(int *)(in_EAX + 8) + *(int *)(in_EAX + 0x14)) =
         *(undefined1 *)(in_EAX + 0x16b0);
    iVar1 = *(int *)(in_EAX + 0x14) + 1;
    *(int *)(in_EAX + 0x14) = iVar1;
    *(undefined1 *)(iVar1 + *(int *)(in_EAX + 8)) = *(undefined1 *)(in_EAX + 0x16b1);
    iVar1 = *(int *)(in_EAX + 0x16b4);
    *(int *)(in_EAX + 0x14) = *(int *)(in_EAX + 0x14) + 1;
    *(int *)(in_EAX + 0x16b4) = iVar1 + -0xd;
    *(ushort *)(in_EAX + 0x16b0) = (ushort)param_1 >> (0x10U - (char)iVar1 & 0x1f);
    FUN_004b2af0(1);
    return;
  }
  *(int *)(in_EAX + 0x16b4) = iVar1 + 3;
  *(ushort *)(in_EAX + 0x16b0) =
       *(ushort *)(in_EAX + 0x16b0) | (ushort)(param_1 << ((byte)iVar1 & 0x1f));
  FUN_004b2af0(1);
  return;
}

