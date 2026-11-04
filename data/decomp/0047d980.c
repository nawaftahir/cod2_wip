
void FUN_0047d980(undefined4 param_1,undefined4 param_2,undefined4 param_3,undefined4 param_4,
                 undefined4 param_5)

{
  if (DAT_012334fd != '\0') {
    FUN_0047d7b0();
    FUN_0047d830(DAT_0124ba58,1);
    FUN_0047d8b0(param_3,param_5);
    FUN_00408f20("ASSERTBEGIN - ( Recursive assert )---------------------------------------------\n"
                );
    FUN_00408f20(&DAT_01142378);
    FUN_00408f20(
                "ASSERTEND - ( Recursive assert ) ----------------------------------------------\n\n"
                );
                    /* WARNING: Subroutine does not return */
    _exit(-1);
  }
  DAT_0124ba58 = param_4;
  DAT_012334fd = 1;
  FUN_0047d8b0(param_3,param_5);
  FUN_00408f20("ASSERTBEGIN -------------------------------------------------------------------\n");
  FUN_00408f20(&DAT_01142378);
  FUN_00408f20("ASSERTEND ---------------------------------------------------------------------\n");
  DAT_012334fc = 0;
  FUN_0047d7b0();
  FUN_0047d830(param_4,0);
  DAT_012334fd = 0;
  return;
}

