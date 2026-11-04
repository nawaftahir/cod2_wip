// 10022830 size=145 FUN_10022830

int * FUN_10022830(void)

{
  int iVar1;
  undefined4 uVar2;
  undefined4 local_8;
  undefined4 local_4;
  
  if (DAT_101d4924 == (int *)0x0) {
    if (DAT_101d4814 == 0) {
      DAT_101d4924 = DAT_101d4828;
      if (DAT_101d4828 != (int *)0x0) goto LAB_10022853;
    }
    FUN_100227c0(&local_4,&local_8);
    iVar1 = (**(code **)(*DAT_101d1bf8 + 0x74))
                      (DAT_101d1bf8,local_4,local_8,0x4b,0,0,0,&DAT_101d4924,0);
    if (iVar1 < 0) {
      uVar2 = FUN_100efe3c(iVar1);
      FUN_10061cd0(0,"Couldn\'t create a %i x %i depth-stencil surface: %s\n",local_4,local_8,uVar2)
      ;
    }
    return DAT_101d4924;
  }
LAB_10022853:
  (**(code **)(*DAT_101d4924 + 4))(DAT_101d4924);
  return DAT_101d4924;
}


