


void FUN_10051f90(int *param_1)

{
  (**(void **)(*param_1 + 8))(param_1);
  if (param_1[1] != 0) {
    (**(void **)(param_1[1] + 0x28))(param_1);
  }
  param_1[1] = 0;
  param_1[5] = 0;
                    /* WARNING: Could not recover jumptable at 0x10051fbd. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (**(void **)(*param_1 + 0x84))();
  return;
}


