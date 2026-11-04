// 1004a720 size=96 FUN_1004a720

void FUN_1004a720(void)

{
  int in_EAX;
  int *in_ECX;
  
  if ((in_ECX[5] != 0xcf) && (in_ECX[5] != 0xcc)) {
    *(undefined4 *)(*in_ECX + 0x14) = 0x14;
    *(int *)(*in_ECX + 0x18) = in_ECX[5];
    (**(code **)*in_ECX)();
  }
  if (in_EAX < 1) {
    in_EAX = 1;
  }
  if ((*(char *)(in_ECX[0x66] + 0x11) != '\0') && (in_ECX[0x21] < in_EAX)) {
    in_EAX = in_ECX[0x21];
  }
  in_ECX[0x23] = in_EAX;
  FUN_1004a500();
  return;
}


