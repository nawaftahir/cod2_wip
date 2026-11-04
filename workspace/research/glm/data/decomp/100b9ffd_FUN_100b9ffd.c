// 100b9ffd size=70 FUN_100b9ffd

undefined4 FUN_100b9ffd(int param_1,int param_2,int param_3)

{
  uint uVar1;
  
  if (*(int *)(param_2 + 0x24) != param_3) {
    uVar1 = 0;
    *(int *)(param_2 + 0x24) = param_3;
    if (*(int *)(param_2 + 0x14) != 0) {
      do {
        FUN_100b9ffd(param_1,*(undefined4 *)
                              (param_1 + *(int *)(*(int *)(param_2 + 0x18) + uVar1 * 4) * 4),param_3
                    );
        uVar1 = uVar1 + 1;
      } while (uVar1 < *(uint *)(param_2 + 0x14));
    }
  }
  return 0;
}


