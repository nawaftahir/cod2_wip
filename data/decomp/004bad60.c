
undefined4 __fastcall FUN_004bad60(int param_1)

{
  undefined4 uVar1;
  
  if (*(int **)(param_1 + 8) != (int *)0x0) {
                    /* WARNING: Could not recover jumptable at 0x004bad69. Too many branches */
                    /* WARNING: Treating indirect jump as call */
    uVar1 = (**(code **)(**(int **)(param_1 + 8) + 8))();
    return uVar1;
  }
  return 0;
}

