// 100cab72 size=122 FUN_100cab72

int FUN_100cab72(int param_1)

{
  int iVar1;
  int *in_ECX;
  int *local_c;
  int *local_8;
  
  local_c = in_ECX;
  local_8 = in_ECX;
  iVar1 = FUN_100c98b1(0x28);
  if (-1 < iVar1) {
    iVar1 = (**(code **)(*in_ECX + 0x74))
                      (*(undefined4 *)(in_ECX[5] + **(int **)(in_ECX[0x40] + 8) * 4),&local_c,
                       &local_8);
    if (-1 < iVar1) {
      iVar1 = (**(code **)(*in_ECX + 0x68))
                        (-(uint)(param_1 != 0) & 0xd000000 | (uint)local_c,0xe40000,local_8);
      if (-1 < iVar1) {
        iVar1 = (**(code **)(*in_ECX + 0x60))();
        if (-1 < iVar1) {
          iVar1 = FUN_100c4cc4();
          if (-1 < iVar1) {
            iVar1 = 0;
          }
        }
      }
    }
  }
  return iVar1;
}


