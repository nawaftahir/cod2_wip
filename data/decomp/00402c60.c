
void __thiscall FUN_00402c60(int *param_1,int param_2)

{
  if ((-1 < param_2) && (param_2 <= *(int *)(*param_1 + -8))) {
    *(int *)(*param_1 + -0xc) = param_2;
    *(undefined1 *)(param_2 + *param_1) = 0;
    return;
  }
                    /* WARNING: Subroutine does not return */
  FUN_00402c90(0x80070057);
}

