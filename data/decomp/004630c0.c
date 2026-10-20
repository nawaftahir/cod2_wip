
void FUN_004630c0(void *param_1)

{
  undefined4 *puVar1;
  undefined4 *_Memory;
  int iVar2;
  
  _Memory = *(undefined4 **)((int)param_1 + 0x154);
  while (_Memory != (undefined4 *)0x0) {
    puVar1 = (undefined4 *)*_Memory;
    if (((_Memory[3] != 0) && (FUN_00462ff0(), _Memory[3] != 0)) && (DAT_0124a2d3 == '\0')) {
      iVar2 = FUN_0047d980("model->entities.next == NULL",".\\eclass.cpp",0x3d,1,1);
      if (iVar2 == 0) {
        DebugBreak();
      }
      else if (iVar2 == 2) {
        DAT_0124a2d3 = '\x01';
      }
    }
    _free(_Memory);
    _Memory = puVar1;
  }
  _free(*(void **)((int)param_1 + 0x15c));
  _free(*(void **)((int)param_1 + 0x158));
  _free(*(void **)((int)param_1 + 4));
  _free(*(void **)((int)param_1 + 0x50));
  _free(param_1);
  return;
}

