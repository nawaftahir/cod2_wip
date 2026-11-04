// 10087a5d size=221 FUN_10087a5d

undefined4 FUN_10087a5d(int param_1,int param_2)

{
  uint *puVar1;
  uint uVar2;
  int iVar3;
  undefined4 uVar4;
  int *piVar5;
  int in_ECX;
  
  if (param_1 == param_2) {
    return 1;
  }
  iVar3 = *(int *)(*(int *)(in_ECX + 0x14) + param_2 * 4);
  if ((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar3 + 4) * 4) + 4) & 2) == 0) {
    return 0;
  }
  puVar1 = *(uint **)(*(int *)(in_ECX + 0x18) + *(int *)(iVar3 + 0x48) * 4);
  if ((*puVar1 & 0xfff00000) == 0x10000000) {
    uVar2 = 0;
    if (puVar1[3] != 0) {
      piVar5 = (int *)puVar1[4];
      do {
        if (*piVar5 == param_2) break;
        uVar2 = uVar2 + 1;
        piVar5 = piVar5 + 1;
      } while (uVar2 < puVar1[3]);
    }
    iVar3 = FUN_10087a5d(param_1,*(undefined4 *)(puVar1[2] + uVar2 * 4));
    if (iVar3 == 0) goto LAB_10087ade;
LAB_10087ad6:
    uVar4 = 1;
  }
  else {
LAB_10087ade:
    if ((*puVar1 & 0xfff00000) == 0x20500000) {
      uVar2 = 0;
      if (puVar1[3] != 0) {
        piVar5 = (int *)puVar1[4];
        do {
          if (*piVar5 == param_2) break;
          uVar2 = uVar2 + 1;
          piVar5 = piVar5 + 1;
        } while (uVar2 < puVar1[3]);
      }
      iVar3 = FUN_10087a5d(param_1,*(undefined4 *)(puVar1[2] + uVar2 * 4));
      if ((iVar3 != 0) ||
         (iVar3 = FUN_10087a5d(param_1,*(undefined4 *)(puVar1[2] + (puVar1[3] + uVar2) * 4)),
         iVar3 != 0)) goto LAB_10087ad6;
    }
    uVar4 = 0;
  }
  return uVar4;
}


