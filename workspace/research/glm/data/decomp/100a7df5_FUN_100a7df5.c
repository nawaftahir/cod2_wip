// 100a7df5 size=107 FUN_100a7df5

undefined4 FUN_100a7df5(int *param_1,short param_2)

{
  undefined4 uVar1;
  uint uVar2;
  uint uVar3;
  
  uVar2 = 0;
  if ((((*param_1 == 0) && (param_1[1] == 1)) && (param_1[2] == 2)) &&
     ((param_1[3] == -1 || (param_1[3] == 3)))) {
LAB_100a7e54:
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
        if (3 < uVar2) goto LAB_100a7e54;
        if ((param_1[uVar2] != 0xffffffff) && ((uint)param_1[uVar2] < (uint)param_1[uVar3])) break;
        uVar2 = uVar2 + 1;
      } while( true );
    }
    uVar1 = 0;
  }
  return uVar1;
}


