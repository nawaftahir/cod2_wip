// 1007e306 size=78 FUN_1007e306

void FUN_1007e306(void)

{
  undefined4 *in_ECX;
  uint uVar1;
  
  *in_ECX = &PTR_FUN_1010fd70;
  if (in_ECX[5] != 0) {
    uVar1 = 0;
    if (in_ECX[6] != 0) {
      do {
        if (*(int *)(in_ECX[5] + uVar1 * 4) != 0) {
          FUN_1007e2e2(1);
        }
        uVar1 = uVar1 + 1;
      } while (uVar1 < (uint)in_ECX[6]);
    }
    _free((void *)in_ECX[5]);
  }
  _free((void *)in_ECX[2]);
  _free((void *)in_ECX[7]);
  return;
}


