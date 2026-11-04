
uint __fastcall FUN_00465e10(undefined4 param_1,byte *param_2,byte *param_3)

{
  byte bVar1;
  undefined4 *puVar2;
  uint in_EAX;
  byte *pbVar3;
  int iVar4;
  byte *pbVar5;
  bool bVar6;
  
  puVar2 = *(undefined4 **)(in_EAX + 100);
  do {
    if (puVar2 == (undefined4 *)0x0) {
      return in_EAX & 0xffffff00;
    }
    pbVar3 = (byte *)puVar2[1];
    pbVar5 = param_2;
    do {
      bVar1 = *pbVar3;
      bVar6 = bVar1 < *pbVar5;
      if (bVar1 != *pbVar5) {
LAB_00465e49:
        in_EAX = (1 - (uint)bVar6) - (uint)(bVar6 != 0);
        goto LAB_00465e4e;
      }
      if (bVar1 == 0) break;
      bVar1 = pbVar3[1];
      bVar6 = bVar1 < pbVar5[1];
      if (bVar1 != pbVar5[1]) goto LAB_00465e49;
      pbVar3 = pbVar3 + 2;
      pbVar5 = pbVar5 + 2;
    } while (bVar1 != 0);
    in_EAX = 0;
LAB_00465e4e:
    if (in_EAX == 0) {
      pbVar3 = (byte *)puVar2[2];
      break;
    }
    puVar2 = (undefined4 *)*puVar2;
  } while( true );
LAB_00465e65:
  bVar1 = *pbVar3;
  bVar6 = bVar1 < *param_3;
  if (bVar1 != *param_3) {
LAB_00465e99:
    iVar4 = (1 - (uint)bVar6) - (uint)(bVar6 != 0);
    return CONCAT31((int3)((uint)iVar4 >> 8),iVar4 == 0);
  }
  if (bVar1 == 0) {
    return 1;
  }
  bVar1 = pbVar3[1];
  bVar6 = bVar1 < param_3[1];
  if (bVar1 != param_3[1]) goto LAB_00465e99;
  pbVar3 = pbVar3 + 2;
  param_3 = param_3 + 2;
  if (bVar1 == 0) {
    return 1;
  }
  goto LAB_00465e65;
}

