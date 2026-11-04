// 10005d70 size=362 FUN_10005d70

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_10005d70(void)

{
  float fVar1;
  float fVar2;
  float fVar3;
  float fVar4;
  float fVar5;
  float *in_EAX;
  float *in_ECX;
  float *unaff_EDI;
  float local_18;
  
  if (_DAT_101ce5dc == 0.0) {
    local_18 = *in_ECX - *unaff_EDI;
    fVar2 = in_ECX[1];
    fVar3 = unaff_EDI[1];
    fVar4 = in_ECX[2];
    fVar1 = unaff_EDI[2];
    *in_EAX = _DAT_101ce5d4 * (fVar4 - fVar1) - _DAT_101ce5d8 * (fVar2 - fVar3);
    in_EAX[1] = _DAT_101ce5d8 * local_18 - _DAT_101ce5d0 * (fVar4 - fVar1);
    fVar2 = _DAT_101ce5d0 * (fVar2 - fVar3);
    fVar3 = _DAT_101ce5d4;
  }
  else {
    local_18 = *unaff_EDI - _DAT_101ce5d0;
    fVar4 = unaff_EDI[1] - _DAT_101ce5d4;
    fVar1 = unaff_EDI[2] - _DAT_101ce5d8;
    fVar2 = *in_ECX - _DAT_101ce5d0;
    fVar3 = in_ECX[1] - _DAT_101ce5d4;
    fVar5 = in_ECX[2] - _DAT_101ce5d8;
    *in_EAX = fVar3 * fVar1 - fVar5 * fVar4;
    in_EAX[1] = fVar5 * local_18 - fVar1 * fVar2;
    fVar2 = fVar2 * fVar4;
  }
  in_EAX[2] = fVar2 - fVar3 * local_18;
  FUN_100590b0();
  fVar2 = unaff_EDI[1];
  fVar3 = *unaff_EDI;
  fVar4 = unaff_EDI[2];
  *(undefined1 *)((int)in_EAX + 0x13) = 0xff;
  *(byte *)(in_EAX + 4) = ((int)*in_EAX < 1) - 1U & 0xc;
  in_EAX[3] = 0.0 - (fVar4 * in_EAX[2] + fVar3 * *in_EAX + in_EAX[1] * fVar2);
  *(byte *)((int)in_EAX + 0x11) = (((int)in_EAX[1] < 1) - 1U & 0xc) + 4;
  *(byte *)((int)in_EAX + 0x12) = (((int)in_EAX[2] < 1) - 1U & 0xc) + 8;
  return;
}


