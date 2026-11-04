// 1002b3c0 size=623 FUN_1002b3c0

void FUN_1002b3c0(float *param_1,int param_2,int param_3,int param_4,int param_5,int param_6)

{
  float fVar1;
  float fVar2;
  int in_EAX;
  int iVar3;
  int iVar4;
  undefined4 uVar5;
  float *in_ECX;
  float *pfVar6;
  float *pfVar7;
  float local_368;
  int local_358;
  undefined1 local_354 [4];
  float local_350;
  float local_34c;
  float local_348;
  undefined1 local_344 [836];
  
  uVar5 = *(undefined4 *)(*(int *)(DAT_101d1b9c + 0x130) + in_EAX * 4);
  iVar4 = *(int *)(*(int *)(param_5 + 0x38) + 0x40);
  iVar3 = in_EAX * 0x60 + *(int *)(DAT_101d1b9c + 300);
  if ((iVar4 == 0) || (*(char *)(iVar4 + 0xe) == '\0')) {
    FUN_10037500(iVar3,uVar5,local_344);
  }
  else {
    FUN_10037420(iVar3,uVar5);
  }
  if (0 < param_3) {
    pfVar6 = (float *)(param_6 + 8);
    pfVar7 = (float *)(param_4 + 0x34);
    local_358 = param_3;
    do {
      pfVar6[-2] = in_ECX[3] * *pfVar7 + pfVar7[-1] * *in_ECX + pfVar7[1] * in_ECX[6] + in_ECX[9];
      pfVar6[-1] = pfVar7[1] * in_ECX[7] + pfVar7[-1] * in_ECX[1] + in_ECX[4] * *pfVar7 + in_ECX[10]
      ;
      *pfVar6 = pfVar7[1] * in_ECX[8] + pfVar7[-1] * in_ECX[2] + in_ECX[5] * *pfVar7 + in_ECX[0xb];
      pfVar6[2] = pfVar7[-6];
      pfVar6[3] = pfVar7[-2];
      local_368 = pfVar7[-0xd];
      fVar1 = pfVar7[-0xb];
      fVar2 = pfVar7[-0xc];
      local_350 = fVar2 * param_1[3] + fVar1 * param_1[6] + local_368 * *param_1;
      local_34c = fVar1 * param_1[7] + local_368 * param_1[1] + fVar2 * param_1[4];
      local_348 = fVar1 * param_1[8] + local_368 * param_1[2] + fVar2 * param_1[5];
      FUN_1002b0c0(pfVar7 + -10,local_344,pfVar6 + 1);
      pfVar7 = pfVar7 + 0x10;
      pfVar6 = pfVar6 + 6;
      local_358 = local_358 + -1;
    } while (local_358 != 0);
  }
  iVar4 = (**(code **)(*DAT_101d49b4 + 0x2c))
                    (DAT_101d49b4,param_2 * 0x18,param_3 * 0x18,local_354,0x1000);
  if (iVar4 < 0) {
    (*(code *)RI_Printf)
              (0,
               "********** DirectX failed a call to lock a vertex buffer or an index buffer **********\n"
              );
    uVar5 = FUN_100efe3c(iVar4);
    (*(code *)RI_Printf)(0,"********** error information:  %s\n",uVar5);
    (*(code *)RI_Sys_DirectXFatalError)();
  }
  FUN_1005eaf0(local_368,param_1,param_3 * 0x18);
  do {
    if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
      _fprintf(DAT_10764584,"%s","dx.smodelCacheVb->Unlock()\n");
      _fflush(DAT_10764584);
    }
    (**(code **)(*DAT_101d49b4 + 0x30))(DAT_101d49b4);
  } while (DAT_1076a830 != 0);
  return;
}


