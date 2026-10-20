
void FUN_00401ad0(undefined4 param_1,undefined4 param_2,int param_3)

{
  float fVar1;
  int *piVar2;
  LRESULT LVar3;
  int iVar4;
  uint uVar5;
  
  if (param_3 == 0) {
    iVar4 = 0;
  }
  else {
    iVar4 = *(int *)(param_3 + 0x1c);
  }
  uVar5 = 0;
  piVar2 = &DAT_0058fb98;
  do {
    if (*piVar2 == iVar4) {
      LVar3 = SendMessageA(*(HWND *)(param_3 + 0x1c),0x400,0,0);
      fVar1 = (float)LVar3 * (float)(&DAT_0058fb94)[uVar5 * 8] + (float)(&DAT_0058fb8c)[uVar5 * 8];
      (&DAT_0058fb88)[uVar5 * 8] = fVar1;
      if ((float)(&DAT_0058fb90)[uVar5 * 8] < fVar1) {
        (&DAT_0058fb88)[uVar5 * 8] = (&DAT_0058fb90)[uVar5 * 8];
      }
      FUN_00401000(uVar5);
      break;
    }
    uVar5 = uVar5 + 1;
    piVar2 = piVar2 + 8;
  } while (uVar5 < 3);
  FUN_004fce8f(param_1,param_2,param_3);
  return;
}

