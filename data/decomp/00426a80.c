
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

int FUN_00426a80(int param_1)

{
  int in_EAX;
  int iVar1;
  int iVar2;
  int iVar3;
  int local_3c;
  float local_38;
  float local_34;
  undefined4 local_30;
  undefined4 local_2c;
  undefined4 local_28;
  undefined4 local_24;
  float local_8;
  
  FUN_00426280(1);
  local_30 = 0;
  local_2c = 0;
  local_28 = 0;
  local_24 = 0;
  local_3c = *(int *)(in_EAX + 0x18);
  local_38 = (float)*(int *)(local_3c + 0x14) * _DAT_00556bdc;
  local_8 = (float)*(int *)(local_3c + 0x18);
  local_34 = local_8 * _DAT_00556bdc;
  iVar1 = FUN_00457ce0(&local_3c);
  FUN_00457dd0(iVar1,0);
  iVar3 = 0;
  if (0 < *(int *)(iVar1 + 0x38)) {
    iVar2 = 0;
    do {
      *(undefined4 *)(iVar2 + 0x78 + *(int *)(iVar1 + 0x3c)) = *(undefined4 *)(in_EAX + 8);
      *(undefined4 *)(iVar2 + 0x7c + *(int *)(iVar1 + 0x3c)) = *(undefined4 *)(in_EAX + 0xc);
      iVar3 = iVar3 + 1;
      iVar2 = iVar2 + 0xa8;
    } while (iVar3 < *(int *)(iVar1 + 0x38));
  }
  *(int *)(iVar1 + 0x44) = in_EAX;
  *(short *)(in_EAX + 0x382c) = *(short *)(in_EAX + 0x382c) + 1;
  *(int *)(in_EAX + 0x3828) = iVar1;
  if (param_1 != 0) {
    FUN_004671b0();
    FUN_0045a220(1);
    if ((DAT_011298b0 == 1) || (DAT_011298b0 == 2)) {
      FUN_00475350();
    }
    FUN_0047a3c0();
    *(short *)(iVar1 + 0x42) = *(short *)(iVar1 + 0x42) + 1;
  }
  return iVar1;
}

