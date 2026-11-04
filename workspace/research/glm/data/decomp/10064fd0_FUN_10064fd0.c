// 10064fd0 size=135 FUN_10064fd0

undefined4 FUN_10064fd0(byte *param_1,undefined4 *param_2,undefined4 *param_3)

{
  byte bVar1;
  int iVar2;
  int in_ECX;
  byte *pbVar3;
  undefined4 *puVar4;
  byte *pbVar5;
  bool bVar6;
  
  iVar2 = FUN_10064f37(param_1);
  if (iVar2 == 0) {
    iVar2 = FUN_10064c94(param_1);
    for (puVar4 = *(undefined4 **)(in_ECX + 0x6c + iVar2 * 4); puVar4 != (undefined4 *)0x0;
        puVar4 = (undefined4 *)puVar4[3]) {
      pbVar3 = (byte *)*puVar4;
      pbVar5 = param_1;
      do {
        bVar1 = *pbVar5;
        bVar6 = bVar1 < *pbVar3;
        if (bVar1 != *pbVar3) {
LAB_10065020:
          iVar2 = (1 - (uint)bVar6) - (uint)(bVar6 != 0);
          goto LAB_10065025;
        }
        if (bVar1 == 0) break;
        bVar1 = pbVar5[1];
        bVar6 = bVar1 < pbVar3[1];
        if (bVar1 != pbVar3[1]) goto LAB_10065020;
        pbVar5 = pbVar5 + 2;
        pbVar3 = pbVar3 + 2;
      } while (bVar1 != 0);
      iVar2 = 0;
LAB_10065025:
      if (iVar2 < 0) {
        return 0;
      }
      if (iVar2 == 0) {
        if (param_2 != (undefined4 *)0x0) {
          *param_2 = puVar4[1];
        }
        if (param_3 != (undefined4 *)0x0) {
          *param_3 = puVar4[2];
        }
        return 1;
      }
    }
  }
  return 0;
}


