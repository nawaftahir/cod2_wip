// 100ca848 size=463 FUN_100ca848

int FUN_100ca848(void)

{
  int iVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  int *in_ECX;
  uint uVar5;
  uint uVar6;
  undefined4 local_1c;
  undefined4 local_18;
  undefined4 local_14;
  undefined4 local_10;
  undefined4 local_c;
  uint local_8;
  
  if (in_ECX[0xd] == 0) {
    iVar2 = -0x7fffbfff;
  }
  else if (*(int *)(in_ECX[0x40] + 0xc) == 0) {
    iVar2 = 0;
  }
  else {
    iVar2 = *(int *)(in_ECX[5] + **(int **)(in_ECX[0x40] + 0x10) * 4);
    local_8 = 0;
    do {
      iVar4 = *(int *)(in_ECX[5] +
                      *(int *)(*(int *)(in_ECX[0x40] + 8) +
                              *(int *)(in_ECX[0x40] + 0xc) * local_8 * 4) * 4);
      if ((((*(int *)(iVar4 + 4) != *(int *)(iVar2 + 4)) ||
           (*(int *)(iVar4 + 8) != *(int *)(iVar2 + 8))) ||
          (*(int *)(iVar4 + 0xc) != *(int *)(iVar2 + 0xc))) ||
         (*(int *)(iVar4 + 0x10) != *(int *)(iVar2 + 0x10))) {
        iVar3 = FUN_100c98b1(1);
        if (iVar3 < 0) {
          return iVar3;
        }
        iVar3 = *(int *)(in_ECX[5] + *(int *)(iVar4 + 0x14) * 4);
        iVar1 = *(int *)(iVar3 + 0x10);
        uVar5 = *(uint *)(iVar3 + 0xc) & 0x7ff;
        uVar6 = uVar5 | 0xb0001000;
        if (iVar1 != 0) {
          if (iVar1 == 1) {
            uVar6 = uVar5 | 0xb0551000;
          }
          else if (iVar1 == 2) {
            uVar6 = uVar5 | 0xb0aa1000;
          }
          else if (iVar1 == 3) {
            uVar6 = uVar5 | 0xb0ff1000;
          }
        }
        if (*(int *)(iVar4 + 0x18) == 0) {
          uVar6 = uVar6 | 0xd000000;
        }
        iVar4 = (**(code **)(*in_ECX + 0x6c))
                          (*(undefined4 *)(in_ECX[5] + **(int **)(in_ECX[0x40] + 0x10) * 4),&local_c
                           ,0,&local_14);
        if (iVar4 < 0) {
          return iVar4;
        }
        iVar4 = (**(code **)(*in_ECX + 0x70))
                          (*(undefined4 *)(in_ECX[0x40] + 0x10),*(undefined4 *)(in_ECX[0x40] + 0xc),
                           &local_10,local_14);
        if (iVar4 < 0) {
          return iVar4;
        }
        iVar4 = (**(code **)(*in_ECX + 100))(local_c,local_10,uVar6);
        if (iVar4 < 0) {
          return iVar4;
        }
        iVar4 = (**(code **)(*in_ECX + 0x74))
                          (*(undefined4 *)
                            (in_ECX[5] +
                            *(int *)(*(int *)(in_ECX[0x40] + 8) +
                                    *(int *)(in_ECX[0x40] + 0xc) * local_8 * 4) * 4),&local_c,
                           &local_18);
        if (iVar4 < 0) {
          return iVar4;
        }
        iVar4 = *(int *)(in_ECX[0x40] + 0xc);
        iVar4 = (**(code **)(*in_ECX + 0x78))
                          (*(int *)(in_ECX[0x40] + 8) + iVar4 * local_8 * 4,iVar4,local_10,&local_1c
                          );
        if (iVar4 < 0) {
          return iVar4;
        }
        iVar4 = (**(code **)(*in_ECX + 0x68))(local_c,local_1c,local_18);
        if (iVar4 < 0) {
          return iVar4;
        }
        iVar4 = (**(code **)(*in_ECX + 0x60))();
        if (iVar4 < 0) {
          return iVar4;
        }
        iVar4 = FUN_100c4cc4();
        if (iVar4 < 0) {
          return iVar4;
        }
      }
      local_8 = local_8 + 1;
    } while (local_8 < 2);
    iVar2 = 0;
  }
  return iVar2;
}


