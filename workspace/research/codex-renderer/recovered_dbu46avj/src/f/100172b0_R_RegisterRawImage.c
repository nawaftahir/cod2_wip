extern unsigned int DAT_101d1b2c;
extern int FUN_100171f0();


unsigned int R_RegisterRawImage(char *param_1,unsigned int param_2,unsigned int param_3)

{
  unsigned int uVar1;
  
  if (*param_1 == '\0') {
    return DAT_101d1b2c;
  }
  uVar1 = FUN_100171f0(param_1,param_3);
  return uVar1;
}


