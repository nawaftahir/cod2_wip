// 100259a0 size=363 FUN_100259a0

void FUN_100259a0(int param_1,int param_2,int param_3,undefined1 *param_4)

{
  byte bVar1;
  byte bVar2;
  float fVar3;
  byte *in_EAX;
  int in_ECX;
  int iVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  int iVar8;
  int local_3c;
  undefined1 local_38;
  undefined1 local_34;
  undefined1 local_30;
  
  fVar3 = 1.0 / (float)param_1;
  iVar7 = in_ECX;
  local_3c = in_ECX;
  if (0 < in_ECX) {
    do {
      iVar5 = (uint)in_EAX[2] * iVar7;
      iVar4 = (uint)*in_EAX * iVar7;
      iVar8 = (uint)in_EAX[1] * iVar7;
      iVar6 = iVar7 - param_1;
      while( true ) {
        iVar6 = iVar6 + in_ECX;
        in_EAX = in_EAX + param_2 * param_3;
        if (0 < iVar6) break;
        iVar4 = iVar4 + (uint)*in_EAX * in_ECX;
        iVar8 = iVar8 + (uint)in_EAX[1] * in_ECX;
        iVar5 = iVar5 + (uint)in_EAX[2] * in_ECX;
        iVar7 = iVar7 + in_ECX;
      }
      iVar7 = iVar7 + (in_ECX - param_1);
      iVar6 = in_ECX - iVar7;
      bVar1 = in_EAX[1];
      bVar2 = in_EAX[2];
      local_38 = (undefined1)
                 (int)ROUND((float)(int)(iVar4 + (uint)*in_EAX * iVar6) * fVar3 + 9.313226e-10);
      *param_4 = local_38;
      local_34 = (undefined1)
                 (int)ROUND((float)(int)(iVar8 + (uint)bVar1 * iVar6) * fVar3 + 9.313226e-10);
      param_4[1] = local_34;
      local_30 = (undefined1)
                 (int)ROUND((float)(int)(iVar5 + (uint)bVar2 * iVar6) * fVar3 + 9.313226e-10);
      param_4[2] = local_30;
      param_4 = param_4 + param_2 * param_3;
      local_3c = local_3c + -1;
    } while (local_3c != 0);
  }
  return;
}


