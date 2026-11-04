// 1002c7b0 size=160 FUN_1002c7b0

void FUN_1002c7b0(void)

{
  float fVar1;
  float fVar2;
  undefined1 *in_EAX;
  int iVar3;
  int iVar4;
  int in_EDX;
  int unaff_EDI;
  undefined1 local_10;
  
  iVar3 = *(int *)(in_EDX + 0xc) * *(int *)(in_EDX + 0x10);
  iVar4 = 0;
  if (0 < iVar3) {
    do {
      fVar1 = *(float *)(unaff_EDI + 4 + iVar4 * 8);
      fVar2 = *(float *)(unaff_EDI + iVar4 * 8);
      fVar1 = SQRT(fVar2 * fVar2 + fVar1 * fVar1) * (1.0 / (float)iVar3);
      if (0.0 <= fVar1 - 1.0) {
        fVar1 = 1.0;
      }
      local_10 = (undefined1)(int)ROUND(fVar1 * 255.0 + 9.313226e-10);
      *in_EAX = local_10;
      in_EAX = in_EAX + 1;
      iVar4 = iVar4 + 1;
    } while (iVar4 < *(int *)(in_EDX + 0xc) * *(int *)(in_EDX + 0x10));
    return;
  }
  return;
}


