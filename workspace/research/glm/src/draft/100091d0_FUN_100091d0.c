extern unsigned int DAT_101d1b9c;
extern int FUN_100063e0();
extern int FUN_10008600();
extern int FUN_100088c0();
extern int FUN_10024610();


void FUN_100091d0(unsigned int param_1)

{
  char cVar1;
  int iVar2;
  unsigned int extraout_EDX;
  unsigned char local_c [12];
  
  FUN_100088c0();
  cVar1 = FUN_100063e0();
  if (cVar1 == '\0') {
    iVar2 = FUN_10008600(*(unsigned int *)(DAT_101d1b9c + 0xc),param_1,extraout_EDX,local_c);
    if (iVar2 == -1) {
      FUN_10024610(param_1);
    }
  }
  return;
}


