// 100ad87a size=126 FUN_100ad87a

int FUN_100ad87a(void)

{
  uint *puVar1;
  uint uVar2;
  int iVar3;
  int in_ECX;
  uint uVar4;
  
  uVar4 = 0;
  if (*(int *)(in_ECX + 0x4c) != 0) {
    do {
      puVar1 = *(uint **)(*(int *)(in_ECX + 0x230) + uVar4 * 4);
      if (((puVar1 != (uint *)0x0) &&
          (((uVar2 = **(uint **)(*(int *)(in_ECX + 0x230) + uVar4 * 4),
            (uVar2 & 0xfff00000) == 0x60500000 || ((*puVar1 & 0xfff00000) == 0x60000000)) &&
           (iVar3 = *(int *)(*(int *)(in_ECX + 0x14) +
                            *(int *)(puVar1[2] + (uVar2 & 0xfffff) * 4) * 4),
           *(int *)(iVar3 + 4) == *(int *)(in_ECX + 0x88))))) &&
         (iVar3 = FUN_100ad49d(*(undefined4 *)(in_ECX + 0x22c),*(undefined4 *)(in_ECX + 0x220),
                               *(undefined4 *)(iVar3 + 0xc)), iVar3 < 0)) {
        return iVar3;
      }
      uVar4 = uVar4 + 1;
    } while (uVar4 < *(uint *)(in_ECX + 0x4c));
  }
  return 0;
}


