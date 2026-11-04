// 100ab8d7 size=119 FUN_100ab8d7

undefined4 FUN_100ab8d7(uint *param_1,int param_2)

{
  int iVar1;
  int in_ECX;
  uint uVar2;
  
  iVar1 = FUN_100a6e19(*param_1 & 0xfff00000);
  uVar2 = 0;
  if (iVar1 != 0) {
    if (param_1[5] == 0) {
      return 1;
    }
    if (param_2 != 0) {
      FUN_1008b0b5();
      return 0;
    }
    param_2 = 1;
  }
  if (param_1[5] != 0) {
    do {
      iVar1 = FUN_100ab8d7(*(undefined4 *)
                            (*(int *)(in_ECX + 0x18) + *(int *)(param_1[6] + uVar2 * 4) * 4),param_2
                          );
      if (iVar1 == 0) {
        return 0;
      }
      uVar2 = uVar2 + 1;
    } while (uVar2 < param_1[5]);
  }
  return 1;
}


