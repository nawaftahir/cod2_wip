
void FUN_00465b50(undefined4 *param_1)

{
  byte bVar1;
  byte *pbVar2;
  int iVar3;
  undefined4 *puVar4;
  undefined4 uVar5;
  byte *unaff_EBX;
  byte *pbVar6;
  bool bVar7;
  
  puVar4 = (undefined4 *)*param_1;
  do {
    if (puVar4 == (undefined4 *)0x0) {
      puVar4 = (undefined4 *)FUN_004ff450(0xc);
      *puVar4 = *param_1;
      *param_1 = puVar4;
      uVar5 = FUN_0046cb10();
      puVar4[1] = uVar5;
      uVar5 = FUN_0046cb10();
      puVar4[2] = uVar5;
      return;
    }
    pbVar2 = (byte *)puVar4[1];
    pbVar6 = unaff_EBX;
    do {
      bVar1 = *pbVar2;
      bVar7 = bVar1 < *pbVar6;
      if (bVar1 != *pbVar6) {
LAB_00465b89:
        iVar3 = (1 - (uint)bVar7) - (uint)(bVar7 != 0);
        goto LAB_00465b8e;
      }
      if (bVar1 == 0) break;
      bVar1 = pbVar2[1];
      bVar7 = bVar1 < pbVar6[1];
      if (bVar1 != pbVar6[1]) goto LAB_00465b89;
      pbVar2 = pbVar2 + 2;
      pbVar6 = pbVar6 + 2;
    } while (bVar1 != 0);
    iVar3 = 0;
LAB_00465b8e:
    if (iVar3 == 0) {
      _free((void *)puVar4[2]);
      uVar5 = FUN_0046cb10();
      puVar4[2] = uVar5;
      return;
    }
    puVar4 = (undefined4 *)*puVar4;
  } while( true );
}

