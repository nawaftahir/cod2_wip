
undefined1 * __fastcall FUN_00464bb0(undefined4 param_1,byte *param_2)

{
  byte bVar1;
  undefined4 *puVar2;
  undefined4 *in_EAX;
  byte *pbVar3;
  int iVar4;
  byte *pbVar5;
  bool bVar6;
  
  puVar2 = (undefined4 *)*in_EAX;
  do {
    if (puVar2 == (undefined4 *)0x0) {
      return &DAT_0053d753;
    }
    pbVar3 = (byte *)puVar2[1];
    pbVar5 = param_2;
    do {
      bVar1 = *pbVar3;
      bVar6 = bVar1 < *pbVar5;
      if (bVar1 != *pbVar5) {
LAB_00464be9:
        iVar4 = (1 - (uint)bVar6) - (uint)(bVar6 != 0);
        goto LAB_00464bee;
      }
      if (bVar1 == 0) break;
      bVar1 = pbVar3[1];
      bVar6 = bVar1 < pbVar5[1];
      if (bVar1 != pbVar5[1]) goto LAB_00464be9;
      pbVar3 = pbVar3 + 2;
      pbVar5 = pbVar5 + 2;
    } while (bVar1 != 0);
    iVar4 = 0;
LAB_00464bee:
    if (iVar4 == 0) {
      return (undefined1 *)puVar2[2];
    }
    puVar2 = (undefined4 *)*puVar2;
  } while( true );
}

