// 100b0cbc size=196 FUN_100b0cbc

void FUN_100b0cbc(void)

{
  undefined4 *in_ECX;
  int iVar1;
  uint uVar2;
  int *piVar3;
  
  *in_ECX = &PTR_FUN_10116ac0;
  _free((void *)in_ECX[0x8b]);
  _free((void *)in_ECX[0x8c]);
  uVar2 = 0;
  if ((in_ECX[0xad] != 0) && (in_ECX[0xb0] != 0)) {
    do {
      if (*(int *)(in_ECX[0xad] + uVar2 * 4) != 0) {
        FUN_1006c418(1);
      }
      uVar2 = uVar2 + 1;
    } while (uVar2 < (uint)in_ECX[0xb0]);
  }
  uVar2 = 0;
  if ((in_ECX[0xae] != 0) && (in_ECX[0xaf] != 0)) {
    do {
      if (*(int *)(in_ECX[0xae] + uVar2 * 4) != 0) {
        FUN_1006db35(1);
      }
      uVar2 = uVar2 + 1;
    } while (uVar2 < (uint)in_ECX[0xaf]);
  }
  piVar3 = in_ECX + 0xb1;
  iVar1 = 0x10;
  do {
    if (*piVar3 != 0) {
      FUN_1006c418(1);
    }
    *piVar3 = 0;
    piVar3 = piVar3 + 1;
    iVar1 = iVar1 + -1;
  } while (iVar1 != 0);
  _free((void *)in_ECX[0xad]);
  _free((void *)in_ECX[0xae]);
  FUN_100c520c();
  return;
}


