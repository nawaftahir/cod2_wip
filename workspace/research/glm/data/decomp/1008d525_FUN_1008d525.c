// 1008d525 size=249 FUN_1008d525

bool FUN_1008d525(void)

{
  uint uVar1;
  bool bVar2;
  int in_ECX;
  uint uVar3;
  int iVar4;
  int iVar5;
  undefined4 *puVar6;
  
  bVar2 = false;
  FUN_1008a979();
  uVar3 = 0;
  if (*(int *)(in_ECX + 4) != 0) {
    do {
      iVar5 = *(int *)(*(int *)(in_ECX + 0x10) + uVar3 * 4);
      if (((*(uint *)(iVar5 + 4) & 0x400) != 0) && (*(int *)(iVar5 + 0x28) == -1)) {
        *(uint *)(iVar5 + 4) = *(uint *)(iVar5 + 4) & 0xfffffbff;
        bVar2 = true;
      }
      uVar3 = uVar3 + 1;
    } while (uVar3 < *(uint *)(in_ECX + 4));
  }
  iVar5 = 0;
  uVar3 = 0;
  if (*(int *)(in_ECX + 8) != 0) {
    do {
      iVar4 = *(int *)(*(int *)(in_ECX + 0x14) + uVar3 * 4);
      uVar1 = *(uint *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar4 + 4) * 4) + 4);
      if (((uVar1 & 0x100) != 0) && ((uVar1 & 0x800) != 0)) {
        *(undefined4 *)(iVar4 + 0x54) = 1;
      }
      if ((*(int *)(iVar4 + 0x54) == -1) && (*(int *)(iVar4 + 0x48) == -1)) {
        *(undefined4 *)(iVar4 + 0x30) = 0xffffffff;
      }
      else {
        *(int *)(iVar4 + 0x30) = iVar5;
        iVar5 = iVar5 + 1;
      }
      uVar3 = uVar3 + 1;
    } while (uVar3 < *(uint *)(in_ECX + 8));
  }
  iVar4 = 0;
  if (iVar5 == *(int *)(in_ECX + 8)) {
    bVar2 = !bVar2;
  }
  else {
    FUN_1008af24();
    uVar3 = 0;
    if (*(int *)(in_ECX + 8) != 0) {
      do {
        iVar5 = *(int *)(*(int *)(in_ECX + 0x14) + uVar3 * 4);
        if ((*(int *)(iVar5 + 0x54) == -1) && (*(int *)(iVar5 + 0x48) == -1)) {
          FUN_1006db35(1);
        }
        else {
          *(int *)(*(int *)(in_ECX + 0x14) + iVar4 * 4) = iVar5;
          iVar4 = iVar4 + 1;
        }
        uVar3 = uVar3 + 1;
      } while (uVar3 < *(uint *)(in_ECX + 8));
    }
    puVar6 = (undefined4 *)(*(int *)(in_ECX + 0x14) + iVar4 * 4);
    for (uVar3 = *(int *)(in_ECX + 8) - iVar4 & 0x3fffffff; uVar3 != 0; uVar3 = uVar3 - 1) {
      *puVar6 = 0;
      puVar6 = puVar6 + 1;
    }
    for (iVar5 = 0; iVar5 != 0; iVar5 = iVar5 + -1) {
      *(undefined1 *)puVar6 = 0;
      puVar6 = (undefined4 *)((int)puVar6 + 1);
    }
    *(int *)(in_ECX + 8) = iVar4;
    bVar2 = false;
  }
  return bVar2;
}


