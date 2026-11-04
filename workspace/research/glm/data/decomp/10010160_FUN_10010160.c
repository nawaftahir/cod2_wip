// 10010160 size=780 FUN_10010160

void FUN_10010160(undefined4 param_1,int param_2,int param_3,undefined4 param_4,code *param_5)

{
  uint uVar1;
  float fVar2;
  float fVar3;
  int iVar4;
  uint *puVar5;
  int iVar6;
  int iVar7;
  float local_98 [9];
  int local_74;
  float local_70;
  float local_6c;
  float local_68;
  float local_64;
  uint *local_60;
  int local_5c;
  float local_58;
  float local_54;
  float local_50;
  int local_4c;
  undefined4 local_48;
  uint local_44 [17];
  
  fVar2 = 1.0 / (float)param_3;
  local_44[3] = 4;
  local_44[7] = 4;
  local_44[0xb] = 4;
  puVar5 = local_44;
  local_44[2] = 1;
  local_44[0xf] = 1;
  local_48 = 0;
  local_44[0] = 5;
  local_44[1] = 3;
  local_44[4] = 3;
  local_44[5] = 2;
  local_44[6] = 0;
  local_44[8] = 3;
  local_44[9] = 0;
  local_44[10] = 5;
  local_44[0xc] = 0;
  local_44[0xd] = 3;
  local_44[0xe] = 5;
  local_44[0x10] = 3;
  iVar7 = 0;
  local_5c = 6;
  do {
    local_98[0] = 0.0;
    local_98[1] = 0.0;
    local_98[2] = 0.0;
    if ((puVar5[-1] & 1) == 0) {
      fVar3 = 1.0;
    }
    else {
      fVar3 = -1.0;
    }
    uVar1 = *puVar5;
    local_60 = puVar5;
    local_98[(int)puVar5[-1] >> 1] = fVar3;
    iVar4 = (int)uVar1 >> 1;
    local_98[3] = 0.0;
    local_98[4] = 0.0;
    local_98[5] = 0.0;
    if ((uVar1 & 1) == 0) {
      fVar3 = -1.0;
    }
    else {
      fVar3 = 1.0;
    }
    uVar1 = puVar5[1];
    local_98[iVar4] = fVar3;
    local_98[iVar4 + 3] = fVar3 * -2.0;
    iVar4 = (int)uVar1 >> 1;
    local_98[6] = 0.0;
    local_98[7] = 0.0;
    local_98[8] = 0.0;
    if ((uVar1 & 1) == 0) {
      fVar3 = -1.0;
    }
    else {
      fVar3 = 1.0;
    }
    local_98[iVar4] = fVar3;
    local_74 = 0;
    local_98[iVar4 + 6] = fVar3 * -2.0;
    local_98[3] = local_98[3] * fVar2;
    local_98[4] = local_98[4] * fVar2;
    local_98[5] = local_98[5] * fVar2;
    local_98[6] = local_98[6] * fVar2;
    local_98[7] = local_98[7] * fVar2;
    local_98[8] = local_98[8] * fVar2;
    if (0 < param_3) {
      local_58 = local_98[3] * 0.5 + local_98[0];
      local_4c = iVar7 + param_3 * param_3;
      local_54 = local_98[4] * 0.5 + local_98[1];
      local_50 = local_98[5] * 0.5 + local_98[2];
      iVar4 = param_2 + iVar7 * 4;
      do {
        local_70 = (float)local_74 + 0.5;
        iVar6 = iVar4 + param_3 * 4;
        local_6c = local_98[6] * local_70 + local_58;
        local_68 = local_98[7] * local_70 + local_54;
        local_64 = local_98[8] * local_70 + local_50;
        iVar7 = param_3;
        do {
          (*param_5)(&local_6c,param_4,iVar4);
          local_6c = local_98[3] + local_6c;
          iVar4 = iVar4 + 4;
          iVar7 = iVar7 + -1;
          local_68 = local_98[4] + local_68;
          local_64 = local_98[5] + local_64;
        } while (iVar7 != 0);
        local_74 = local_74 + 1;
        puVar5 = local_60;
        iVar4 = iVar6;
        iVar7 = local_4c;
      } while (local_74 < param_3);
    }
    puVar5 = puVar5 + 3;
    local_5c = local_5c + -1;
  } while (local_5c != 0);
  local_60 = puVar5;
  FUN_1000fbd0(param_2,param_3 * param_3 * 4,0x15);
  return;
}


