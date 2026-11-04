// 1002c100 size=552 R_TrackStatistics

undefined4
R_TrackStatistics(float *param_1,undefined **param_2,int param_3,char *param_4,char *param_5,
                 size_t param_6)

{
  char *pcVar1;
  undefined **ppuVar2;
  char cVar3;
  uint uVar4;
  char *pcVar5;
  char *pcVar6;
  char *pcVar7;
  float local_30;
  float local_2c;
  float local_28;
  float local_24 [4];
  uint uStack_14;
  uint uStack_10;
  char *pcStack_c;
  undefined2 uStack_2;
  
  local_30 = (float)*param_2 * 262144.0 + *param_1;
  local_2c = (float)param_2[1] * 262144.0 + param_1[1];
  local_28 = (float)param_2[2] * 262144.0 + param_1[2];
  (*(code *)RI_CM_SaveLump)(local_24,param_1,&local_30,&DAT_10191348,&DAT_10191348,0,0xf83fff7);
  if (((((char)((ushort)uStack_2 >> 8) != '\0') || ((char)uStack_2 != '\0')) || (local_24[0] == 1.0)
      ) || (pcStack_c == (char *)0x0)) {
    return 0;
  }
  param_3 = param_3 - (int)pcStack_c;
  do {
    cVar3 = *pcStack_c;
    pcStack_c[param_3] = cVar3;
    pcStack_c = pcStack_c + 1;
  } while (cVar3 != '\0');
  *param_4 = '\0';
  param_4[param_6 - 1] = '\0';
  uVar4 = (int)uStack_14 >> 0x14 & 0x1f;
  *param_5 = '\0';
  param_5[param_6 - 1] = '\0';
  if ((uVar4 == 0) || (0x16 < uVar4)) {
    pcVar5 = "^1default^7";
  }
  else {
    pcVar5 = (&PTR_LAB_101a5a9c)[uVar4 * 5];
  }
  _strncpy(param_4,pcVar5,param_6);
  if (param_4[param_6 - 1] == '\0') {
    pcVar5 = param_4;
    do {
      cVar3 = *pcVar5;
      pcVar5 = pcVar5 + 1;
    } while (cVar3 != '\0');
    pcVar5 = pcVar5 + -(int)(param_4 + 1);
    if ((uStack_10 & 1) == 0) {
      pcVar7 = "^3nonsolid^7";
    }
    else {
      pcVar7 = "solid";
    }
    _strncpy(param_5,pcVar7,param_6);
    if (param_5[param_6 - 1] == '\0') {
      pcVar7 = param_5;
      do {
        cVar3 = *pcVar7;
        pcVar7 = pcVar7 + 1;
      } while (cVar3 != '\0');
      pcVar7 = pcVar7 + -(int)(param_5 + 1);
      if (PTR_s_opaqueglass_101a5c68 != (undefined *)0x0) {
        param_2 = &PTR_s_opaqueglass_101a5c68;
        do {
          if (((uint)param_2[2] & uStack_14) != 0) {
            param_4[(int)pcVar5] = ' ';
            pcVar5 = pcVar5 + 1;
            pcVar6 = param_4 + (int)pcVar5;
            _strncpy(pcVar6,*param_2,param_6 - (int)pcVar5);
            if (param_4[param_6 - 1] != '\0') {
              return 0;
            }
            pcVar1 = pcVar6 + 1;
            do {
              cVar3 = *pcVar6;
              pcVar6 = pcVar6 + 1;
            } while (cVar3 != '\0');
            pcVar5 = pcVar6 + ((int)pcVar5 - (int)pcVar1);
          }
          if (((uint)param_2[3] & uStack_10) != 0) {
            param_5[(int)pcVar7] = ' ';
            pcVar7 = pcVar7 + 1;
            pcVar6 = param_5 + (int)pcVar7;
            _strncpy(pcVar6,*param_2,param_6 - (int)pcVar7);
            if (param_5[param_6 - 1] != '\0') {
              return 0;
            }
            pcVar1 = pcVar6 + 1;
            do {
              cVar3 = *pcVar6;
              pcVar6 = pcVar6 + 1;
            } while (cVar3 != '\0');
            pcVar7 = pcVar6 + ((int)pcVar7 - (int)pcVar1);
          }
          ppuVar2 = param_2 + 5;
          param_2 = param_2 + 5;
        } while (*ppuVar2 != (undefined *)0x0);
      }
      return 1;
    }
    return 0;
  }
  return 0;
}


