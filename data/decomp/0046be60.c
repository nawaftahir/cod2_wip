
void FUN_0046be60(LPCSTR param_1)

{
  int iVar1;
  ushort *unaff_ESI;
  ushort uVar2;
  uint uVar3;
  uint uVar4;
  
  uVar2 = 0;
  if (*unaff_ESI != 0) {
    do {
      iVar1 = lstrcmpiA(param_1,(LPCSTR)((uint)unaff_ESI[3] * (uint)uVar2 + *(int *)(unaff_ESI + 6))
                       );
      if (iVar1 == 0) {
        if (uVar2 != 0) {
          uVar3 = (uint)uVar2;
          uVar4 = uVar3;
          do {
            lstrcpyA((LPSTR)(uVar4 * unaff_ESI[3] + *(int *)(unaff_ESI + 6)),
                     (LPCSTR)((uVar4 - 1) * (uint)unaff_ESI[3] + *(int *)(unaff_ESI + 6)));
            uVar4 = uVar4 - 1;
            uVar3 = uVar3 - 1;
          } while (uVar3 != 0);
        }
        goto LAB_0046bed2;
      }
      uVar2 = uVar2 + 1;
    } while (uVar2 < *unaff_ESI);
  }
  uVar4 = *unaff_ESI + 1;
  if ((uint)unaff_ESI[2] <= *unaff_ESI + 1) {
    uVar4 = (uint)unaff_ESI[2];
  }
  *unaff_ESI = (ushort)uVar4;
  if ((short)(uVar4 - 1) != 0) {
    uVar3 = uVar4 - 1 & 0xffff;
    uVar4 = uVar3;
    do {
      lstrcpyA((LPSTR)(uVar4 * unaff_ESI[3] + *(int *)(unaff_ESI + 6)),
               (LPCSTR)((uVar4 - 1) * (uint)unaff_ESI[3] + *(int *)(unaff_ESI + 6)));
      uVar4 = uVar4 - 1;
      uVar3 = uVar3 - 1;
    } while (uVar3 != 0);
  }
LAB_0046bed2:
  _strncpy(*(char **)(unaff_ESI + 6),param_1,unaff_ESI[3] - 1);
  return;
}

