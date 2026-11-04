// 10081b2b size=54 FUN_10081b2b

void FUN_10081b2b(int param_1)

{
  int iVar1;
  byte bVar2;
  int in_ECX;
  
  *(int *)(in_ECX + 8) = param_1;
  iVar1 = FUN_10081a12(param_1 + 0x10);
  if (-1 < iVar1) {
    bVar2 = 0x10 - (*(byte *)(in_ECX + 0xc) & 0xf);
    *(int *)(in_ECX + 0xc) = *(int *)(in_ECX + 0xc) + (uint)bVar2;
    *(byte *)(*(int *)(in_ECX + 0xc) + -1) = bVar2;
  }
  return;
}


