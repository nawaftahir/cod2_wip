// 10086309 size=151 FUN_10086309

void FUN_10086309(void)

{
  undefined4 *in_ECX;
  uint uVar1;
  
  *in_ECX = &PTR_FUN_101103f8;
  if (in_ECX[4] != 0) {
    uVar1 = 0;
    if (in_ECX[1] != 0) {
      do {
        if (*(int *)(in_ECX[4] + uVar1 * 4) != 0) {
          FUN_10085de7(1);
        }
        uVar1 = uVar1 + 1;
      } while (uVar1 < (uint)in_ECX[1]);
    }
    _free((void *)in_ECX[4]);
  }
  if (in_ECX[5] != 0) {
    uVar1 = 0;
    if (in_ECX[2] != 0) {
      do {
        if (*(int *)(in_ECX[5] + uVar1 * 4) != 0) {
          FUN_1006db35(1);
        }
        uVar1 = uVar1 + 1;
      } while (uVar1 < (uint)in_ECX[2]);
    }
    _free((void *)in_ECX[5]);
  }
  if (in_ECX[6] != 0) {
    uVar1 = 0;
    if (in_ECX[3] != 0) {
      do {
        if (*(int *)(in_ECX[6] + uVar1 * 4) != 0) {
          FUN_1006c418(1);
        }
        uVar1 = uVar1 + 1;
      } while (uVar1 < (uint)in_ECX[3]);
    }
    _free((void *)in_ECX[6]);
  }
  return;
}


