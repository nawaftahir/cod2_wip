// 100a6e56 size=92 FUN_100a6e56

void FUN_100a6e56(void)

{
  undefined4 *in_ECX;
  int iVar1;
  undefined4 *puVar2;
  
  FUN_100c5126();
  in_ECX[0x10f] = 0xffffffff;
  *in_ECX = &PTR_FUN_10116ac0;
  in_ECX[0x8b] = 0;
  in_ECX[0x8c] = 0;
  in_ECX[0x112] = 0;
  in_ECX[0xad] = 0;
  in_ECX[0xae] = 0;
  in_ECX[0xb0] = 0;
  in_ECX[0xaf] = 0;
  puVar2 = in_ECX + 0xb1;
  for (iVar1 = 0x10; iVar1 != 0; iVar1 = iVar1 + -1) {
    *puVar2 = 0;
    puVar2 = puVar2 + 1;
  }
  in_ECX[0x101] = 0;
  return;
}


