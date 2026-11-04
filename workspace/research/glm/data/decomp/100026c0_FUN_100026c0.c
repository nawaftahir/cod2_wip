// 100026c0 size=244 FUN_100026c0

void FUN_100026c0(int param_1)

{
  int in_ECX;
  int iVar1;
  int iVar2;
  int unaff_ESI;
  int unaff_EDI;
  
  *(undefined4 *)(in_ECX + 4) = 0x48000000;
  *(undefined4 *)(in_ECX + 8) = 0x48000000;
  *(undefined4 *)(in_ECX + 0xc) = 0x48000000;
  iVar2 = 0;
  *(undefined4 *)(in_ECX + 0x10) = 0xc8000000;
  *(undefined4 *)(in_ECX + 0x14) = 0xc8000000;
  *(undefined4 *)(in_ECX + 0x18) = 0xc8000000;
  if (*(short *)(in_ECX + 0x22) != 0) {
    do {
      iVar1 = ((uint)*(ushort *)(*(int *)(in_ECX + 0x24) + iVar2 * 2) + *(int *)(in_ECX + 0x1c)) *
              0x44;
      if (*(float *)(iVar1 + unaff_ESI) < *(float *)(in_ECX + 4)) {
        *(undefined4 *)(in_ECX + 4) = *(undefined4 *)(iVar1 + unaff_ESI);
      }
      if (*(float *)(in_ECX + 0x10) < *(float *)(iVar1 + unaff_ESI)) {
        *(undefined4 *)(in_ECX + 0x10) = *(undefined4 *)(iVar1 + unaff_ESI);
      }
      if (*(float *)(iVar1 + 4 + unaff_ESI) < *(float *)(in_ECX + 8)) {
        *(undefined4 *)(in_ECX + 8) = *(undefined4 *)(iVar1 + 4 + unaff_ESI);
      }
      if (*(float *)(in_ECX + 0x14) < *(float *)(iVar1 + 4 + unaff_ESI)) {
        *(undefined4 *)(in_ECX + 0x14) = *(undefined4 *)(iVar1 + 4 + unaff_ESI);
      }
      if (*(float *)(iVar1 + 8 + unaff_ESI) < *(float *)(in_ECX + 0xc)) {
        *(undefined4 *)(in_ECX + 0xc) = *(undefined4 *)(iVar1 + 8 + unaff_ESI);
      }
      if (*(float *)(in_ECX + 0x18) < *(float *)(iVar1 + 8 + unaff_ESI)) {
        *(undefined4 *)(in_ECX + 0x18) = *(undefined4 *)(iVar1 + 8 + unaff_ESI);
      }
      iVar2 = iVar2 + 1;
      *(float *)(iVar1 + 0x24 + unaff_ESI) =
           *(float *)(iVar1 + 0x24 + param_1) * *(float *)(unaff_EDI + 0xc) +
           *(float *)(unaff_EDI + 4);
      *(float *)(iVar1 + 0x28 + unaff_ESI) =
           *(float *)(iVar1 + 0x28 + param_1) * *(float *)(unaff_EDI + 0x10) +
           *(float *)(unaff_EDI + 8);
    } while (iVar2 < (int)(uint)*(ushort *)(in_ECX + 0x22));
  }
  return;
}


