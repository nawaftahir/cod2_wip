// 10093c0c size=91 FUN_10093c0c

undefined4 FUN_10093c0c(void)

{
  int iVar1;
  undefined4 uVar2;
  int in_ECX;
  uint uVar3;
  
  uVar3 = 0;
  if (*(int *)(in_ECX + 0xe0) != 0) {
    if (*(int *)(in_ECX + 8) != 0) {
      do {
        iVar1 = *(int *)(*(int *)(in_ECX + 0x14) + uVar3 * 4);
        if (*(int *)(iVar1 + 0x44) != -1) {
          *(undefined4 *)
           (*(int *)(*(int *)(*(int *)(in_ECX + 0xe0) + 0x14) + *(int *)(iVar1 + 0x44) * 4) + 0xc) =
               *(undefined4 *)(iVar1 + 0xc);
          *(uint *)(*(int *)(*(int *)(*(int *)(in_ECX + 0xe0) + 0x14) + *(int *)(iVar1 + 0x44) * 4)
                   + 0x44) = uVar3;
        }
        uVar3 = uVar3 + 1;
      } while (uVar3 < *(uint *)(in_ECX + 8));
    }
    uVar2 = FUN_1008ba48();
    return uVar2;
  }
  return 1;
}


