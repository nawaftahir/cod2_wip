// 1007d968 size=108 FUN_1007d968

undefined4 FUN_1007d968(uint param_1)

{
  int iVar1;
  int in_ECX;
  int iVar2;
  
  iVar2 = param_1;
  param_1 = 0;
  *(int *)(in_ECX + 0x20) = iVar2;
  if (*(short *)(*(int *)(in_ECX + 0x18) + 10) != 0) {
    do {
      FUN_1007d968(iVar2);
      iVar1 = *(int *)(*(int *)(in_ECX + 0x38) + param_1 * 4);
      param_1 = param_1 + 1;
      iVar2 = iVar2 + ((-(uint)(*(short *)(iVar1 + 8) != 0) & 3) + 1) *
                      (uint)*(ushort *)(*(int *)(iVar1 + 0x18) + 8) * *(int *)(iVar1 + 0x2c) * 4;
    } while (param_1 < *(ushort *)(*(int *)(in_ECX + 0x18) + 10));
  }
  return 0;
}


