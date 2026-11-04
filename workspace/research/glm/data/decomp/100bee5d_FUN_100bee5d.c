// 100bee5d size=536 FUN_100bee5d

int FUN_100bee5d(void)

{
  int in_ECX;
  int *piVar1;
  uint uVar2;
  int iVar3;
  undefined1 local_100 [16];
  undefined4 auStack_f0 [4];
  int local_e0 [32];
  undefined1 local_60 [64];
  undefined4 local_20;
  undefined4 local_1c;
  undefined4 local_18;
  undefined4 local_14;
  int local_10;
  int local_c;
  int local_8;
  
  iVar3 = 1;
  local_8 = 0;
  local_20 = 0;
  local_1c = 1;
  local_18 = 2;
  local_14 = 3;
  if ((**(uint **)(in_ECX + 0x100) & 0xfffff) == 1) {
    iVar3 = FUN_100b99af(*(uint **)(in_ECX + 0x100),&DAT_10118b38,local_60,&local_8,local_100,
                         &local_20,1,1);
    if (((iVar3 == 1) &&
        (iVar3 = FUN_100b99af(*(undefined4 *)(in_ECX + 0x100),&DAT_10118b98,local_60,&local_8,
                              local_100,&local_20,1,1), iVar3 == 1)) &&
       (iVar3 = FUN_100b99af(*(undefined4 *)(in_ECX + 0x100),&DAT_10118bf8,local_60,&local_8,
                             local_100,&local_20,1,1), iVar3 == 1)) {
      iVar3 = FUN_100b99af(*(undefined4 *)(in_ECX + 0x100),&DAT_10118c58,local_60,&local_8,local_100
                           ,&local_20,1,1);
    }
    if (iVar3 == 0) {
      piVar1 = *(int **)(*(int *)(in_ECX + 0x100) + 8);
      local_8 = 0;
      do {
        piVar1 = piVar1 + 1;
        iVar3 = *(int *)(*(int *)(in_ECX + 0x14) + *piVar1 * 4);
        if ((((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar3 + 4) * 4) + 5) & 1) == 0)
            || (*(double *)(iVar3 + 0x20) != 0.0)) || (*(int *)(iVar3 + 8) != -1)) {
          return 1;
        }
        local_8 = local_8 + 1;
      } while (local_8 == 0);
      iVar3 = *(int *)(*(int *)(in_ECX + 0x14) + local_e0[0] * 4);
      local_8 = 0;
      if ((*(int *)(iVar3 + 8) == -1) &&
         ((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar3 + 4) * 4) + 5) & 1) != 0)) {
        local_8 = 1;
      }
      uVar2 = 0;
      do {
        *(undefined4 *)(uVar2 + *(int *)(*(int *)(in_ECX + 0x100) + 8)) =
             *(undefined4 *)((int)auStack_f0 + uVar2);
        iVar3 = *(int *)(*(int *)(in_ECX + 0x14) + *(int *)((int)local_e0 + uVar2) * 4);
        local_10 = FUN_10086139(*(undefined4 *)(iVar3 + 4),*(undefined4 *)(iVar3 + 0xc),
                                *(undefined4 *)(iVar3 + 0x10),*(undefined8 *)(iVar3 + 0x20));
        if (local_10 == -1) {
          return -0x7ff8fff2;
        }
        local_c = *(int *)(*(int *)(in_ECX + 0x14) + local_10 * 4);
        FUN_10085c65();
        if (local_8 == 0) {
          if (*(int *)(local_c + 0x38) == -1) {
            *(undefined4 *)(local_c + 0x38) = *(undefined4 *)((int)local_e0 + uVar2);
          }
          *(uint *)(local_c + 0x3c) = *(uint *)(local_c + 0x3c) ^ 0x80000;
        }
        else {
          *(double *)(local_c + 0x20) = *(double *)(local_c + 0x20) * -1.0;
        }
        *(int *)(*(int *)(*(int *)(in_ECX + 0x100) + 8) + 4 + uVar2) = local_10;
        uVar2 = uVar2 + 4;
      } while (uVar2 < 4);
      iVar3 = 0;
    }
  }
  return iVar3;
}


