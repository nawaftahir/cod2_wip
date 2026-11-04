// 10017290 size=29 R_RegisterMaterial

undefined4 R_RegisterMaterial(char *param_1,undefined4 param_2,undefined4 param_3)

{
  undefined4 uVar1;
  
  if (*param_1 == '\0') {
    return DAT_101d1b2c;
  }
  uVar1 = FUN_10017100(param_3);
  return uVar1;
}


