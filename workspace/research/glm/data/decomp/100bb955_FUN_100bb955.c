// 100bb955 size=131 FUN_100bb955

undefined4 FUN_100bb955(void)

{
  undefined4 uVar1;
  int in_ECX;
  uint uVar2;
  int iVar3;
  uint local_8;
  
  uVar2 = **(uint **)(in_ECX + 0x100) & 0xfffff;
  if ((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) +
                         *(int *)(*(int *)(*(int *)(in_ECX + 0x14) +
                                          *(int *)(*(int *)(*(int *)(in_ECX + 0x14) +
                                                           *(int *)(*(uint **)(in_ECX + 0x100))[2] *
                                                           4) + 0x30) * 4) + 4) * 4) + 4) & 0x80) ==
      0) {
    uVar1 = 1;
  }
  else {
    local_8 = 0;
    if (uVar2 != 0) {
      do {
        iVar3 = local_8 * 4;
        local_8 = local_8 + 1;
        *(undefined4 *)
         (*(int *)(*(int *)(in_ECX + 0x14) +
                  *(int *)(iVar3 + *(int *)(*(int *)(in_ECX + 0x100) + 0x10)) * 4) + 0x30) =
             *(undefined4 *)
              (*(int *)(*(int *)(in_ECX + 0x14) +
                       *(int *)(iVar3 + *(int *)(*(int *)(in_ECX + 0x100) + 8)) * 4) + 0x30);
      } while (local_8 < uVar2);
    }
    **(undefined4 **)(in_ECX + 0x100) = 0;
    uVar1 = 0;
  }
  return uVar1;
}


