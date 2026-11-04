// 1004f960 size=128 FUN_1004f960

uint FUN_1004f960(void)

{
  int iVar1;
  int iVar2;
  undefined4 in_EAX;
  undefined3 uVar4;
  uint uVar3;
  int in_EDX;
  
  uVar4 = (undefined3)((uint)in_EAX >> 8);
  uVar3 = CONCAT31(uVar4,*(char *)(in_EDX + 0x50));
  if ((((*(char *)(in_EDX + 0x50) == '\0') &&
       (uVar3 = CONCAT31(uVar4,*(char *)(in_EDX + 0x112)), *(char *)(in_EDX + 0x112) == '\0')) &&
      (uVar3 = 0, *(int *)(in_EDX + 0x30) == 3)) &&
     (((*(int *)(in_EDX + 0x2c) == 3 && (*(int *)(in_EDX + 0x34) == 2)) &&
      (*(int *)(in_EDX + 0x6c) == 3)))) {
    iVar1 = *(int *)(in_EDX + 0xcc);
    if (((*(int *)(iVar1 + 8) != 2) || (uVar3 = 1, *(int *)(iVar1 + 0x5c) != 1)) ||
       (((*(int *)(iVar1 + 0xb0) != 1 ||
         ((((2 < *(int *)(iVar1 + 0xc) || (*(int *)(iVar1 + 0x60) != 1)) ||
           (*(int *)(iVar1 + 0xb4) != 1)) ||
          ((iVar2 = *(int *)(in_EDX + 0x120), *(int *)(iVar1 + 0x24) != iVar2 ||
           (*(int *)(iVar1 + 0x78) != iVar2)))))) || (*(int *)(iVar1 + 0xcc) != iVar2)))) {
      uVar3 = 0;
    }
    return uVar3;
  }
  return uVar3 & 0xffffff00;
}


