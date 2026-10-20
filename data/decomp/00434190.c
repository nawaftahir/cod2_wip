
void FUN_00434190(char param_1,undefined4 param_2,undefined4 param_3,undefined4 param_4)

{
  undefined4 *puVar1;
  int iVar2;
  undefined4 *puVar3;
  
  puVar3 = DAT_010a44b8;
  while( true ) {
    if (puVar3 == &DAT_010a44b4) {
      return;
    }
    if (puVar3[8] != 0) break;
    puVar3 = (undefined4 *)puVar3[1];
  }
  FUN_004433b0();
  FUN_00443a90();
  FUN_00443ec0();
  puVar3 = DAT_010a44b8;
  if (DAT_010a44b8 != &DAT_010a44b4) {
    do {
      if ((int *)puVar3[8] != (int *)0x0) {
        if ((*(int *)puVar3[8] != *(int *)(puVar3[5] + 0x44)) && (DAT_0124a158 == '\0')) {
          iVar2 = FUN_0047d980("b->patch->def == b->def->patch",".\\Pmesh.cpp",0x1673,0,1);
          if (iVar2 == 0) {
            DebugBreak();
          }
          else if (iVar2 == 2) {
            DAT_0124a158 = '\x01';
          }
        }
        if (param_1 == '\0') {
          FUN_00427240();
        }
        else {
          FUN_004274b0(param_2,param_3,param_4);
        }
      }
      puVar1 = puVar3 + 1;
      puVar3 = (undefined4 *)*puVar1;
    } while ((undefined4 *)*puVar1 != &DAT_010a44b4);
  }
  FUN_00443f80();
  FUN_00444150();
  return;
}

