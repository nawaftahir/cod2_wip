// 100172b0 size=30 R_RegisterRawImage

undefined4 R_RegisterRawImage(char *param_1,undefined4 param_2,undefined4 param_3)

{
  undefined4 uVar1;
  
  if (*param_1 == '\0') {
    return DAT_101d1b2c;
  }
  uVar1 = FUN_100171f0(param_1,param_3);
  return uVar1;
}


