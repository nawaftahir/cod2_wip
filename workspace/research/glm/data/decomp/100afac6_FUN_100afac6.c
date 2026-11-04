// 100afac6 size=210 FUN_100afac6

int FUN_100afac6(void)

{
  int *piVar1;
  uint uVar2;
  int iVar3;
  int *in_ECX;
  undefined1 local_10 [4];
  undefined4 local_c;
  undefined4 local_8;
  
  uVar2 = *(uint *)in_ECX[0x40];
  iVar3 = FUN_100c98b1(0x42);
  if (-1 < iVar3) {
    iVar3 = (**(code **)(*in_ECX + 0x6c))
                      (*(undefined4 *)(in_ECX[5] + **(int **)(in_ECX[0x40] + 0x10) * 4),&local_8,0,0
                      );
    if (-1 < iVar3) {
      iVar3 = (**(code **)(*in_ECX + 100))(local_8,0xf0000,0);
      if (-1 < iVar3) {
        piVar1 = (int *)(*(int *)(in_ECX[0x40] + 8) + (uVar2 & 0xfffff) * 4);
        iVar3 = (**(code **)(*in_ECX + 0x74))
                          (*(undefined4 *)(in_ECX[5] + *piVar1 * 4),&local_8,&local_c);
        if (-1 < iVar3) {
          iVar3 = (**(code **)(*in_ECX + 0x78))(piVar1,uVar2 & 0xfffff,0xf0000,local_10);
          if (-1 < iVar3) {
            iVar3 = (**(code **)(*in_ECX + 0x68))(local_8,0xaf40000,local_c);
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
  return iVar3;
}


