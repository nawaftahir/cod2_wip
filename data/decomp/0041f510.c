
void __thiscall FUN_0041f510(int *param_1,int param_2)

{
  if ((int)(1U - *(int *)(*param_1 + -4) | *(int *)(*param_1 + -8) - param_2) < 0) {
    FUN_00402d30(param_2);
  }
  if ((-1 < param_2) && (param_2 <= *(int *)(*param_1 + -8))) {
    *(int *)(*param_1 + -0xc) = param_2;
    *(undefined1 *)(param_2 + *param_1) = 0;
    return;
  }
                    /* WARNING: Subroutine does not return */
  FUN_00402c90(0x80070057);
}

