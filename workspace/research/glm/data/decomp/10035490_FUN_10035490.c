// 10035490 size=187 FUN_10035490

void FUN_10035490(int *param_1)

{
  uint uVar1;
  
  uVar1 = 0;
  if (0 < *param_1) {
    do {
      if (uVar1 == 0) {
        DAT_1073055c = param_1[0x261];
      }
      else {
        DAT_1073055c = (&DAT_101d4820)[param_1[0x264 - (uVar1 & 1)] * 5];
      }
      FUN_1003ea30();
      FUN_100353c0();
      FUN_1002e850(0,0,(float)param_1[uVar1 * 0x26 + 4],(float)param_1[uVar1 * 0x26 + 5],0,0,
                   param_1[uVar1 * 0x26 + 2],param_1[uVar1 * 0x26 + 3]);
      FUN_1003a8d0();
      uVar1 = uVar1 + 1;
    } while ((int)uVar1 < *param_1);
  }
  return;
}


