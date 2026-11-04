extern unsigned int DAT_1072d9d0;
extern unsigned int DAT_1072d9e0;
extern int FUN_1003a8d0();
extern int FUN_1003c050();


void FUN_10030b60(int *param_1)

{
  if ((DAT_1072d9d0 != 0) || (DAT_1072d9e0 != 0)) {
    FUN_1003a8d0();
  }
  FUN_1003c050();
  *param_1 = (unsigned int)*(unsigned short *)(*param_1 + 2) + *param_1;
  return;
}


