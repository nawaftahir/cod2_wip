


void FUN_10086920(void *param_1,unsigned int *param_2,unsigned int param_3,unsigned int param_4)

{
  unsigned int uVar1;
  unsigned int uVar2;
  unsigned int *puVar3;
  int iVar4;
  unsigned int uVar5;
  unsigned int uVar6;
  unsigned int uVar7;
  unsigned int uVar8;
  unsigned int local_c;
  unsigned int local_8;
  
  puVar3 = param_2;
  if (1 < param_3) {
    uVar5 = param_3 >> 1;
    if (uVar5 != 0) {
      local_8 = uVar5 * 2 + 1;
      do {
        uVar5 = uVar5 - 1;
        uVar1 = puVar3[uVar5];
        local_8 = local_8 - 2;
        uVar8 = local_8;
        param_2 = (unsigned int *)uVar5;
        while (uVar8 < param_3) {
          local_c = puVar3[uVar8];
          uVar7 = uVar8;
          if (uVar8 + 1 < param_3) {
            uVar6 = puVar3[uVar8 + 1];
            iVar4 = (*param_1)(uVar6,local_c,param_4);
            if (0 < iVar4) {
              uVar7 = uVar8 + 1;
              local_c = uVar6;
            }
          }
          iVar4 = (*param_1)(local_c,uVar1,param_4);
          if (iVar4 < 1) break;
          puVar3[(int)param_2] = puVar3[uVar7];
          param_2 = (unsigned int *)uVar7;
          uVar8 = uVar7 * 2 + 1;
        }
        puVar3[(int)param_2] = uVar1;
      } while (uVar5 != 0);
    }
    while (param_3 = param_3 - 1, param_3 != 0) {
      param_2 = (unsigned int *)0x0;
      uVar1 = puVar3[param_3];
      uVar5 = 1;
      puVar3[param_3] = *puVar3;
      if (1 < param_3) {
        do {
          uVar6 = puVar3[uVar5];
          uVar8 = uVar5;
          if (uVar5 + 1 < param_3) {
            uVar2 = puVar3[uVar5 + 1];
            iVar4 = (*param_1)(uVar2,uVar6,param_4);
            if (0 < iVar4) {
              uVar6 = uVar2;
              uVar8 = uVar5 + 1;
            }
          }
          iVar4 = (*param_1)(uVar6,uVar1,param_4);
          if (iVar4 < 1) break;
          uVar5 = uVar8 * 2 + 1;
          puVar3[(int)param_2] = puVar3[uVar8];
          param_2 = (unsigned int *)uVar8;
        } while (uVar5 < param_3);
      }
      puVar3[(int)param_2] = uVar1;
    }
  }
  return;
}


