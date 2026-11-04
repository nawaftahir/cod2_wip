// 1000f350 size=37 FUN_1000f350

void FUN_1000f350(void)

{
  undefined1 *in_EAX;
  undefined1 *in_ECX;
  int in_EDX;
  
  do {
    *in_EAX = *in_ECX;
    in_EAX[1] = in_ECX[1];
    in_EAX[2] = in_ECX[2];
    in_EAX[3] = 0xff;
    in_EAX = in_EAX + 4;
    in_ECX = in_ECX + 3;
    in_EDX = in_EDX + -1;
  } while (in_EDX != 0);
  return;
}


