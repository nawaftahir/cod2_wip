extern unsigned int DAT_1072d9d0;
extern unsigned int DAT_1072d9e0;
extern unsigned int DAT_1072debc;
extern unsigned int DAT_1072debd;
extern unsigned int DAT_10766748;
extern int FUN_1002e380();
extern int FUN_1002f430();
extern int FUN_1003a8d0();
extern int FUN_1003e9b0();


void FUN_1002f900(int *param_1)

{
  int iVar1;
  
  iVar1 = *param_1;
  *param_1 = (unsigned int)*(unsigned short *)(iVar1 + 2) + iVar1;
  if ((DAT_1072d9d0 != 0) || (DAT_1072d9e0 != 0)) {
    FUN_1003a8d0();
  }
  if (DAT_1072debd != '\0') {
    FUN_1002e380();
  }
  if (DAT_1072debc != '\0') {
    FUN_1003e9b0();
  }
  if (DAT_10766748 == '\0') {
    FUN_1002f430(*(unsigned int *)(iVar1 + 0x10),*(unsigned int *)(iVar1 + 4));
  }
  return;
}


