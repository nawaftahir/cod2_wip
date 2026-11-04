// 100cac40 size=269 FUN_100cac40

int FUN_100cac40(void)

{
  int iVar1;
  int *in_ECX;
  undefined4 local_1c;
  undefined4 local_18;
  uint local_14;
  undefined4 local_10;
  undefined4 local_c;
  uint local_8;
  
  iVar1 = FUN_100c98b1(1);
  if (-1 < iVar1) {
    iVar1 = (**(code **)(*in_ECX + 0x6c))
                      (*(undefined4 *)(in_ECX[5] + **(int **)(in_ECX[0x40] + 0x10) * 4),&local_8,
                       &local_1c,&local_18);
    if (-1 < iVar1) {
      iVar1 = (**(code **)(*in_ECX + 0x70))
                        (*(undefined4 *)(in_ECX[0x40] + 0x10),*(undefined4 *)(in_ECX[0x40] + 0xc),
                         &local_c,local_18);
      if (-1 < iVar1) {
        iVar1 = (**(code **)(*in_ECX + 100))(local_8,local_c,local_1c);
        if (-1 < iVar1) {
          iVar1 = (**(code **)(*in_ECX + 0x74))
                            (*(undefined4 *)(in_ECX[5] + **(int **)(in_ECX[0x40] + 8) * 4),&local_8,
                             &local_10);
          if (-1 < iVar1) {
            iVar1 = (**(code **)(*in_ECX + 0x78))
                              (*(undefined4 *)(in_ECX[0x40] + 8),*(undefined4 *)(in_ECX[0x40] + 0xc)
                               ,local_c,&local_14);
            if (-1 < iVar1) {
              if ((local_8 & 0xb000000) == 0) {
                local_14 = local_14 | 0x1000000;
              }
              else {
                local_14 = local_14 | 0xc000000;
                local_8 = local_8 & 0xf4ffffff;
              }
              iVar1 = (**(code **)(*in_ECX + 0x68))(local_8,local_14,local_10);
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
        }
      }
    }
  }
  return iVar1;
}


