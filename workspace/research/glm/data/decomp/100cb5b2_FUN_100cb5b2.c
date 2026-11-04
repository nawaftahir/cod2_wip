// 100cb5b2 size=132 FUN_100cb5b2

int FUN_100cb5b2(void)

{
  int iVar1;
  int *in_ECX;
  int *local_c;
  undefined4 local_8;
  
  local_c = in_ECX;
  iVar1 = FUN_100c98b1(0x1b);
  if (-1 < iVar1) {
    local_8 = 0;
    iVar1 = (**(code **)(*in_ECX + 0x68))(0xf0000800,0xe40000,0);
    if ((((-1 < iVar1) &&
         (iVar1 = (**(code **)(*in_ECX + 0x74))
                            (*(undefined4 *)(in_ECX[5] + **(int **)(in_ECX[0x40] + 8) * 4),&local_8,
                             &local_c), -1 < iVar1)) &&
        (iVar1 = (**(code **)(*in_ECX + 0x68))(local_8,0xe40000,local_c), -1 < iVar1)) &&
       ((iVar1 = (**(code **)(*in_ECX + 0x60))(), -1 < iVar1 && (iVar1 = FUN_100c4cc4(), -1 < iVar1)
        ))) {
      iVar1 = 0;
    }
  }
  return iVar1;
}


