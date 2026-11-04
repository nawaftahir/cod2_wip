// 1001e260 size=310 FUN_1001e260

void FUN_1001e260(float *param_1,float *param_2)

{
  float fVar1;
  float fVar2;
  float fVar3;
  float fVar4;
  float fVar5;
  float fVar6;
  float fVar7;
  float *in_EAX;
  float *in_ECX;
  float *unaff_ESI;
  float *unaff_EDI;
  
  in_ECX[4] = *unaff_EDI * *in_EAX + in_EAX[8] * unaff_EDI[2] + unaff_EDI[1] * in_EAX[4];
  in_ECX[5] = unaff_EDI[1] * in_EAX[5] + *unaff_EDI * in_EAX[1] + in_EAX[9] * unaff_EDI[2];
  in_ECX[6] = unaff_EDI[1] * in_EAX[6] + *unaff_EDI * in_EAX[2] + in_EAX[10] * unaff_EDI[2];
  in_ECX[10] = *unaff_ESI * *in_EAX + unaff_ESI[2] * in_EAX[8] + unaff_ESI[1] * in_EAX[4];
  in_ECX[0xb] = unaff_ESI[1] * in_EAX[5] + unaff_ESI[2] * in_EAX[9] + *unaff_ESI * in_EAX[1];
  in_ECX[0xc] = unaff_ESI[1] * in_EAX[6] + unaff_ESI[2] * in_EAX[10] + *unaff_ESI * in_EAX[2];
  in_ECX[0xd] = param_2[1] * in_EAX[4] + in_EAX[8] * param_2[2] + *param_2 * *in_EAX;
  in_ECX[0xe] = *param_2 * in_EAX[1] + in_EAX[5] * param_2[1] + in_EAX[9] * param_2[2];
  in_ECX[0xf] = *param_2 * in_EAX[2] + in_EAX[6] * param_2[1] + in_EAX[10] * param_2[2];
  *in_ECX = *param_1 * *in_EAX + param_1[1] * in_EAX[4] + param_1[2] * in_EAX[8] + in_EAX[0xc];
  in_ECX[1] = in_EAX[5] * param_1[1] + in_EAX[9] * param_1[2] + *param_1 * in_EAX[1] + in_EAX[0xd];
  fVar1 = *param_1;
  fVar2 = in_EAX[2];
  fVar3 = in_EAX[10];
  fVar4 = param_1[2];
  fVar5 = in_EAX[6];
  fVar6 = param_1[1];
  fVar7 = in_EAX[0xe];
  in_ECX[3] = 1.0;
  in_ECX[2] = fVar5 * fVar6 + fVar3 * fVar4 + fVar1 * fVar2 + fVar7;
  return;
}


