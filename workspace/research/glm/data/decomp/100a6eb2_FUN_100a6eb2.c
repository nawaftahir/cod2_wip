// 100a6eb2 size=96 FUN_100a6eb2

void FUN_100a6eb2(undefined4 param_1)

{
  int in_ECX;
  int iVar1;
  undefined4 *puVar2;
  
  puVar2 = (undefined4 *)(in_ECX + 0x1f8);
  for (iVar1 = 8; iVar1 != 0; iVar1 = iVar1 + -1) {
    *puVar2 = 0;
    puVar2 = puVar2 + 1;
  }
  *(undefined4 *)(in_ECX + 0x218) = 0;
  *(undefined4 *)(in_ECX + 0x21c) = 0;
  *(undefined4 *)(in_ECX + 0x220) = 0;
  *(undefined4 *)(in_ECX + 0x224) = 0;
  _free(*(void **)(in_ECX + 0x22c));
  _free(*(void **)(in_ECX + 0x230));
  *(undefined4 *)(in_ECX + 0x22c) = 0;
  *(undefined4 *)(in_ECX + 0x230) = 0;
  FUN_100c8cf0(param_1);
  return;
}


