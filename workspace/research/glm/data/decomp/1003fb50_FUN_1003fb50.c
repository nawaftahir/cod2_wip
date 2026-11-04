// 1003fb50 size=72 FUN_1003fb50

void FUN_1003fb50(void)

{
  char cVar1;
  int in_EAX;
  undefined1 local_8 [8];
  
  if ((*(uint *)(in_EAX + 4) & 0x2000) == 0) {
    FUN_1003fae0();
  }
  else {
    cVar1 = FUN_1003f930(*(undefined4 *)(in_EAX + 0x68),local_8);
    if (cVar1 != '\0') {
      FUN_1003f6c0();
      return;
    }
  }
  return;
}


