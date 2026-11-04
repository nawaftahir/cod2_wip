
void __fastcall FUN_004a5af0(float *param_1)

{
  float fVar1;
  float fVar2;
  float fVar3;
  int in_EAX;
  float *unaff_EDI;
  float local_34;
  float local_30;
  float local_2c;
  float local_28;
  float local_24;
  float local_20;
  float local_1c;
  float local_18;
  float local_14;
  
  fVar1 = *param_1 - *(float *)(in_EAX + 0x10);
  fVar2 = param_1[1] - *(float *)(in_EAX + 0x14);
  fVar3 = param_1[2] - *(float *)(in_EAX + 0x18);
  FUN_004826e0();
  *unaff_EDI = local_34 * fVar1 + local_30 * fVar2 + local_2c * fVar3;
  unaff_EDI[1] = local_28 * fVar1 + local_24 * fVar2 + local_20 * fVar3;
  unaff_EDI[2] = local_1c * fVar1 + local_18 * fVar2 + local_14 * fVar3;
  return;
}

