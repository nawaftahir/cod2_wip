extern unsigned int DAT_101ce694;
extern unsigned int DAT_101ce708;
extern unsigned int DAT_101d4818;
extern unsigned int DAT_101d489c;
extern int FUN_10024920();


void FUN_100249c0(int param_1)

{
  unsigned int uVar1;
  unsigned int uVar2;
  
  if ((DAT_101d4818 == 0) ||
     ((uVar2 = 1, param_1 != 1 &&
      (((*(int *)(DAT_101ce708 + 8) == 2 || (*(char *)(DAT_101ce694 + 8) == '\0')) ||
       (DAT_101d489c == 0)))))) {
    uVar2 = 7;
  }
  uVar1 = FUN_10024920();
  R_BlendSavedScreen(uVar2,uVar1,0x3f800000,0);
  return;
}


