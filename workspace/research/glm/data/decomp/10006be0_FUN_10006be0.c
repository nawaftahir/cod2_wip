// 10006be0 size=446 FUN_10006be0

void FUN_10006be0(int param_1,int param_2)

{
  float fVar1;
  float *in_EAX;
  float *pfVar2;
  int in_EDX;
  uint uVar3;
  uint uVar4;
  float *pfVar5;
  float *pfVar6;
  float *pfVar7;
  float local_a0 [40];
  
  uVar4 = 0;
  if (0 < param_2) {
    pfVar5 = local_a0 + 1;
    pfVar6 = (float *)(param_1 + 8);
    pfVar2 = (float *)(in_EDX + 4);
    pfVar7 = (float *)(in_EDX + 8);
    do {
      if ((uVar4 & 1) == 0) {
        fVar1 = -1.0;
      }
      else {
        fVar1 = 1.0;
      }
      uVar3 = uVar4 >> 1 & 1;
      pfVar5[-1] = fVar1 * in_EAX[uVar3] + in_EAX[3];
      pfVar7[-2] = *pfVar6 * in_EAX[2] +
                   *in_EAX * pfVar6[-2] + in_EAX[3] * pfVar6[1] + pfVar6[-1] * in_EAX[1];
      *pfVar5 = fVar1 * in_EAX[uVar3 + 4] + in_EAX[7];
      pfVar7[-1] = in_EAX[4] * pfVar6[-2] +
                   in_EAX[6] * *pfVar6 + in_EAX[5] * pfVar6[-1] + in_EAX[7] * pfVar6[1];
      *(float *)((int)pfVar7 + ((int)local_a0 - in_EDX)) = fVar1 * in_EAX[uVar3 + 8] + in_EAX[0xb];
      *pfVar7 = in_EAX[8] * pfVar6[-2] +
                in_EAX[10] * *pfVar6 + in_EAX[9] * pfVar6[-1] + in_EAX[0xb] * pfVar6[1];
      *(float *)((int)local_a0 + (4 - in_EDX) + (int)pfVar7) =
           fVar1 * in_EAX[uVar3 + 0xc] + in_EAX[0xf];
      pfVar7[1] = in_EAX[0xc] * pfVar6[-2] +
                  in_EAX[0xe] * *pfVar6 + in_EAX[0xd] * pfVar6[-1] + in_EAX[0xf] * pfVar6[1];
      fVar1 = 1.0 / SQRT(pfVar2[1] * pfVar2[1] + pfVar2[-1] * pfVar2[-1] + *pfVar2 * *pfVar2);
      pfVar2[-1] = fVar1 * pfVar2[-1];
      *pfVar2 = fVar1 * *pfVar2;
      pfVar2[1] = fVar1 * pfVar2[1];
      pfVar2[2] = fVar1 * pfVar2[2];
      *(byte *)(pfVar2 + 3) = ((int)pfVar2[-1] < 1) - 1U & 0xc;
      *(byte *)((int)pfVar2 + 0xd) = (((int)*pfVar2 < 1) - 1U & 0xc) + 4;
      *(byte *)((int)pfVar2 + 0xe) = (((int)pfVar2[1] < 1) - 1U & 0xc) + 8;
      *(undefined1 *)((int)pfVar2 + 0xf) = 0xff;
      uVar4 = uVar4 + 1;
      pfVar5 = pfVar5 + 5;
      pfVar6 = pfVar6 + 4;
      pfVar7 = pfVar7 + 5;
      pfVar2 = pfVar2 + 5;
    } while ((int)uVar4 < param_2);
  }
  return;
}


