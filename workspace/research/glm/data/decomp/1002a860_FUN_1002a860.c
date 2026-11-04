// 1002a860 size=214 FUN_1002a860

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_1002a860(int param_1)

{
  undefined4 uVar1;
  int *piVar2;
  
  if (*(int *)(DAT_101ce708 + 8) != 2) {
    piVar2 = (int *)FUN_1000cc10("*smodel_lighting",2,1,4);
    *(int **)(param_1 + 0x10c) = piVar2;
    uVar1 = DAT_10696ce0;
    FUN_1000ee30(DAT_10696cd0 * 2,DAT_10696cd4 * 2,2,0xb,0);
    if (*piVar2 == 4) {
      FUN_1000ec00(piVar2,0x15,0,uVar1);
    }
    else {
      FUN_1000ea20(0x15,uVar1);
    }
    *(undefined4 *)(param_1 + 0x118) = 0x3e800000;
    *(float *)(param_1 + 0x110) = _DAT_10696cd8 * 0.5;
    *(float *)(param_1 + 0x114) = _DAT_10696cdc * 0.5;
    DAT_10696cd0 = 0;
    DAT_10696cd4 = 0;
    _DAT_10696cd8 = 0.0;
    _DAT_10696cdc = 0.0;
    DAT_10696ce0 = 0;
  }
  return;
}


