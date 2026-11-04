// 100ab0e0 size=249 FUN_100ab0e0

int FUN_100ab0e0(void)

{
  void *pvVar1;
  undefined4 uVar2;
  int in_ECX;
  int iVar3;
  uint uVar4;
  
  uVar4 = 0;
  iVar3 = 0;
  pvVar1 = operator_new(*(int *)(in_ECX + 0xc) << 2);
  *(void **)(in_ECX + 0x2b4) = pvVar1;
  pvVar1 = operator_new(*(int *)(in_ECX + 8) << 2);
  *(void **)(in_ECX + 0x2b8) = pvVar1;
  if ((*(int *)(in_ECX + 0x2b4) == 0) || (pvVar1 == (void *)0x0)) {
LAB_100ab1ce:
    iVar3 = -0x7ff8fff2;
  }
  else {
    if (*(int *)(in_ECX + 0xc) != 0) {
      do {
        iVar3 = FUN_10085814(0x74);
        if (iVar3 == 0) {
          uVar2 = 0;
        }
        else {
          uVar2 = FUN_10085379();
        }
        *(undefined4 *)(*(int *)(in_ECX + 0x2b4) + uVar4 * 4) = uVar2;
        if (*(int *)(*(int *)(in_ECX + 0x2b4) + uVar4 * 4) == 0) goto LAB_100ab1ce;
        iVar3 = FUN_10085abe(*(undefined4 *)(*(int *)(in_ECX + 0x18) + uVar4 * 4));
        if (iVar3 < 0) {
          return iVar3;
        }
        uVar4 = uVar4 + 1;
      } while (uVar4 < *(uint *)(in_ECX + 0xc));
    }
    uVar4 = 0;
    if (*(int *)(in_ECX + 8) != 0) {
      do {
        iVar3 = FUN_10085d76(0x80);
        if (iVar3 == 0) {
          uVar2 = 0;
        }
        else {
          uVar2 = FUN_10085bf1();
        }
        *(undefined4 *)(*(int *)(in_ECX + 0x2b8) + uVar4 * 4) = uVar2;
        if (*(int *)(*(int *)(in_ECX + 0x2b8) + uVar4 * 4) == 0) goto LAB_100ab1ce;
        iVar3 = FUN_10085c65(*(undefined4 *)(*(int *)(in_ECX + 0x14) + uVar4 * 4));
        if (iVar3 < 0) {
          return iVar3;
        }
        uVar4 = uVar4 + 1;
      } while (uVar4 < *(uint *)(in_ECX + 8));
    }
    *(undefined4 *)(in_ECX + 0x2c0) = *(undefined4 *)(in_ECX + 0xc);
    *(undefined4 *)(in_ECX + 700) = *(undefined4 *)(in_ECX + 8);
  }
  return iVar3;
}


