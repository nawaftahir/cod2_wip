
void __fastcall FUN_004b2af0(int param_1,undefined1 *param_2,int param_3)

{
  int iVar1;
  int iVar2;
  byte bVar3;
  
  iVar1 = FUN_004b2a80();
  *(undefined4 *)(iVar1 + 0x16ac) = 8;
  if (param_3 != 0) {
    *(byte *)(*(int *)(iVar1 + 0x14) + *(int *)(iVar1 + 8)) = (byte)param_1;
    iVar2 = *(int *)(iVar1 + 0x14) + 1;
    *(int *)(iVar1 + 0x14) = iVar2;
    bVar3 = (byte)((uint)param_1 >> 8);
    *(byte *)(iVar2 + *(int *)(iVar1 + 8)) = bVar3;
    iVar2 = *(int *)(iVar1 + 0x14) + 1;
    *(int *)(iVar1 + 0x14) = iVar2;
    *(byte *)(iVar2 + *(int *)(iVar1 + 8)) = ~(byte)param_1;
    iVar2 = *(int *)(iVar1 + 0x14) + 1;
    *(int *)(iVar1 + 0x14) = iVar2;
    *(byte *)(iVar2 + *(int *)(iVar1 + 8)) = ~bVar3;
    *(int *)(iVar1 + 0x14) = *(int *)(iVar1 + 0x14) + 1;
  }
  for (; param_1 != 0; param_1 = param_1 + -1) {
    *(undefined1 *)(*(int *)(iVar1 + 0x14) + *(int *)(iVar1 + 8)) = *param_2;
    param_2 = param_2 + 1;
    *(int *)(iVar1 + 0x14) = *(int *)(iVar1 + 0x14) + 1;
  }
  return;
}

