// 1002adb0 size=777 FUN_1002adb0

void FUN_1002adb0(float *param_1,int param_2,int param_3,int param_4,int param_5)

{
  float fVar1;
  undefined8 uVar2;
  float *in_EAX;
  undefined4 uVar3;
  int in_ECX;
  float *pfVar4;
  float *pfVar5;
  int iVar6;
  undefined4 unaff_retaddr;
  undefined4 uVar7;
  undefined1 local_38 [4];
  float local_34;
  float local_30;
  float local_2c;
  float local_28;
  float local_24;
  float local_20;
  float local_1c;
  float local_18;
  undefined4 uStack_14;
  float local_10;
  int local_c;
  int local_8;
  undefined4 uStack_4;
  
  local_c = (int)ROUND(*(float *)(*(int *)(DAT_101d1b9c + 0xf8) + 0x54 + in_ECX * 0x60) * 32768.0 +
                       9.313226e-10);
  local_10 = *(float *)(*(int *)(DAT_101d1b9c + 0xf8) + in_ECX * 0x60 + 0x58) * 32768.0;
  local_18 = 0.0;
  uStack_14 = 0x3e100000;
  fVar1 = local_10 + 9.313226e-10;
  _local_8 = CONCAT44(0x3e100000,(int)ROUND(fVar1));
  uVar2 = _local_8;
  if (0 < param_3) {
    pfVar4 = (float *)(param_4 + 0x34);
    pfVar5 = (float *)(param_5 + 0x14);
    iVar6 = param_3;
    do {
      pfVar5[-5] = param_1[3] * *pfVar4 + *param_1 * pfVar4[-1] + pfVar4[1] * param_1[6] +
                   param_1[9];
      pfVar5[-4] = *pfVar4 * param_1[4] + pfVar4[-1] * param_1[1] + pfVar4[1] * param_1[7] +
                   param_1[10];
      pfVar5[-3] = *pfVar4 * param_1[5] + pfVar4[-1] * param_1[2] + pfVar4[1] * param_1[8] +
                   param_1[0xb];
      local_30 = pfVar4[-0xb];
      local_34 = pfVar4[-0xc];
      local_2c = pfVar4[-0xd];
      pfVar5[-2] = local_2c * *in_EAX + local_30 * in_EAX[6] + local_34 * in_EAX[3];
      pfVar5[-1] = local_2c * in_EAX[1] + local_30 * in_EAX[7] + local_34 * in_EAX[4];
      *pfVar5 = local_2c * in_EAX[2] + local_30 * in_EAX[8] + local_34 * in_EAX[5];
      pfVar5[1] = pfVar4[-10];
      pfVar5[2] = pfVar4[-6];
      pfVar5[3] = pfVar4[-2];
      *(undefined2 *)(pfVar5 + 4) = (undefined2)local_c;
      local_8._0_2_ = (undefined2)(int)ROUND(fVar1);
      *(undefined2 *)((int)pfVar5 + 0x12) = (undefined2)local_8;
      local_28 = pfVar4[-7];
      local_20 = pfVar4[-8];
      local_24 = pfVar4[-9];
      iVar6 = iVar6 + -1;
      pfVar5[5] = local_24 * *in_EAX + local_28 * in_EAX[6] + local_20 * in_EAX[3];
      pfVar5[6] = local_20 * in_EAX[4] + local_24 * in_EAX[1] + local_28 * in_EAX[7];
      pfVar5[7] = local_20 * in_EAX[5] + local_24 * in_EAX[2] + local_28 * in_EAX[8];
      local_1c = pfVar4[-3];
      local_10 = pfVar4[-4];
      local_18 = pfVar4[-5];
      *(float *)((param_5 - param_4) + -0x40 + (int)(pfVar4 + 0x10)) =
           local_18 * *in_EAX + local_1c * in_EAX[6] + local_10 * in_EAX[3];
      pfVar5[9] = local_10 * in_EAX[4] + local_18 * in_EAX[1] + local_1c * in_EAX[7];
      pfVar5[10] = local_10 * in_EAX[5] + local_18 * in_EAX[2] + local_1c * in_EAX[8];
      pfVar4 = pfVar4 + 0x10;
      pfVar5 = pfVar5 + 0x10;
    } while (iVar6 != 0);
  }
  uVar7 = 0x1000;
  _local_8 = uVar2;
  iVar6 = (**(code **)(*DAT_101d49b4 + 0x2c))
                    (DAT_101d49b4,param_2 << 6,param_3 << 6,local_38,0x1000);
  if (iVar6 < 0) {
    (*(code *)RI_Printf)
              (0,
               "********** DirectX failed a call to lock a vertex buffer or an index buffer **********\n"
              );
    uVar3 = FUN_100efe3c(iVar6);
    (*(code *)RI_Printf)(0,"********** error information:  %s\n",uVar3);
    (*(code *)RI_Sys_DirectXFatalError)();
  }
  FUN_1005eaf0(uVar7,unaff_retaddr,param_3 << 6);
  do {
    if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
      _fprintf(DAT_10764584,"%s","dx.smodelCacheVb->Unlock()\n");
      _fflush(DAT_10764584);
    }
    (**(code **)(*DAT_101d49b4 + 0x30))(DAT_101d49b4);
  } while (DAT_1076a830 != 0);
  return;
}


