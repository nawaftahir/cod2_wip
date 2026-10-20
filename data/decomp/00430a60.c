
void __fastcall FUN_00430a60(char param_1)

{
  int *in_EAX;
  int *piVar1;
  int iVar2;
  int iVar3;
  int *piVar4;
  int *piVar5;
  int local_c;
  int *local_8;
  
  if ((*(byte *)(in_EAX + 4) & 0x40) == 0) {
    if (in_EAX[1] < 4) {
      return;
    }
    in_EAX[1] = in_EAX[1] + -2;
    if ((param_1 != '\0') && (local_c = 0, 0 < *in_EAX)) {
      local_8 = in_EAX + 9;
      do {
        iVar3 = 0;
        piVar1 = local_8;
        if (0 < in_EAX[1]) {
          do {
            piVar4 = piVar1 + 0x1c;
            piVar5 = piVar1;
            for (iVar2 = 0xe; iVar2 != 0; iVar2 = iVar2 + -1) {
              *piVar5 = *piVar4;
              piVar4 = piVar4 + 1;
              piVar5 = piVar5 + 1;
            }
            iVar3 = iVar3 + 1;
            piVar1 = piVar1 + 0xe;
          } while (iVar3 < in_EAX[1]);
        }
        local_c = local_c + 1;
        local_8 = local_8 + 0xe0;
      } while (local_c < *in_EAX);
    }
  }
  else if (param_1 == '\0') {
    FUN_004309e0(in_EAX[1] + -1);
  }
  else {
    FUN_004309e0(0);
  }
  if (DAT_01234694 != 0) {
    FUN_00424b10();
  }
  return;
}

