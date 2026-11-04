// 100051e0 size=165 FUN_100051e0

undefined4 FUN_100051e0(void)

{
  uint uVar1;
  uint uVar2;
  int unaff_EDI;
  undefined4 local_4;
  
  local_4 = 6;
  uVar2 = 0;
  do {
    uVar1 = *(uint *)(unaff_EDI + *(int *)((int)&DAT_101825d8 + uVar2));
    if (((*(uint *)((int)&DAT_101825e0 + uVar2) == 0) ||
        ((*(uint *)((int)&DAT_101825e0 + uVar2) & ~uVar1) != 0)) &&
       ((*(uint *)((int)&DAT_101825dc + uVar2) == 0 ||
        ((uVar1 & *(uint *)((int)&DAT_101825dc + uVar2)) != 0)))) {
      FUN_10005150(&local_4);
    }
    uVar2 = uVar2 + 0x14;
  } while (uVar2 < 0x2d0);
  uVar2 = 0;
  do {
    uVar1 = *(uint *)(unaff_EDI + *(int *)((int)&DAT_101828a8 + uVar2));
    if ((uVar1 < *(uint *)((int)&DAT_101828ac + uVar2)) ||
       (*(uint *)((int)&DAT_101828b0 + uVar2) < uVar1)) {
      FUN_10005150(&local_4);
    }
    uVar2 = uVar2 + 0x14;
  } while (uVar2 < 0xa0);
  return local_4;
}


