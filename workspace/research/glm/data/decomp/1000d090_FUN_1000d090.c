// 1000d090 size=66 FUN_1000d090

void FUN_1000d090(void)

{
  undefined1 in_AL;
  int iVar1;
  undefined2 *in_ECX;
  
  switch(in_AL) {
  default:
    *in_ECX = 0;
    return;
  case 2:
  case 5:
    iVar1 = DAT_101d0a68;
    break;
  case 3:
    iVar1 = DAT_101d0a6c;
    break;
  case 4:
    iVar1 = DAT_101d0a70;
  }
  *(undefined1 *)((int)in_ECX + 1) = 2;
  if (iVar1 < 0) {
    *(undefined1 *)in_ECX = 0;
    return;
  }
  if (3 < iVar1) {
    iVar1 = 3;
  }
  *(char *)in_ECX = (char)iVar1;
  return;
}


