// 100686c0 size=451 FUN_100686c0

undefined4 FUN_100686c0(int param_1,undefined4 *param_2)

{
  char cVar1;
  char *pcVar2;
  int iVar3;
  int *in_ECX;
  int iVar4;
  
  in_ECX[10] = param_1;
  param_2[4] = in_ECX[6];
  iVar4 = 0;
  param_2[5] = in_ECX[7];
  iVar3 = FUN_10067fa7();
  if (iVar3 != 0) {
    *param_2 = 0xc;
    goto LAB_10068870;
  }
  param_2[4] = in_ECX[6];
  param_2[5] = in_ECX[7];
  pcVar2 = (char *)*in_ECX;
  if ((char *)in_ECX[1] <= pcVar2) {
    *param_2 = 0xd;
    goto LAB_10068870;
  }
  cVar1 = *pcVar2;
  if (((cVar1 < '0') || ('9' < cVar1)) && (cVar1 != '.')) {
    if (cVar1 == '\'') {
      iVar4 = FUN_10068533(pcVar2,param_2 + 2);
      if (iVar4 != 0) {
        *param_2 = 2;
        goto LAB_10068870;
      }
    }
    else if (cVar1 == '\"') {
      iVar4 = FUN_10068576(pcVar2,param_2 + 2);
      if (iVar4 != 0) {
        *param_2 = 10;
        goto LAB_10068870;
      }
    }
    else if (((*(byte *)(in_ECX + 10) & 4) == 0) || (cVar1 != '<')) {
      iVar3 = _isalpha((int)cVar1);
      if ((iVar3 != 0) || (*(char *)*in_ECX == '_')) {
        if (((*(byte *)(in_ECX + 10) & 2) != 0) &&
           (iVar4 = FUN_1006842e(*in_ECX,param_2 + 2), iVar4 != 0)) {
          *param_2 = 0;
          goto LAB_10068870;
        }
        iVar4 = FUN_1006796f(*in_ECX,param_2 + 2);
        if (iVar4 != 0) {
          *param_2 = 9;
          goto LAB_10068870;
        }
      }
    }
    else {
      iVar4 = FUN_10068576(pcVar2,param_2 + 2);
      if (iVar4 != 0) {
        *param_2 = 0xb;
        goto LAB_10068870;
      }
    }
LAB_1006885b:
    iVar4 = FUN_100679f3(*in_ECX,param_2 + 2);
    *param_2 = 1;
  }
  else {
    iVar4 = FUN_100677e4(pcVar2,param_2 + 2);
    if (iVar4 == 0) {
      iVar4 = FUN_100680d0(*in_ECX,param_2 + 2);
      if (((iVar4 == 0) && (iVar4 = FUN_10068174(*in_ECX,param_2 + 2), iVar4 == 0)) &&
         (iVar4 = FUN_100681f2(*in_ECX,param_2 + 2), iVar4 == 0)) goto LAB_1006885b;
      *param_2 = 2;
      iVar3 = FUN_10067b4b(*in_ECX + iVar4,param_2);
    }
    else {
      *param_2 = 5;
      iVar3 = FUN_10067b01(*in_ECX + iVar4,param_2);
    }
    iVar4 = iVar4 + iVar3;
  }
LAB_10068870:
  param_2[6] = *in_ECX;
  param_2[7] = iVar4;
  *in_ECX = *in_ECX + iVar4;
  return 0;
}


