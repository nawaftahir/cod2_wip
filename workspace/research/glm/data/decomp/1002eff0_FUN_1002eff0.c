// 1002eff0 size=204 FUN_1002eff0

void FUN_1002eff0(int *param_1)

{
  int iVar1;
  int iVar2;
  undefined4 *puVar3;
  undefined4 local_80 [15];
  undefined4 local_44;
  undefined4 local_40;
  undefined4 local_3c;
  undefined4 local_2c;
  undefined4 local_28;
  undefined4 local_1c;
  undefined4 local_18;
  undefined4 local_10;
  
  iVar1 = *param_1;
  if (DAT_1072debd != '\0') {
    FUN_1002e380();
  }
  if ((DAT_1072d9bc != *(int *)(iVar1 + 4)) || (DAT_1072d9c0 != 3)) {
    if ((DAT_1072d9d0 != 0) || (DAT_1072d9e0 != 0)) {
      FUN_1003a8d0();
    }
    FUN_1003a5f0(0x1f);
  }
  local_3c = *(undefined4 *)(iVar1 + 0x14);
  puVar3 = local_80;
  for (iVar2 = 0x1d; iVar2 != 0; iVar2 = iVar2 + -1) {
    *puVar3 = 0;
    puVar3 = puVar3 + 1;
  }
  local_44 = *(undefined4 *)(iVar1 + 0xc);
  local_40 = *(undefined4 *)(iVar1 + 0x10);
  local_2c = *(undefined4 *)(iVar1 + 4);
  local_1c = *(undefined4 *)(iVar1 + 0x18);
  local_80[1] = *(undefined4 *)(iVar1 + 0x20);
  local_10 = *(undefined4 *)(iVar1 + 0x1c);
  local_28 = *(undefined4 *)(iVar1 + 8);
  local_80[0] = 4;
  local_18 = local_1c;
  FUN_100410b0();
  *param_1 = (uint)*(ushort *)(*param_1 + 2) + *param_1;
  return;
}


