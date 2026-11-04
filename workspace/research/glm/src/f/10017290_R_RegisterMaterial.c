extern unsigned int DAT_101d1b2c;
extern int FUN_10017100();


unsigned int R_RegisterMaterial(char *param_1,unsigned int param_2,unsigned int param_3)

{
  unsigned int uVar1;
  
  if (*param_1 == '\0') {
    return DAT_101d1b2c;
  }
  uVar1 = FUN_10017100(param_3);
  return uVar1;
}


