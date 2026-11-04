// 1008b39f size=565 FUN_1008b39f

int FUN_1008b39f(int param_1,int param_2,int param_3,int param_4)

{
  int iVar1;
  int *in_ECX;
  int *piVar2;
  
  if (param_2 == 0) {
    iVar1 = -0x7fffbffb;
  }
  else {
    in_ECX[0x31] = param_2;
    in_ECX[0x32] = param_3;
    in_ECX[0x35] = 0;
    in_ECX[0x36] = 0;
    in_ECX[0x37] = 0;
    in_ECX[0x30] = param_1;
    in_ECX[0x33] = param_4;
    iVar1 = FUN_100860e0(&DAT_10110474,0,0xffffffff,4);
    in_ECX[0x1d] = iVar1;
    iVar1 = FUN_100860e0(&DAT_1010e8c0,0x311,0xffffffff,4);
    in_ECX[0x1e] = iVar1;
    iVar1 = FUN_100860e0(&DAT_1010e914,0x251,0xffffffff,4);
    in_ECX[0x1f] = iVar1;
    iVar1 = FUN_100860e0(&DAT_1010e91c,0x51,0xffffffff,4);
    in_ECX[0x20] = iVar1;
    iVar1 = FUN_100860e0(&DAT_1010e8b8,0x62,0xffffffff,4);
    in_ECX[0x21] = iVar1;
    iVar1 = FUN_100860e0(&DAT_1010e918,3,0xffffffff,4);
    in_ECX[0x22] = iVar1;
    iVar1 = FUN_100860e0(&DAT_10194f18,6,0xffffffff,4);
    in_ECX[0x23] = iVar1;
    iVar1 = FUN_100860e0(&DAT_1010e8bc,10,0xffffffff,4);
    in_ECX[0x24] = iVar1;
    iVar1 = FUN_100860e0(&DAT_1010e8dc,0x2d1,0xffffffff,4);
    in_ECX[0x25] = iVar1;
    iVar1 = FUN_100860e0(&DAT_1010e8ec,0x1003,0xffffffff,4);
    in_ECX[0x26] = iVar1;
    iVar1 = FUN_100860e0(&DAT_1010e914,0x2251,0xffffffff,4);
    in_ECX[0x27] = iVar1;
    iVar1 = FUN_100860e0(&DAT_1010e8bc,0x400a,0xffffffff,4);
    in_ECX[0x28] = iVar1;
    iVar1 = FUN_100860e0(&DAT_10110470,0xc00a,0xffffffff,4);
    in_ECX[0x29] = iVar1;
    iVar1 = FUN_100860e0(&DAT_1011046c,0x10042,0,4);
    in_ECX[0x2a] = iVar1;
    iVar1 = FUN_100860e0(&DAT_10110468,0x20003,0xffffffff,4);
    in_ECX[0x2b] = iVar1;
    iVar1 = FUN_100860e0(&DAT_1010e8ec,0x40211,0xffffffff,4);
    in_ECX[0x2c] = iVar1;
    iVar1 = FUN_100860e0(&DAT_10110464,0x2062,0xffffffff,4);
    in_ECX[0x2d] = iVar1;
    iVar1 = FUN_100860e0(&DAT_10110460,0x40062,0xffffffff,4);
    in_ECX[0x2e] = iVar1;
    if (in_ECX[1] == 0x12) {
      piVar2 = in_ECX + 10;
      for (iVar1 = 0x13; iVar1 != 0; iVar1 = iVar1 + -1) {
        *piVar2 = 0;
        piVar2 = piVar2 + 1;
      }
      iVar1 = (**(code **)(*in_ECX + 0xc))();
      if ((-1 < iVar1) && (iVar1 = FUN_10086b14(0), -1 < iVar1)) {
        iVar1 = 0;
      }
    }
    else {
      iVar1 = -0x7ff8fff2;
    }
  }
  return iVar1;
}


