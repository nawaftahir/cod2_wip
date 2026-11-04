
undefined4 FUN_00465f20(char *param_1)

{
  byte bVar1;
  undefined4 *puVar2;
  int in_EAX;
  byte *pbVar3;
  int iVar4;
  char *pcVar5;
  byte *unaff_EBX;
  byte *pbVar6;
  bool bVar7;
  
  puVar2 = *(undefined4 **)(in_EAX + 100);
  do {
    if (puVar2 == (undefined4 *)0x0) {
      return 0;
    }
    pbVar3 = (byte *)puVar2[1];
    pbVar6 = unaff_EBX;
    do {
      bVar1 = *pbVar3;
      bVar7 = bVar1 < *pbVar6;
      if (bVar1 != *pbVar6) {
LAB_00465f59:
        iVar4 = (1 - (uint)bVar7) - (uint)(bVar7 != 0);
        goto LAB_00465f5e;
      }
      if (bVar1 == 0) break;
      bVar1 = pbVar3[1];
      bVar7 = bVar1 < pbVar6[1];
      if (bVar1 != pbVar6[1]) goto LAB_00465f59;
      pbVar3 = pbVar3 + 2;
      pbVar6 = pbVar6 + 2;
    } while (bVar1 != 0);
    iVar4 = 0;
LAB_00465f5e:
    if ((iVar4 == 0) && (pcVar5 = _strstr((char *)puVar2[2],param_1), pcVar5 != (char *)0x0)) {
      return 1;
    }
    puVar2 = (undefined4 *)*puVar2;
  } while( true );
}

