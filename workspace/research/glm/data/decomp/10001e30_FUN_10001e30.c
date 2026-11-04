// 10001e30 size=364 FUN_10001e30

void FUN_10001e30(int param_1)

{
  float fVar1;
  int iVar2;
  int *in_ECX;
  int in_EDX;
  int iVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  float *unaff_EDI;
  int local_30;
  int local_2c;
  
  iVar2 = 0;
  if (0 < in_EDX) {
    local_30 = 0;
    local_2c = in_EDX;
    do {
      iVar6 = param_1;
      iVar7 = local_30;
      if (0 < param_1) {
        do {
          fVar1 = (float)*(byte *)(in_ECX[3] + iVar7);
          iVar3 = (int)ROUND((fVar1 * *unaff_EDI + (float)*(byte *)(*in_ECX + iVar2)) * 0.5 +
                             9.313226e-10);
          iVar4 = (int)ROUND((fVar1 * unaff_EDI[1] + (float)*(byte *)(in_ECX[1] + iVar2)) * 0.5 +
                             9.313226e-10);
          iVar5 = (int)ROUND((fVar1 * unaff_EDI[2] + (float)*(byte *)(in_ECX[2] + iVar2)) * 0.5 +
                             9.313226e-10);
          if (-1 < iVar3 + -0xff) {
            iVar3 = 0xff;
          }
          *(char *)(*in_ECX + 2 + iVar2) = (char)iVar3;
          if (-1 < iVar4 + -0xff) {
            iVar4 = 0xff;
          }
          *(char *)(*in_ECX + 1 + iVar2) = (char)iVar4;
          if (-1 < iVar5 + -0xff) {
            iVar5 = 0xff;
          }
          *(char *)(iVar2 + *in_ECX) = (char)iVar5;
          *(undefined1 *)(*in_ECX + 3 + iVar2) = 0xff;
          iVar2 = iVar2 + 4;
          iVar6 = iVar6 + -1;
          iVar7 = iVar7 + 2;
        } while (iVar6 != 0);
      }
      local_30 = local_30 + param_1 * 4;
      local_2c = local_2c + -1;
    } while (local_2c != 0);
  }
  return;
}


