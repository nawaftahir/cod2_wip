
uint FUN_00465eb0(char *param_1)

{
  byte bVar1;
  undefined4 *puVar2;
  uint in_EAX;
  char *pcVar3;
  byte *pbVar4;
  byte *unaff_EBX;
  byte *pbVar5;
  bool bVar6;
  
  puVar2 = *(undefined4 **)(in_EAX + 100);
  do {
    if (puVar2 == (undefined4 *)0x0) {
      return in_EAX & 0xffffff00;
    }
    pcVar3 = _strstr((char *)puVar2[1],param_1);
    in_EAX = 0;
    if (pcVar3 != (char *)0x0) {
      pbVar4 = (byte *)puVar2[2];
      pbVar5 = unaff_EBX;
      do {
        bVar1 = *pbVar4;
        bVar6 = bVar1 < *pbVar5;
        if (bVar1 != *pbVar5) {
LAB_00465f04:
          in_EAX = (1 - (uint)bVar6) - (uint)(bVar6 != 0);
          goto LAB_00465f09;
        }
        if (bVar1 == 0) break;
        bVar1 = pbVar4[1];
        bVar6 = bVar1 < pbVar5[1];
        if (bVar1 != pbVar5[1]) goto LAB_00465f04;
        pbVar4 = pbVar4 + 2;
        pbVar5 = pbVar5 + 2;
      } while (bVar1 != 0);
      in_EAX = 0;
LAB_00465f09:
      if (in_EAX == 0) {
        return 1;
      }
    }
    puVar2 = (undefined4 *)*puVar2;
  } while( true );
}

