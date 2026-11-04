// 100b2c55 size=38 FUN_100b2c55

void FUN_100b2c55(void)

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
  FUN_100c8cf0();
  return;
}


