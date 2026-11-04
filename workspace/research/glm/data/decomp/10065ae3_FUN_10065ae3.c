// 10065ae3 size=237 FUN_10065ae3

void FUN_10065ae3(void)

{
  char *pcVar1;
  uint uVar2;
  int in_ECX;
  int iVar3;
  undefined4 *puVar4;
  char *pcVar5;
  bool bVar6;
  
  FUN_10082643(0x100000,0x10000);
  FUN_10067440();
  *(undefined4 *)(in_ECX + 0x2a4) = 0;
  FUN_10065167();
  *(undefined4 *)(in_ECX + 0x38) = 0;
  *(undefined4 *)(in_ECX + 0x3c) = 0;
  *(undefined4 *)(in_ECX + 0x40) = 1;
  *(undefined4 *)(in_ECX + 0x44) = 0;
  *(undefined4 *)(in_ECX + 0x48) = 0;
  *(undefined4 *)(in_ECX + 0x4c) = 1;
  *(undefined4 *)(in_ECX + 0x50) = 1;
  *(undefined4 *)(in_ECX + 0x54) = 1;
  *(undefined4 *)(in_ECX + 0x58) = 0;
  *(undefined4 *)(in_ECX + 0x5c) = 0;
  *(undefined4 *)(in_ECX + 0x60) = 0;
  *(undefined4 *)(in_ECX + 100) = 0;
  *(undefined4 *)(in_ECX + 0x68) = 0;
  *(undefined4 *)(in_ECX + 0x268) = 0;
  *(undefined4 *)(in_ECX + 0x26c) = 0;
  puVar4 = (undefined4 *)(in_ECX + 0x6c);
  for (iVar3 = 0x7f; iVar3 != 0; iVar3 = iVar3 + -1) {
    *puVar4 = 0;
    puVar4 = puVar4 + 1;
  }
  puVar4 = (undefined4 *)(in_ECX + 0x278);
  for (iVar3 = 8; iVar3 != 0; iVar3 = iVar3 + -1) {
    *puVar4 = 0;
    puVar4 = puVar4 + 1;
  }
  *(undefined4 *)(in_ECX + 0x298) = 1;
  pcVar1 = _setlocale(4,(char *)0x0);
  pcVar1 = __strdup(pcVar1);
  *(char **)(in_ECX + 0x29c) = pcVar1;
  if (pcVar1 != (char *)0x0) {
    iVar3 = 2;
    bVar6 = true;
    pcVar5 = "C";
    do {
      if (iVar3 == 0) break;
      iVar3 = iVar3 + -1;
      bVar6 = *pcVar1 == *pcVar5;
      pcVar1 = pcVar1 + 1;
      pcVar5 = pcVar5 + 1;
    } while (bVar6);
    if (bVar6) goto LAB_10065b9e;
  }
  _setlocale(4,"C");
LAB_10065b9e:
  uVar2 = __controlfp(0,0);
  *(uint *)(in_ECX + 0x2a0) = uVar2;
  __controlfp(0xffffffff,0x8001f);
  __controlfp(0,0x30000);
  FUN_10083ff7();
  return;
}


