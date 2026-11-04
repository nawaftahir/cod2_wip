
void FUN_0046aee0(int param_1,int param_2,int param_3,int param_4)

{
  short *psVar1;
  int iVar2;
  
  for (; param_1 != param_2; param_1 = *(int *)(param_1 + 4)) {
    if (*(int *)(param_1 + 0x38) != 0) {
      if (((*(byte *)(*(int *)(*(int *)(param_1 + 8) + 0x50) + 0x160) & 0x10) == 0) &&
         (DAT_0124a316 == '\0')) {
        iVar2 = FUN_0047d980("e->def->eclass->nShowFlags & ECLASS_PREFAB",".\\map.cpp",0x51a,1,1);
        if (iVar2 == 0) {
          DebugBreak();
        }
        else if (iVar2 == 2) {
          DAT_0124a316 = '\x01';
        }
      }
      if (param_1 != param_3) {
        if (*(int *)(*(int *)(param_1 + 8) + 0x54) == param_4) {
          FUN_00464c20(param_1);
          if (*(int *)(param_1 + 0x34) != 0) {
            (*DAT_0059c490)(*(int *)(param_1 + 0x34));
            *(undefined4 *)(param_1 + 0x34) = 0;
          }
          psVar1 = (short *)(*(int *)(param_1 + 8) + 0x68);
          *psVar1 = *psVar1 + 1;
          *(undefined1 *)(*(int *)(*(int *)(param_1 + 0x18) + 0x14) + 0x40) = 0;
        }
        else {
          FUN_0046aee0(*(undefined4 *)(*(int *)(param_1 + 0x38) + 4),*(int *)(param_1 + 0x38),
                       param_3,param_4);
        }
      }
    }
  }
  return;
}

