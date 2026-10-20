
void FUN_0045e0b0(int param_1)

{
  int iVar1;
  int *piVar2;
  
  iVar1 = DAT_01233b64;
  if (*(int *)(param_1 + 0x44) == 0) {
    if (*(int *)(*(int *)(*(int *)(param_1 + 8) + 0x50) + 8) == 0) {
      *(undefined1 *)(param_1 + 0x41) = 0;
      if ((*(int *)(iVar1 + 0x1d8) != 0) && (iVar1 = 0, 0 < *(int *)(param_1 + 0x38))) {
        piVar2 = (int *)(DAT_01128d90 * 0x1c + 0x24 + *(int *)(param_1 + 0x3c));
        while ((*(byte *)(*piVar2 + 0xc) & 2) == 0) {
          iVar1 = iVar1 + 1;
          piVar2 = piVar2 + 0x2a;
          if (*(int *)(param_1 + 0x38) <= iVar1) {
            return;
          }
        }
        *(undefined1 *)(param_1 + 0x41) = 1;
      }
    }
    else {
      iVar1 = *(int *)(*(int *)(param_1 + 8) + 0x54);
      if (iVar1 != 0) {
        if ((*(int *)(iVar1 + 0x154) == 0) && (DAT_0124a22b == '\0')) {
          iVar1 = FUN_0047d980("b->owner->modelClass->model",".\\brush.cpp",0xecb,0,1);
          if (iVar1 == 0) {
            DebugBreak();
          }
          else if (iVar1 == 2) {
            DAT_0124a22b = '\x01';
          }
        }
        iVar1 = *(int *)(*(int *)(*(int *)(param_1 + 8) + 0x54) + 0x154);
        if (*(int *)(iVar1 + 0xc) != 0) {
          FUN_0045e070(iVar1 + 8);
          return;
        }
      }
    }
  }
  return;
}

