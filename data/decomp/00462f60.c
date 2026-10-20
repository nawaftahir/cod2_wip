
uint __fastcall FUN_00462f60(int *param_1)

{
  int iVar1;
  int *in_EAX;
  uint uVar2;
  int iVar3;
  
  iVar3 = 0;
  if (0 < *param_1) {
    iVar1 = *in_EAX;
    in_EAX = (int *)param_1[3];
    do {
      if (*in_EAX == iVar1) {
        in_EAX = (int *)0x0;
        if ((int *)param_1[3] + iVar3 != (int *)0x0) {
          uVar2 = FUN_00462bf0();
          return uVar2;
        }
        break;
      }
      iVar3 = iVar3 + 1;
      in_EAX = in_EAX + 1;
    } while (iVar3 < *param_1);
  }
  return (uint)in_EAX & 0xffffff00;
}

