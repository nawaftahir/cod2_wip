// 1000d320 size=202 FUN_1000d320

/* WARNING: Function: __chkstk replaced with injection: alloca_probe */

void FUN_1000d320(undefined4 param_1)

{
  undefined1 auStack_2000 [8188];
  undefined4 uStack_4;
  
  uStack_4 = 0x1000d32a;
  if (*(int *)(DAT_101ce708 + 8) != 2) {
    FUN_1003dd70();
    do {
      (**(code **)(*(int *)DAT_101d1b14[1] + 8))((int *)DAT_101d1b14[1]);
      DAT_101d1b14[1] = 0;
    } while (DAT_1076a830 != 0);
    FUN_1000ce80(1,0,1);
    FUN_10029320(param_1,auStack_2000);
    if (*DAT_101d1b14 == 4) {
      FUN_1000ec00(DAT_101d1b14,0x32,0,auStack_2000);
      return;
    }
    FUN_1000ea20(0x32,auStack_2000);
  }
  return;
}


