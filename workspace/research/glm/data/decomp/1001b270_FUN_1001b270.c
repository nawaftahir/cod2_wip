// 1001b270 size=137 FUN_1001b270

bool FUN_1001b270(undefined4 param_1)

{
  char cVar1;
  int iVar2;
  
  cVar1 = FUN_100183c0();
  if (cVar1 != '\0') {
    iVar2 = FUN_1005faf0(&DAT_10195640,1);
    if (iVar2 != 0) {
      iVar2 = FUN_1005faf0(param_1,1);
      if (iVar2 != 0) {
        iVar2 = FUN_1005faf0(&DAT_1019563c,1);
        if (iVar2 != 0) {
          cVar1 = FUN_1001afc0();
          if (cVar1 != '\0') {
            iVar2 = FUN_1005faf0(&DAT_10195820,1);
            return iVar2 != 0;
          }
        }
      }
    }
  }
  return false;
}


