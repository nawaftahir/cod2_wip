// 1001ee70 size=399 FUN_1001ee70

void FUN_1001ee70(float *param_1,float param_2)

{
  float fVar1;
  float fVar2;
  float fVar3;
  float fVar4;
  float fVar5;
  float fVar6;
  float fVar7;
  float fVar8;
  float *in_ECX;
  float *in_EDX;
  float *unaff_ESI;
  
  fVar1 = param_2 * *in_EDX;
  fVar4 = param_2 * in_EDX[1];
  fVar5 = param_2 * in_EDX[2];
  fVar3 = param_2 * in_EDX[3];
  fVar6 = param_2 * in_EDX[4];
  fVar7 = param_2 * in_EDX[5];
  fVar2 = param_2 * in_EDX[6];
  fVar8 = param_2 * in_EDX[7];
  param_2 = param_2 * in_EDX[8];
  *in_ECX = fVar3 * param_1[1] + fVar2 * param_1[2] + fVar1 * *param_1;
  in_ECX[1] = fVar6 * param_1[1] + fVar8 * param_1[2] + fVar4 * *param_1;
  in_ECX[2] = fVar7 * param_1[1] + param_2 * param_1[2] + fVar5 * *param_1;
  in_ECX[3] = fVar3 * param_1[5] + fVar2 * param_1[6] + fVar1 * param_1[4];
  in_ECX[4] = fVar6 * param_1[5] + fVar8 * param_1[6] + fVar4 * param_1[4];
  in_ECX[5] = fVar7 * param_1[5] + param_2 * param_1[6] + fVar5 * param_1[4];
  in_ECX[6] = fVar1 * param_1[8] + fVar3 * param_1[9] + fVar2 * param_1[10];
  in_ECX[7] = fVar4 * param_1[8] + fVar6 * param_1[9] + fVar8 * param_1[10];
  in_ECX[8] = fVar5 * param_1[8] + fVar7 * param_1[9] + param_2 * param_1[10];
  in_ECX[9] = fVar3 * param_1[0xd] + fVar2 * param_1[0xe] + fVar1 * param_1[0xc] + *unaff_ESI;
  in_ECX[10] = fVar6 * param_1[0xd] + fVar8 * param_1[0xe] + fVar4 * param_1[0xc] + unaff_ESI[1];
  in_ECX[0xb] = fVar7 * param_1[0xd] + param_2 * param_1[0xe] + fVar5 * param_1[0xc] + unaff_ESI[2];
  return;
}


