// 10032560 size=740 FUN_10032560

void FUN_10032560(char *param_1,int param_2,int param_3,float param_4,float param_5,float param_6,
                 float param_7,undefined4 param_8,int param_9,int param_10,undefined4 param_11)

{
  char cVar1;
  undefined4 uVar2;
  float fVar3;
  float fVar4;
  float fVar5;
  int iVar6;
  int iVar7;
  int local_2c;
  float local_28;
  
  fVar3 = param_4 - param_6 * 0.5;
  uVar2 = *(undefined4 *)(param_3 + 0xc);
  cVar1 = *param_1;
  param_5 = param_5 - param_7 * 0.5;
  local_28 = 0.0;
  local_2c = 0;
  param_4 = fVar3;
  iVar7 = param_3;
  do {
    if ((cVar1 == '\0') || (param_2 == 0)) {
      if (local_2c == param_10) {
        FUN_10032400(uVar2,param_11,local_28 + param_4,param_5,iVar7,param_6,param_7);
      }
      return;
    }
    iVar6 = (*(code *)RI_Com_GetBsp)(&param_1,0);
    if (iVar6 == 0x5e) {
      if ((((param_1 == (char *)0x0) || (cVar1 = *param_1, cVar1 == '^')) || (cVar1 < '0')) ||
         ('9' < cVar1)) {
LAB_10032697:
        iVar6 = FUN_1000bc70(iVar7);
        local_28 = (float)(int)*(char *)(iVar6 + 2) * param_6;
        fVar4 = (float)(int)*(char *)(iVar6 + 3) * param_7;
        if ((param_9 == 3) || (param_9 == 6)) {
          fVar5 = (float)(byte)((param_9 != 3) + 1);
          FUN_1002e850(fVar5 + local_28 + param_4,fVar4 + fVar5 + param_5,
                       (float)*(byte *)(iVar6 + 5) * param_6,(float)*(byte *)(iVar6 + 6) * param_7,
                       *(undefined4 *)(iVar6 + 8),*(undefined4 *)(iVar6 + 0xc),
                       *(undefined4 *)(iVar6 + 0x10),*(undefined4 *)(iVar6 + 0x14));
        }
        fVar5 = local_28 + param_4;
        FUN_1002e850(fVar5,fVar4 + param_5,(float)*(byte *)(iVar6 + 5) * param_6,
                     (float)*(byte *)(iVar6 + 6) * param_7,*(undefined4 *)(iVar6 + 8),
                     *(undefined4 *)(iVar6 + 0xc),*(undefined4 *)(iVar6 + 0x10),
                     *(undefined4 *)(iVar6 + 0x14));
        if (local_2c == param_10) {
          FUN_10032400(uVar2,param_11,fVar5,param_5,param_3,param_6,param_7);
        }
        local_2c = local_2c + 1;
        param_2 = param_2 + -1;
        iVar7 = param_3;
        fVar4 = (float)*(byte *)(iVar6 + 4) * param_6 + param_4;
      }
      else {
        if (((byte)(cVar1 - 0x30U) < 10) && ((byte)(cVar1 - 0x30U) != 7)) {
          FUN_10032370();
        }
        param_1 = param_1 + 1;
        local_2c = local_2c + 2;
        fVar4 = param_4;
      }
    }
    else {
      fVar4 = fVar3;
      if (iVar6 == 10) {
        param_5 = (float)*(int *)(iVar7 + 4) * param_7 + param_5;
      }
      else if (iVar6 != 0xd) goto LAB_10032697;
    }
    param_4 = fVar4;
    cVar1 = *param_1;
  } while( true );
}


