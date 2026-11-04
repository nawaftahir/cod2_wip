// 100a5fdf size=35 FUN_100a5fdf

int FUN_100a5fdf(void)

{
  int iVar1;
  int *piVar2;
  int iVar3;
  int in_ECX;
  uint uVar4;
  
  if (((*(uint *)(in_ECX + 200) & 0xffff) < 0x200) &&
     (iVar3 = *(int *)(in_ECX + 0x100), (*(ushort *)(iVar3 + 2) & 0xfff0) != 0)) {
    uVar4 = 0;
    if (*(uint *)(iVar3 + 4) != 0) {
      piVar2 = *(int **)(iVar3 + 8);
      do {
        iVar1 = *(int *)(*(int *)(in_ECX + 0x14) + *piVar2 * 4);
        if (*(int *)(iVar1 + 8) != -1) {
          iVar3 = FUN_100a5663(*(undefined4 *)(iVar1 + 8));
          if (-1 < iVar3) {
            return 0;
          }
          return iVar3;
        }
        uVar4 = uVar4 + 1;
        piVar2 = piVar2 + 1;
      } while (uVar4 < *(uint *)(iVar3 + 4));
    }
    return 0;
  }
  return 0;
}


