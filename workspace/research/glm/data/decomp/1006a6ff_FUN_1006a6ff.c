// 1006a6ff size=31 FUN_1006a6ff

void FUN_1006a6ff(void)

{
  int in_ECX;
  uint uVar1;
  
  uVar1 = 0;
  do {
    if (*(int *)(in_ECX + uVar1 * 4) != 0) {
      FUN_1006a6cc(1);
    }
    uVar1 = uVar1 + 1;
  } while (uVar1 < 7);
  return;
}


