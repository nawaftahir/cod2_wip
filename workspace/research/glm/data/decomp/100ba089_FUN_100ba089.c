// 100ba089 size=70 FUN_100ba089

undefined4 FUN_100ba089(int param_1,int param_2,int param_3)

{
  uint uVar1;
  
  if (*(int *)(param_2 + 0x24) != param_3) {
    uVar1 = 0;
    *(int *)(param_2 + 0x24) = param_3;
    if (*(int *)(param_2 + 0x1c) != 0) {
      do {
        FUN_100ba089(param_1,*(undefined4 *)
                              (param_1 + *(int *)(*(int *)(param_2 + 0x20) + uVar1 * 4) * 4),param_3
                    );
        uVar1 = uVar1 + 1;
      } while (uVar1 < *(uint *)(param_2 + 0x1c));
    }
  }
  return 0;
}


