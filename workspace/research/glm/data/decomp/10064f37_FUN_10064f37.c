// 10064f37 size=153 FUN_10064f37

bool FUN_10064f37(byte *param_1)

{
  byte bVar1;
  int iVar2;
  byte *pbVar3;
  int iVar4;
  int in_ECX;
  undefined4 *puVar5;
  byte *pbVar6;
  bool bVar7;
  
  iVar2 = FUN_10064c94(param_1);
  puVar5 = *(undefined4 **)(in_ECX + 0x6c + iVar2 * 4);
  do {
    if (puVar5 == (undefined4 *)0x0) {
      return false;
    }
    pbVar3 = (byte *)*puVar5;
    pbVar6 = param_1;
    do {
      bVar1 = *pbVar6;
      bVar7 = bVar1 < *pbVar3;
      if (bVar1 != *pbVar3) {
LAB_10064f76:
        iVar2 = (1 - (uint)bVar7) - (uint)(bVar7 != 0);
        goto LAB_10064f7b;
      }
      if (bVar1 == 0) break;
      bVar1 = pbVar6[1];
      bVar7 = bVar1 < pbVar3[1];
      if (bVar1 != pbVar3[1]) goto LAB_10064f76;
      pbVar6 = pbVar6 + 2;
      pbVar3 = pbVar3 + 2;
    } while (bVar1 != 0);
    iVar2 = 0;
LAB_10064f7b:
    if (iVar2 < 0) {
      return false;
    }
    if (iVar2 == 0) {
      if (puVar5[4] != 0) {
        return true;
      }
      iVar2 = puVar5[2];
      puVar5[4] = 1;
      while ((iVar2 != 0 &&
             ((*(int *)(iVar2 + 0x10) != 9 ||
              (iVar4 = FUN_10064f37(*(undefined4 *)(iVar2 + 0x18)), iVar4 == 0))))) {
        iVar2 = *(int *)(iVar2 + 0xc);
      }
      puVar5[4] = 0;
      return iVar2 != 0;
    }
    puVar5 = (undefined4 *)puVar5[3];
  } while( true );
}


