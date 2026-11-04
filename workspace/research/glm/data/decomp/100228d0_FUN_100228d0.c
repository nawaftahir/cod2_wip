// 100228d0 size=100 FUN_100228d0

int * FUN_100228d0(void)

{
  int iVar1;
  undefined4 uVar2;
  int *piVar3;
  undefined1 local_4 [4];
  
  if (DAT_101d4878 != (int *)0x0) {
    (**(code **)(*DAT_101d4878 + 4))(DAT_101d4878);
    return DAT_101d4878;
  }
  piVar3 = DAT_101d1bf8;
  iVar1 = (**(code **)(*DAT_101d1bf8 + 0x74))(DAT_101d1bf8,0x80,0x80,0x4b,0,0,0,local_4,0);
  if (iVar1 < 0) {
    uVar2 = FUN_100efe3c(iVar1);
    FUN_10061cd0(0,"Couldn\'t create a %i x %i depth-stencil surface: %s\n",0x80,0x80,uVar2);
  }
  return piVar3;
}


