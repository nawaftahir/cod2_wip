// 10024380 size=117 FUN_10024380

void FUN_10024380(int *param_1)

{
  int *piVar1;
  int iVar2;
  int iVar3;
  int in_EAX;
  int in_ECX;
  int iVar4;
  int unaff_ESI;
  
  iVar3 = DAT_101da9c8;
  iVar2 = *(int *)(DAT_101da9c8 + 4);
  if (iVar2 < 0x10000) {
    if ((*param_1 == 2) && (*(char *)(DAT_101ce634 + 8) != '\0')) {
      iVar4 = ((in_ECX + -0x1000) * 0x400 + (uint)*(ushort *)(in_EAX + 10)) * 0x20 + unaff_ESI;
    }
    else {
      iVar4 = ((uint)*(ushort *)(in_EAX + 10) * 0x20 + unaff_ESI) * 0x1000 + in_ECX;
    }
    *(int *)(DAT_101da9c8 + 8 + iVar2 * 8) = *param_1 + iVar4 * 0x10;
    *(int **)(iVar3 + 0xc + iVar2 * 8) = param_1;
    DAT_10678ab8 = DAT_10678ab8 + 1;
    piVar1 = (int *)(iVar3 + 4);
    *piVar1 = *piVar1 + 1;
  }
  return;
}


