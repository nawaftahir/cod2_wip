
void FUN_00467510(int param_1)

{
  char *_Str1;
  int iVar1;
  
  iVar1 = *(int *)(param_1 + 0x50);
  if ((((iVar1 != 0) && (*(int *)(iVar1 + 8) != 0)) && (*(char **)(iVar1 + 0x158) != (char *)0x0))
     && (**(char **)(iVar1 + 0x158) != '\0')) {
    _Str1 = (char *)FUN_00464bb0();
    if ((_Str1 == (char *)0x0) && (DAT_0124a2e5 == '\0')) {
      iVar1 = FUN_0047d980("modelName",".\\entity.cpp",0x4dd,0,1);
      if (iVar1 == 0) {
        DebugBreak();
      }
      else if (iVar1 == 2) {
        DAT_0124a2e5 = '\x01';
      }
    }
    iVar1 = __stricmp(_Str1,*(char **)(*(int *)(param_1 + 0x50) + 0x158));
    if (iVar1 != 0) {
      FUN_00465bf0(param_1,"model",*(undefined4 *)(*(int *)(param_1 + 0x50) + 0x158));
      *(short *)(param_1 + 0x68) = *(short *)(param_1 + 0x68) + 1;
      *(undefined4 *)(param_1 + 0x54) = 0;
      *(undefined1 *)(*(int *)(param_1 + 0xc) + 0x40) = 0;
    }
  }
  return;
}

