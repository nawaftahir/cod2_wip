extern unsigned int DAT_10193500;
extern unsigned int DAT_101ce708;
extern unsigned int DAT_101d1b08;
extern unsigned int DAT_101d1b0c;
extern unsigned int DAT_101d1b10;
extern unsigned int DAT_101d1b14;
extern unsigned int DAT_101d1b18;
extern unsigned int DAT_101d1ba4;
extern int FUN_1000d140();
extern int FUN_1000d200();
extern int FUN_100108a0();
extern int FUN_100138c0();


/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_1000d560(void)

{
  int iVar1;
  
  iVar1 = FUN_1000d140();
  if (iVar1 == 0) {
    iVar1 = FUN_100108a0();
    if (iVar1 == 0) {
      FUN_100138c0(1,"failed to load image \'%s\'","$white");
    }
  }
  DAT_101d1b08 = iVar1;
  iVar1 = FUN_1000d140();
  if (iVar1 == 0) {
    iVar1 = FUN_100108a0();
    if (iVar1 == 0) {
      FUN_100138c0(1,"failed to load image \'%s\'",&DAT_10193500);
    }
  }
  DAT_101d1b0c = iVar1;
  if (*(int *)(DAT_101ce708 + 8) == 2) {
    DAT_101d1ba4 = FUN_1000d200(1);
    return;
  }
  DAT_101d1b10 = FUN_1000d200(1);
  DAT_101d1b14 = FUN_1000d200(1);
  _DAT_101d1b1c = FUN_1000d200(1);
  _DAT_101d1b20 = FUN_1000d200(1);
  DAT_101d1b18 = FUN_1000d200(1);
  return;
}


