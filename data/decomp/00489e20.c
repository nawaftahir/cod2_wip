
void FUN_00489e20(char *param_1)

{
  char cVar1;
  char *pcVar2;
  char *pcVar3;
  char *_Memory;
  int iVar4;
  undefined4 *unaff_EBX;
  size_t _Size;
  
  pcVar2 = param_1;
  do {
    cVar1 = *pcVar2;
    pcVar2 = pcVar2 + 1;
  } while (cVar1 != '\0');
  _Memory = (char *)*unaff_EBX;
  if (_Memory != (char *)0x0) {
    pcVar3 = _Memory;
    do {
      cVar1 = *pcVar3;
      pcVar3 = pcVar3 + 1;
    } while (cVar1 != '\0');
    if ((uint)((int)pcVar2 - (int)(param_1 + 1)) <= (uint)((int)pcVar3 - (int)(_Memory + 1)))
    goto LAB_00489e85;
    _free(_Memory);
  }
  _Size = ((int)pcVar2 - (int)(param_1 + 1)) + 1;
  _Memory = _malloc(_Size);
  if (_Memory == (char *)0x0) {
    FUN_00489b70();
  }
  else {
    FUN_0048b5a0(_Memory,0,_Size);
  }
  *unaff_EBX = _Memory;
LAB_00489e85:
  iVar4 = (int)_Memory - (int)param_1;
  do {
    cVar1 = *param_1;
    param_1[iVar4] = cVar1;
    param_1 = param_1 + 1;
  } while (cVar1 != '\0');
  return;
}

