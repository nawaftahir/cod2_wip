// 1006a8c3 size=11 FUN_1006a8c3

int FUN_1006a8c3(undefined4 param_1,undefined4 param_2,undefined4 param_3,short *param_4,int param_5
                ,undefined4 *param_6,undefined4 *param_7,uint *param_8)

{
  undefined4 *puVar1;
  short sVar2;
  short *psVar3;
  short *psVar4;
  int iVar5;
  int iVar6;
  int in_ECX;
  uint *puVar7;
  char *pcVar8;
  
  puVar1 = param_6;
  psVar3 = param_4;
  psVar4 = param_4;
  do {
    sVar2 = *psVar4;
    psVar4 = (short *)((int)psVar4 + 1);
  } while ((char)sVar2 != '\0');
  if ((uint)((int)psVar4 - (int)((int)param_4 + 1)) < 3) {
    FUN_10067c3e(param_1,param_3,0x7d5,"invalid register, input, or constant name \'%s\'",param_4);
    return -0x7fffbffb;
  }
  *param_6 = 0;
  *param_7 = 0;
  *param_8 = 0;
  if (*param_4 != 0x5f76) {
    if (*param_4 == 0x5f72) {
      *param_6 = 0;
      iVar5 = FUN_10068bc6(param_4);
      if (iVar5 == 0) {
        puVar7 = (uint *)(in_ECX + 0xa4);
        *param_8 = *puVar7;
        FUN_1006a777(psVar3,*puVar7,1);
        *puVar7 = *puVar7 + 1;
      }
      else {
        *param_8 = *(uint *)(iVar5 + 4);
      }
      if (param_5 == 0) {
        return 0;
      }
      pcVar8 = "addressing operations not allowed on temporary registers \'%s\'";
    }
    else {
      sVar2 = *param_4;
      if ((((sVar2 == 0x5f63) || (sVar2 == 0x5f62)) || (sVar2 == 0x5f69)) || (sVar2 == 0x5f73)) {
        if (*param_4 == 0x5f62) {
          *param_6 = 0xe;
          iVar5 = 0;
        }
        else if (*param_4 == 0x5f69) {
          *param_6 = 7;
          iVar5 = 1;
        }
        else if (*param_4 == 0x5f73) {
          *param_6 = 10;
          iVar5 = 2;
        }
        else {
          *param_6 = 2;
          iVar5 = 3;
        }
        iVar6 = FUN_10068bc6(param_4);
        if (iVar6 == 0) {
          iVar6 = FUN_100843e6(param_3,psVar3,&param_7);
          if (iVar6 < 0) {
            return iVar6;
          }
          if (param_7 == (undefined4 *)0x0) {
            FUN_10067c3e(param_1,param_3,0x7d5,
                         "constant register \'%s\' must be defined as a variable \'%s\'",psVar3,
                         psVar3 + 1);
            return -0x7fffbffb;
          }
          puVar7 = (uint *)(in_ECX + 0x8c + iVar5 * 4);
          *param_8 = *puVar7;
          FUN_1006a777(psVar3,*puVar7,param_7);
          *puVar7 = *puVar7 + (int)param_7;
          *(int *)(in_ECX + 0xac) = *(int *)(in_ECX + 0xac) + 1;
        }
        else {
          *param_8 = *(uint *)(iVar6 + 4);
          param_7 = *(undefined4 **)(iVar6 + 8);
        }
        if (param_5 == 0) {
          return 0;
        }
        puVar1 = *(undefined4 **)(param_5 + 0x18);
        if (param_7 < puVar1) {
          FUN_10067c3e(param_1,param_3,0x7d5,
                       "constant register address out of bounds on constant \'%s\', size %d, offset %d"
                       ,psVar3,param_7,puVar1);
          return -0x7fffbffb;
        }
        *param_8 = *param_8 + (int)puVar1;
        return 0;
      }
      if ((*(int *)(in_ECX + 0xb0) == 0) || (sVar2 != 0x5f6f)) {
        pcVar8 = 
        "\'%s\' is not a valid register name.  Registers must start with v_, r_, c_, b_, or i_ depending on the register type. (o_ for vs_3_0 only)"
        ;
      }
      else {
        *param_6 = 6;
        iVar5 = FUN_10068bc6(param_4);
        if (iVar5 == 0) {
          iVar5 = FUN_10068883(psVar3 + 1,(int)&param_6 + 3,(int)&param_4 + 3);
          if (iVar5 < 0) {
            pcVar8 = "Invalid output register \'%s\' specified";
            goto LAB_1006a953;
          }
          puVar7 = (uint *)(in_ECX + 0xa0);
          *param_8 = *puVar7;
          FUN_1006a777(psVar3,*puVar7,1);
          *puVar7 = *puVar7 + 1;
        }
        else {
          *param_8 = *(uint *)(iVar5 + 4);
        }
        if (param_5 == 0) {
          return 0;
        }
        pcVar8 = "addressing operations are not allowed on output registers \'%s\'";
      }
    }
    goto LAB_1006a953;
  }
  if ((*(int *)(in_ECX + 0xb4) < 10) || (0xc < *(int *)(in_ECX + 0xb4))) {
    *param_6 = 1;
    iVar5 = FUN_10068bc6(param_4);
    if (iVar5 == 0) {
      iVar5 = FUN_10068883(psVar3 + 1,(int)&param_6 + 3,(int)&param_4 + 3);
      if (iVar5 < 0) goto LAB_1006a94d;
      puVar7 = (uint *)(in_ECX + 0x9c);
      *param_8 = *puVar7;
      FUN_1006a777(psVar3,*puVar7,1);
      *puVar7 = *puVar7 + 1;
    }
    else {
      *param_8 = *(uint *)(iVar5 + 4);
    }
    if (param_5 == 0) {
      return 0;
    }
    pcVar8 = "addressing operations are not allowed on input registers \'%s\'";
  }
  else {
    iVar5 = FUN_10068883(param_4 + 1,(int)&param_5 + 3,(int)&param_4 + 3);
    if (-1 < iVar5) {
      if (param_5._3_1_ == '\x05') {
        *puVar1 = 3;
      }
      else {
        if (param_5._3_1_ != '\n') {
          pcVar8 = "Invalid pixel shader input register \'%s\' specified";
          goto LAB_1006a953;
        }
        *puVar1 = 1;
      }
      *param_8 = (uint)param_4 >> 0x18;
      return 0;
    }
LAB_1006a94d:
    pcVar8 = "Invalid input register \'%s\' specified";
  }
LAB_1006a953:
  FUN_10067c3e(param_1,param_3,0x7d5,pcVar8,psVar3);
  return -0x7fffbffb;
}


