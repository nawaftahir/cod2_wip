
undefined4 __thiscall FUN_004b92a0(int param_1,undefined4 param_2,int *param_3)

{
  int iVar1;
  undefined1 **ppuStack_1c;
  int *piStack_18;
  undefined1 *local_c;
  undefined4 local_8;
  undefined4 local_4;
  
  piStack_18 = (int *)0x0;
  ppuStack_1c = &local_c;
  local_4 = 0;
  local_8 = 0;
  local_c = &DAT_00598c80;
  FUN_004be850();
  piStack_18 = param_3;
  ppuStack_1c = (undefined1 **)0x0;
  (**(code **)(**(int **)(param_1 + 0xc) + 0x24))(&local_c,&local_c);
  iVar1 = *param_3;
  while (iVar1 < 2) {
    switch(*(undefined1 *)ppuStack_1c) {
    case 0x4e:
    case 0x6e:
      if (ppuStack_1c == (undefined1 **)&DAT_00598c80) {
        return 0;
      }
      _free(ppuStack_1c);
      return 0;
    default:
      (**(code **)(**(int **)(param_1 + 0xc) + 0x24))(&ppuStack_1c,&ppuStack_1c,0,param_3);
      iVar1 = *param_3;
      break;
    case 0x59:
    case 0x79:
      if (ppuStack_1c != (undefined1 **)&DAT_00598c80) {
        _free(ppuStack_1c);
      }
      return 1;
    }
  }
  if (ppuStack_1c == (undefined1 **)&DAT_00598c80) {
    return 0;
  }
  _free(ppuStack_1c);
  return 0;
}

