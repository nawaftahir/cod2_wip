// 100ab874 size=99 FUN_100ab874

int FUN_100ab874(void)

{
  int in_ECX;
  int extraout_ECX;
  int iVar1;
  uint uVar2;
  uint uVar3;
  uint *puVar4;
  undefined8 uVar5;
  
  uVar2 = 0;
  uVar3 = 0;
  if (*(int *)(in_ECX + 0xc) != 0) {
    puVar4 = (uint *)(in_ECX + 0x450);
    do {
      uVar5 = FUN_100a6e19(**(uint **)(*(int *)(in_ECX + 0x18) + uVar3 * 4) & 0xfff00000);
      iVar1 = (int)((ulonglong)uVar5 >> 0x20);
      if ((((int)uVar5 != 0) || (iVar1 == 0x72100000)) || (iVar1 == 0x11000000)) {
        if (0xb < uVar2) {
          return -1;
        }
        *puVar4 = uVar3;
        uVar2 = uVar2 + 1;
        puVar4 = puVar4 + 1;
      }
      uVar3 = uVar3 + 1;
      in_ECX = extraout_ECX;
    } while (uVar3 < *(uint *)(extraout_ECX + 0xc));
  }
  *(uint *)(in_ECX + 0x480) = uVar2;
  return 1 << ((byte)uVar2 & 0x1f);
}


