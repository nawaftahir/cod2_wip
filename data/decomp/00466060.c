
uint __fastcall FUN_00466060(undefined4 param_1,byte *param_2)

{
  byte bVar1;
  byte *pbVar2;
  uint uVar3;
  byte *pbVar4;
  uint uVar5;
  bool bVar6;
  char *local_10 [3];
  
  local_10[0] = "worldspawn";
  local_10[1] = "func_group";
  local_10[2] = "func_cullgroup";
  uVar5 = 0;
  do {
    pbVar4 = (byte *)local_10[uVar5];
    pbVar2 = param_2;
    do {
      bVar1 = *pbVar2;
      bVar6 = bVar1 < *pbVar4;
      if (bVar1 != *pbVar4) {
LAB_004660aa:
        uVar3 = (1 - (uint)bVar6) - (uint)(bVar6 != 0);
        goto LAB_004660af;
      }
      if (bVar1 == 0) break;
      bVar1 = pbVar2[1];
      bVar6 = bVar1 < pbVar4[1];
      if (bVar1 != pbVar4[1]) goto LAB_004660aa;
      pbVar2 = pbVar2 + 2;
      pbVar4 = pbVar4 + 2;
    } while (bVar1 != 0);
    uVar3 = 0;
LAB_004660af:
    if (uVar3 == 0) {
      return 1;
    }
    uVar5 = uVar5 + 1;
    if (2 < uVar5) {
      return uVar3 & 0xffffff00;
    }
  } while( true );
}

