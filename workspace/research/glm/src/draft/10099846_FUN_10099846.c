


unsigned int FUN_10099846(int param_1,int param_2)

{
  unsigned char bVar1;
  unsigned char bVar2;
  unsigned char bVar3;
  
  if (param_1 == param_2) {
    return 0;
  }
  switch(param_1) {
  case 1:
  case 5:
    if (param_2 < 1) {
      return 1;
    }
    bVar3 = SBORROW4(param_2,8);
    bVar2 = param_2 + -8 < 0;
    bVar1 = param_2 == 8;
    break;
  case 2:
  case 6:
    if (param_2 < 1) {
      return 1;
    }
    if (param_2 < 3) {
      return 0;
    }
    if (param_2 < 5) {
      return 1;
    }
    bVar3 = SBORROW4(param_2,6);
    bVar2 = param_2 + -6 < 0;
    bVar1 = param_2 == 6;
    break;
  case 3:
  case 7:
    if (param_2 == 1) {
      return 0;
    }
    if (param_2 == 3) {
      return 0;
    }
    param_2 = param_2 + -5;
    goto LAB_1009988e;
  case 4:
  case 8:
    if (param_2 == 1) {
      return 0;
    }
    if (param_2 < 4) {
      return 1;
    }
    if (param_2 < 6) {
      return 0;
    }
    bVar1 = param_2 == 8;
    goto LAB_100998c9;
  case 9:
    if (param_2 < 9) {
      return 1;
    }
    bVar3 = SBORROW4(param_2,0xc);
    bVar2 = param_2 + -0xc < 0;
    bVar1 = param_2 == 0xc;
    break;
  case 10:
    if (param_2 < 9) {
      return 1;
    }
    bVar3 = SBORROW4(param_2,10);
    bVar2 = param_2 + -10 < 0;
    bVar1 = param_2 == 10;
    break;
  case 0xb:
    param_2 = param_2 + -9;
LAB_1009988e:
    if (param_2 == 0) {
      return 0;
    }
    bVar1 = param_2 == 2;
    goto LAB_100998c9;
  case 0xc:
    if (param_2 == 9) {
      return 0;
    }
    bVar1 = param_2 == 0xc;
LAB_100998c9:
    if (bVar1) {
      return 0;
    }
  default:
    goto LAB_1009986e;
  }
  if (bVar1 || bVar3 != bVar2) {
    return 0;
  }
LAB_1009986e:
  return 1;
}


