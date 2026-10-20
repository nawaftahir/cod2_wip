
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00470ef0(float param_1,char param_2,char param_3)

{
  int in_EAX;
  int local_3c;
  float local_38;
  float local_34;
  float local_30;
  float local_28;
  float local_24;
  float local_20;
  int local_1c;
  undefined4 local_18;
  undefined4 local_14;
  undefined4 local_10;
  int local_c;
  float local_8;
  
  if (param_1 != _DAT_00556a70) {
    if (param_3 == '\0') {
      FUN_00470c50();
    }
    else {
      local_18 = DAT_0109fdfc;
      local_14 = DAT_0109fe00;
      local_10 = DAT_0109fe04;
    }
    FUN_004897c0(-param_1,&local_8,&local_c);
    FUN_00485040();
    if (in_EAX == 0) {
      local_28 = -local_8;
      local_20 = local_8;
      local_1c = local_c;
    }
    else if (in_EAX == 1) {
      local_24 = -local_8;
      local_3c = local_c;
      local_34 = local_8;
      local_1c = local_c;
    }
    else if (in_EAX == 2) {
      local_38 = -local_8;
      local_3c = local_c;
      local_30 = local_8;
    }
    FUN_00470ce0(&local_18,&local_3c,param_3 == '\0');
    if (param_2 != '\0') {
      DAT_0123348c = 0xffffffff;
    }
  }
  return;
}

