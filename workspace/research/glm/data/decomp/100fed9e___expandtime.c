// 100fed9e size=614 __expandtime

/* Library Function - Single Match
    __expandtime
   
   Library: Visual Studio 2003 Release */

undefined4 __expandtime(undefined4 param_1,undefined4 param_2,undefined4 param_3,int param_4)

{
  char in_AL;
  int iVar1;
  int *in_ECX;
  int *unaff_EBX;
  undefined4 uVar2;
  
  if (in_AL < '[') {
    if (in_AL == 'Z') {
LAB_100fef8f:
      ___tzset();
LAB_100feff4:
      __store_str();
      return 1;
    }
    if (in_AL < 'N') {
      if (in_AL != 'M') {
        if (in_AL == '%') {
          *(undefined1 *)*in_ECX = 0x25;
          *in_ECX = *in_ECX + 1;
          *unaff_EBX = *unaff_EBX + -1;
          return 1;
        }
        if ((in_AL == 'A') || (in_AL == 'B')) goto LAB_100feff4;
        if ((in_AL != 'H') && (in_AL != 'I')) {
          return 1;
        }
      }
LAB_100fee66:
      __store_num(param_4);
      return 1;
    }
    if (((in_AL == 'S') || (in_AL == 'U')) || (in_AL == 'W')) goto LAB_100fee66;
    if (in_AL != 'X') {
      if (in_AL != 'Y') {
        return 1;
      }
      goto LAB_100fee66;
    }
  }
  else {
    if ('m' < in_AL) {
      if (in_AL == 'p') goto LAB_100feff4;
      if (in_AL == 'w') goto LAB_100fee66;
      if (in_AL == 'x') {
        if (param_4 == 0) {
          uVar2 = 0;
        }
        else {
          uVar2 = 1;
        }
        goto LAB_100fee7b;
      }
      if (in_AL == 'y') goto LAB_100fee66;
      if (in_AL != 'z') {
        return 1;
      }
      goto LAB_100fef8f;
    }
    if (in_AL == 'm') goto LAB_100fee66;
    if ((in_AL == 'a') || (in_AL == 'b')) goto LAB_100feff4;
    if (in_AL != 'c') {
      if ((in_AL != 'd') && (in_AL != 'j')) {
        return 1;
      }
      goto LAB_100fee66;
    }
    iVar1 = __store_winword(param_1,param_4 != 0,param_2);
    if (iVar1 == 0) {
      return 0;
    }
    if (*unaff_EBX == 0) {
      return 0;
    }
    *(undefined1 *)*in_ECX = 0x20;
    *in_ECX = *in_ECX + 1;
    *unaff_EBX = *unaff_EBX + -1;
  }
  uVar2 = 2;
LAB_100fee7b:
  iVar1 = __store_winword(param_1,uVar2,param_2);
  if (iVar1 != 0) {
    return 1;
  }
  return 0;
}


