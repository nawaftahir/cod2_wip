
bool __thiscall FUN_004b3d30(undefined4 *param_1,byte *param_2)

{
  byte bVar1;
  byte *pbVar2;
  bool bVar3;
  
  pbVar2 = (byte *)*param_1;
  while( true ) {
    bVar1 = *pbVar2;
    bVar3 = bVar1 < *param_2;
    if (bVar1 != *param_2) break;
    if (bVar1 == 0) {
      return true;
    }
    bVar1 = pbVar2[1];
    bVar3 = bVar1 < param_2[1];
    if (bVar1 != param_2[1]) break;
    pbVar2 = pbVar2 + 2;
    param_2 = param_2 + 2;
    if (bVar1 == 0) {
      return true;
    }
  }
  return 1 - bVar3 == (uint)(bVar3 != 0);
}

