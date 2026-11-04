// 100c7450 size=160 FUN_100c7450

int FUN_100c7450(void)

{
  int iVar1;
  undefined4 *puVar2;
  int in_ECX;
  int iVar3;
  int local_8;
  
  iVar3 = 1;
  local_8 = 1;
  if (((((**(uint **)(in_ECX + 0x100) & 0xfff00000) != 0x20500000) ||
       ((iVar1 = *(int *)(*(int *)(in_ECX + 0x14) +
                         *(int *)((*(uint **)(in_ECX + 0x100))[2] +
                                 (**(uint **)(in_ECX + 0x100) & 0xfffff) * 4) * 4),
        (*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar1 + 4) * 4) + 5) & 1) != 0 &&
        (*(double *)(iVar1 + 0x20) == -1.0)))) &&
      (puVar2 = (undefined4 *)
                FUN_100c37fb(**(uint **)(in_ECX + 0x100) & 0xfffff | 0x20400000,
                             *(uint **)(in_ECX + 0x100),0,2,1), iVar3 = local_8,
      puVar2 != (undefined4 *)0x0)) && (iVar3 = FUN_100c72c8(puVar2), iVar3 == 0)) {
    *puVar2 = 0;
  }
  return iVar3;
}


