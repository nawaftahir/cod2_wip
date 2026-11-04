// 100388f0 size=39 FUN_100388f0

void FUN_100388f0(void)

{
  int iVar1;
  int in_EAX;
  undefined1 *in_ECX;
  undefined4 *in_EDX;
  
  iVar1 = *(int *)(in_EAX + 8);
  if (iVar1 != 0) {
    if (iVar1 == 1) {
      *in_EDX = DAT_101d1b08;
      *in_ECX = 1;
      return;
    }
    if (iVar1 == 2) {
      *in_EDX = DAT_101d1b0c;
      *in_ECX = 1;
    }
  }
  return;
}


