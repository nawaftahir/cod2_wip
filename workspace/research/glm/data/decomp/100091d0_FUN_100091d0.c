// 100091d0 size=117 FUN_100091d0

void FUN_100091d0(undefined4 param_1)

{
  char cVar1;
  int iVar2;
  undefined4 extraout_EDX;
  undefined1 local_c [12];
  
  FUN_100088c0();
  cVar1 = FUN_100063e0();
  if (cVar1 == '\0') {
    iVar2 = FUN_10008600(*(undefined4 *)(DAT_101d1b9c + 0xc),param_1,extraout_EDX,local_c);
    if (iVar2 == -1) {
      FUN_10024610(param_1);
    }
  }
  return;
}


