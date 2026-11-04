// 100c4cc4 size=137 FUN_100c4cc4

undefined4 FUN_100c4cc4(void)

{
  int *piVar1;
  uint uVar2;
  int iVar3;
  undefined4 uVar4;
  int in_ECX;
  undefined4 local_c;
  undefined4 local_8;
  
  piVar1 = *(int **)(in_ECX + 0x1b0);
  if (piVar1 != (int *)0x0) {
    uVar2 = *(uint *)(in_ECX + 0x11c);
    if ((uVar2 < *(uint *)(in_ECX + 0x110)) && (*(int *)(in_ECX + 0xd4) == 0)) {
      local_c = 0;
      local_8 = 0;
      if ((*(int *)(in_ECX + 0x100) != 0) &&
         ((iVar3 = *(int *)(*(int *)(in_ECX + 0x100) + 0x3c), iVar3 != 0 &&
          (*(int *)(iVar3 + 4) == 0xd)))) {
        local_c = *(undefined4 *)(iVar3 + 0x40);
        local_8 = *(undefined4 *)(iVar3 + 0x44);
      }
      uVar4 = (**(code **)(*piVar1 + 0x10))
                        (piVar1,local_c,local_8,*(int *)(in_ECX + 0x10c) + uVar2 * 4,
                         *(uint *)(in_ECX + 0x110) - uVar2);
      *(undefined4 *)(in_ECX + 0x11c) = *(undefined4 *)(in_ECX + 0x110);
      return uVar4;
    }
  }
  return 0;
}


