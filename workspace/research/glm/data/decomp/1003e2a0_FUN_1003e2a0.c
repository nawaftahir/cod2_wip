// 1003e2a0 size=94 FUN_1003e2a0

void FUN_1003e2a0(void)

{
  int iVar1;
  int iVar2;
  int in_EDX;
  undefined4 *puVar3;
  undefined4 *puVar4;
  
  iVar1 = DAT_10730550 * 0xcd0;
  puVar3 = (undefined4 *)(in_EDX + 0x48);
  puVar4 = (undefined4 *)(&DAT_1072e110 + iVar1);
  for (iVar2 = 0x10; iVar2 != 0; iVar2 = iVar2 + -1) {
    *puVar4 = *puVar3;
    puVar3 = puVar3 + 1;
    puVar4 = puVar4 + 1;
  }
  puVar3 = (undefined4 *)(in_EDX + 0x88);
  puVar4 = (undefined4 *)(&DAT_1072e220 + iVar1);
  for (iVar2 = 0x10; iVar2 != 0; iVar2 = iVar2 + -1) {
    *puVar4 = *puVar3;
    puVar3 = puVar3 + 1;
    puVar4 = puVar4 + 1;
  }
  puVar3 = (undefined4 *)(in_EDX + 200);
  puVar4 = (undefined4 *)(&DAT_1072e550 + iVar1);
  for (iVar2 = 0x10; iVar2 != 0; iVar2 = iVar2 + -1) {
    *puVar4 = *puVar3;
    puVar3 = puVar3 + 1;
    puVar4 = puVar4 + 1;
  }
  puVar3 = (undefined4 *)(in_EDX + 0x108);
  puVar4 = (undefined4 *)(&DAT_1072e590 + iVar1);
  for (iVar2 = 0x10; iVar2 != 0; iVar2 = iVar2 + -1) {
    *puVar4 = *puVar3;
    puVar3 = puVar3 + 1;
    puVar4 = puVar4 + 1;
  }
  return;
}


