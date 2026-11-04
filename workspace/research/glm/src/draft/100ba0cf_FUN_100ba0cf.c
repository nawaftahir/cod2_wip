


unsigned int FUN_100ba0cf(int param_1,int param_2,int param_3)

{
  unsigned int uVar1;
  
  if (*(int *)(param_2 + 0x28) != param_3) {
    uVar1 = 0;
    *(int *)(param_2 + 0x28) = param_3;
    if (*(int *)(param_2 + 0x1c) != 0) {
      do {
        FUN_100ba0cf(param_1,*(unsigned int *)
                              (param_1 + *(int *)(*(int *)(param_2 + 0x20) + uVar1 * 4) * 4),param_3
                    );
        uVar1 = uVar1 + 1;
      } while (uVar1 < *(unsigned int *)(param_2 + 0x1c));
    }
  }
  return 0;
}


