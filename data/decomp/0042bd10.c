
void FUN_0042bd10(int param_1)

{
  int iVar1;
  int iVar2;
  
  for (iVar1 = *(int *)(param_1 + 4); iVar1 != param_1; iVar1 = *(int *)(iVar1 + 4)) {
    if (*(int **)(iVar1 + 0x20) != (int *)0x0) {
      if ((**(int **)(iVar1 + 0x20) != *(int *)(*(int *)(iVar1 + 0x14) + 0x44)) &&
         (DAT_0124a183 == '\0')) {
        iVar2 = FUN_0047d980("b->patch->def == b->def->patch",".\\Pmesh.cpp",0xa50,0,1);
        if (iVar2 == 0) {
          DebugBreak();
        }
        else if (iVar2 == 2) {
          DAT_0124a183 = '\x01';
        }
      }
      *(undefined1 *)(**(int **)(iVar1 + 0x20) + 0x382e) = 0;
    }
  }
  return;
}

