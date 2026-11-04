// 100ca0b5 size=559 FUN_100ca0b5

int FUN_100ca0b5(void)

{
  int *piVar1;
  undefined4 uVar2;
  int iVar3;
  int *in_ECX;
  uint uVar4;
  undefined4 local_30;
  uint local_2c;
  undefined4 local_28;
  int *local_24;
  int *local_20;
  int *local_1c;
  int *local_18;
  undefined4 local_14;
  undefined4 local_10;
  undefined4 local_c;
  undefined4 local_8;
  
  local_2c = ((uint *)in_ECX[0x40])[3];
  uVar4 = *(uint *)in_ECX[0x40] & 0xfffff;
  FUN_100853cf(0,&local_1c);
  FUN_100853cf(1,&local_18);
  FUN_100853cf(2,&local_20);
  FUN_100853cf(3,&local_24);
  piVar1 = *(int **)(in_ECX[0x40] + 0x10);
  uVar2 = (**(code **)(*in_ECX + 0x5c))(0x5d);
  iVar3 = FUN_100c98b1(uVar2);
  if (-1 < iVar3) {
    iVar3 = (**(code **)(*in_ECX + 0x6c))
                      (*(undefined4 *)(in_ECX[5] + *piVar1 * 4),&local_8,&local_30,&local_28);
    if (-1 < iVar3) {
      iVar3 = (**(code **)(*in_ECX + 0x70))(piVar1,local_2c,&local_14,local_28);
      if (-1 < iVar3) {
        iVar3 = (**(code **)(*in_ECX + 100))(local_8,local_14,local_30);
        if (-1 < iVar3) {
          iVar3 = (**(code **)(*in_ECX + 0x74))
                            (*(undefined4 *)(in_ECX[5] + *local_18 * 4),&local_8,&local_c);
          if (-1 < iVar3) {
            iVar3 = (**(code **)(*in_ECX + 0x78))(local_18,uVar4,local_14,&local_10);
            if (-1 < iVar3) {
              iVar3 = (**(code **)(*in_ECX + 0x68))(local_8,local_10,local_c);
              if (-1 < iVar3) {
                iVar3 = (**(code **)(*in_ECX + 0x74))
                                  (*(undefined4 *)(in_ECX[5] + *local_1c * 4),&local_8,&local_c);
                if (-1 < iVar3) {
                  iVar3 = (**(code **)(*in_ECX + 0x78))(local_1c,uVar4,local_14,&local_10);
                  if (-1 < iVar3) {
                    iVar3 = (**(code **)(*in_ECX + 0x68))(local_8,local_10,local_c);
                    if (-1 < iVar3) {
                      iVar3 = (**(code **)(*in_ECX + 0x74))
                                        (*(undefined4 *)(in_ECX[5] + *local_20 * 4),&local_8,
                                         &local_c);
                      if (-1 < iVar3) {
                        iVar3 = (**(code **)(*in_ECX + 0x78))(local_20,uVar4,local_14,&local_10);
                        if (-1 < iVar3) {
                          iVar3 = (**(code **)(*in_ECX + 0x68))(local_8,local_10,local_c);
                          if (-1 < iVar3) {
                            iVar3 = (**(code **)(*in_ECX + 0x74))
                                              (*(undefined4 *)(in_ECX[5] + *local_24 * 4),&local_8,
                                               &local_c);
                            if (-1 < iVar3) {
                              iVar3 = (**(code **)(*in_ECX + 0x78))
                                                (local_24,uVar4,local_14,&local_10);
                              if (-1 < iVar3) {
                                iVar3 = (**(code **)(*in_ECX + 0x68))(local_8,local_10,local_c);
                                if (-1 < iVar3) {
                                  iVar3 = (**(code **)(*in_ECX + 0x60))();
                                  if (-1 < iVar3) {
                                    iVar3 = FUN_100c4cc4();
                                    if (-1 < iVar3) {
                                      iVar3 = 0;
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return iVar3;
}


