
void __thiscall FUN_004bfcd0(int *param_1,byte *param_2,undefined4 param_3)

{
  int iVar1;
  int iVar2;
  byte *pbVar3;
  bool bVar4;
  bool bVar5;
  
  iVar2 = 3;
  bVar4 = false;
  iVar1 = 0;
  bVar5 = true;
  pbVar3 = &DAT_00528f98;
  do {
    if (iVar2 == 0) break;
    iVar2 = iVar2 + -1;
    bVar4 = *param_2 < *pbVar3;
    bVar5 = *param_2 == *pbVar3;
    param_2 = param_2 + 1;
    pbVar3 = pbVar3 + 1;
  } while (bVar5);
  if (!bVar5) {
    iVar1 = (1 - (uint)bVar4) - (uint)(bVar4 != 0);
  }
  (**(code **)(*param_1 + 0x34))(iVar1 == 0,param_3);
  return;
}

