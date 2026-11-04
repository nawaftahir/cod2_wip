// 10041030 size=121 FUN_10041030

void FUN_10041030(void)

{
  int in_EAX;
  undefined4 local_18;
  undefined4 local_14;
  undefined4 local_10;
  undefined4 local_c;
  undefined4 local_8;
  
  local_18 = CONCAT13(*(undefined1 *)(in_EAX + 0x5b),
                      CONCAT21(CONCAT11(*(undefined1 *)(in_EAX + 0x58),
                                        *(undefined1 *)(in_EAX + 0x59)),
                               *(undefined1 *)(in_EAX + 0x5a)));
  FUN_1003f620();
  if (*(int *)(DAT_101ce708 + 8) == 2) {
    FUN_10040920();
    return;
  }
  FUN_10040580(*(undefined4 *)(in_EAX + 100),local_18,local_14,local_10,local_c,local_8);
  return;
}


