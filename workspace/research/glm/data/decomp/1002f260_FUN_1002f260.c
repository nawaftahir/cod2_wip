// 1002f260 size=53 FUN_1002f260

void FUN_1002f260(int *param_1)

{
  int iVar1;
  
  iVar1 = *param_1;
  FUN_1002f110(*(undefined4 *)(iVar1 + 4),*(undefined4 *)(iVar1 + 8),*(undefined4 *)(iVar1 + 0xc),
               *(undefined4 *)(iVar1 + 0x10),*(undefined4 *)(iVar1 + 0x14));
  *param_1 = (uint)*(ushort *)(*param_1 + 2) + *param_1;
  return;
}


