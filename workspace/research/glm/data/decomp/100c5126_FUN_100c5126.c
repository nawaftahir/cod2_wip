// 100c5126 size=230 FUN_100c5126

void FUN_100c5126(void)

{
  undefined4 *in_ECX;
  int iVar1;
  undefined4 *puVar2;
  
  FUN_10086a37();
  *in_ECX = &PTR_FUN_1011a3b8;
  puVar2 = in_ECX + 0x6d;
  for (iVar1 = 7; iVar1 != 0; iVar1 = iVar1 + -1) {
    *puVar2 = 0;
    puVar2 = puVar2 + 1;
  }
  puVar2 = in_ECX + 0x75;
  for (iVar1 = 7; iVar1 != 0; iVar1 = iVar1 + -1) {
    *puVar2 = 0;
    puVar2 = puVar2 + 1;
  }
  in_ECX[0x58] = 0xffffffff;
  in_ECX[0x3f] = 0;
  in_ECX[0x40] = 0;
  in_ECX[0x41] = 0;
  in_ECX[0x59] = 0xffffffff;
  in_ECX[0x5a] = 0xffffffff;
  in_ECX[0x5b] = 0xffffffff;
  in_ECX[0x62] = 0xffffffff;
  in_ECX[0x43] = 0;
  in_ECX[0x44] = 0;
  in_ECX[0x45] = 0;
  in_ECX[0x49] = 0;
  in_ECX[0x4a] = 0;
  in_ECX[0x4b] = 0;
  in_ECX[0x4c] = 0;
  in_ECX[0x4d] = 0;
  in_ECX[0x42] = 0;
  in_ECX[0x6c] = 0;
  in_ECX[0x56] = 0;
  in_ECX[0x7c] = 0;
  in_ECX[0x74] = 0;
  in_ECX[0x7d] = 0;
  in_ECX[0x3a] = 0xffff0000;
  in_ECX[0x3b] = 0x10;
  in_ECX[0x39] = 0xffff;
  in_ECX[0x3e] = 0;
  in_ECX[0x3c] = 0;
  in_ECX[0x3d] = 0;
  in_ECX[99] = 0;
  return;
}


