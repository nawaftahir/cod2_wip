
void FUN_00402c90(int param_1)

{
  code *pcVar1;
  
  if (param_1 == -0x7ff8fff2) {
                    /* WARNING: Subroutine does not return */
    FUN_004f3b9e();
  }
  FUN_00520b54(param_1);
  pcVar1 = (code *)swi(3);
  (*pcVar1)();
  return;
}

