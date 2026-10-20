
/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

void FUN_0044ad80(int param_1)

{
  int iVar1;
  int iVar2;
  undefined4 local_58;
  undefined4 local_54;
  undefined4 local_50;
  undefined4 local_4c;
  int local_48 [4];
  int local_38 [4];
  int local_28 [4];
  int local_18 [4];
  undefined4 local_8;
  
  local_8 = DAT_0058ea68;
  iVar1 = *(int *)(param_1 + 0xf4);
  local_58 = 0x3e4ccccd;
  local_50 = 0x3e4ccccd;
  iVar2 = (iVar1 != 2) + 1;
  local_54 = 0x3f666666;
  local_4c = 0x3f4ccccd;
  (*DAT_0059c468)(&local_58,&param_1);
  local_48[0] = DAT_0109fdd4;
  local_48[2] = DAT_0109fddc;
  local_38[0] = DAT_0109fdd4;
  local_38[2] = DAT_0109fddc;
  local_28[0] = DAT_0109fdd4;
  local_28[2] = DAT_0109fddc;
  local_18[0] = DAT_0109fdd4;
  local_18[2] = DAT_0109fddc;
  local_48[1] = DAT_0109fdd8;
  local_38[1] = DAT_0109fdd8;
  local_28[1] = DAT_0109fdd8;
  local_18[1] = DAT_0109fdd8;
  local_48[iVar1 == 0] = -0x38000000;
  local_38[iVar1 == 0] = 0x48000000;
  local_18[iVar2] = 0x48000000;
  local_28[iVar2] = -0x38000000;
  local_48[3] = param_1;
  local_38[3] = param_1;
  local_28[3] = param_1;
  local_18[3] = param_1;
  (*DAT_0059c460)(2,1,local_48);
  return;
}

