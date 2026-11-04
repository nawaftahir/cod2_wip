


unsigned int FUN_100a7e60(int *param_1,short param_2)

{
  unsigned int uVar1;
  unsigned int uVar2;
  unsigned int uVar3;
  
  uVar2 = 0;
  if ((((*param_1 == 0) && (param_1[1] == 0)) && (param_1[2] == 0)) &&
     ((param_1[3] == -1 || (param_1[3] == 0)))) {
LAB_100a7ebc:
    uVar1 = 1;
  }
  else {
    if (param_2 == 0x104) {
      do {
        uVar3 = uVar2;
        if (param_1[uVar2] != -1) break;
        uVar2 = uVar2 + 1;
        uVar3 = uVar2;
      } while (uVar2 < 4);
      do {
        if (3 < uVar2) goto LAB_100a7ebc;
        if ((param_1[uVar2] != 0xffffffff) && ((unsigned int)param_1[uVar2] < (unsigned int)param_1[uVar3])) break;
        uVar2 = uVar2 + 1;
      } while( true );
    }
    uVar1 = 0;
  }
  return uVar1;
}


