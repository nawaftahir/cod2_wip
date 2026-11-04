
void FUN_0042aed0(int param_1,undefined4 param_2)

{
  int iVar1;
  int iVar2;
  
  for (iVar1 = *(int *)(param_1 + 4); iVar1 != param_1; iVar1 = *(int *)(iVar1 + 4)) {
    if (*(int **)(iVar1 + 0x20) != (int *)0x0) {
      if ((**(int **)(iVar1 + 0x20) != *(int *)(*(int *)(iVar1 + 0x14) + 0x44)) &&
         (DAT_0124a189 == '\0')) {
        iVar2 = FUN_0047d980("b->patch->def == b->def->patch",".\\Pmesh.cpp",0x8ef,0,1);
        if (iVar2 == 0) {
          DebugBreak();
        }
        else if (iVar2 == 2) {
          DAT_0124a189 = '\x01';
        }
      }
      FUN_0042ae30(**(undefined4 **)(iVar1 + 0x20),param_2);
    }
  }
  return;
}

