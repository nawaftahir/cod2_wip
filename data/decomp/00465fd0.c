
uint __fastcall FUN_00465fd0(undefined4 param_1,byte *param_2)

{
  byte bVar1;
  undefined4 *puVar2;
  uint in_EAX;
  byte *pbVar3;
  byte *pbVar4;
  bool bVar5;
  
  puVar2 = *(undefined4 **)(in_EAX + 100);
  do {
    if (puVar2 == (undefined4 *)0x0) {
      return in_EAX & 0xffffff00;
    }
    pbVar3 = (byte *)puVar2[2];
    pbVar4 = param_2;
    do {
      bVar1 = *pbVar3;
      bVar5 = bVar1 < *pbVar4;
      if (bVar1 != *pbVar4) {
LAB_00466009:
        in_EAX = (1 - (uint)bVar5) - (uint)(bVar5 != 0);
        goto LAB_0046600e;
      }
      if (bVar1 == 0) break;
      bVar1 = pbVar3[1];
      bVar5 = bVar1 < pbVar4[1];
      if (bVar1 != pbVar4[1]) goto LAB_00466009;
      pbVar3 = pbVar3 + 2;
      pbVar4 = pbVar4 + 2;
    } while (bVar1 != 0);
    in_EAX = 0;
LAB_0046600e:
    if (in_EAX == 0) {
      return 1;
    }
    puVar2 = (undefined4 *)*puVar2;
  } while( true );
}

