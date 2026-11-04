// 1003f620 size=145 FUN_1003f620

void FUN_1003f620(void)

{
  int iVar1;
  float fVar2;
  float fVar3;
  float *in_ECX;
  int unaff_EDI;
  
  iVar1 = *(int *)(unaff_EDI + 0x54);
  if ((uint)*(byte *)(iVar1 + 0xf) * (uint)*(byte *)(iVar1 + 0xe) == 1) {
    *in_ECX = 0.0;
    in_ECX[1] = 0.0;
    in_ECX[2] = 1.0;
    in_ECX[3] = 1.0;
    return;
  }
  fVar2 = 1.0 / (float)*(byte *)(iVar1 + 0xf);
  fVar3 = 1.0 / (float)*(byte *)(iVar1 + 0xe);
  *in_ECX = (float)(*(int *)(unaff_EDI + 0x60) % (int)(uint)*(byte *)(iVar1 + 0xf)) * fVar2;
  in_ECX[1] = (float)(*(int *)(unaff_EDI + 0x60) / (int)(uint)*(byte *)(iVar1 + 0xf)) * fVar3;
  in_ECX[2] = fVar2 + *in_ECX;
  in_ECX[3] = fVar3 + in_ECX[1];
  return;
}


