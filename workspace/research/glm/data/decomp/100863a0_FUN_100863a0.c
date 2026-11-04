// 100863a0 size=210 FUN_100863a0

undefined4 FUN_100863a0(int param_1)

{
  void *pvVar1;
  int iVar2;
  int in_ECX;
  uint uVar3;
  
  uVar3 = 0;
  *(undefined4 *)(in_ECX + 4) = 0;
  iVar2 = *(int *)(param_1 + 4);
  *(int *)(in_ECX + 0x1c) = iVar2;
  pvVar1 = operator_new(iVar2 << 2);
  *(void **)(in_ECX + 0x10) = pvVar1;
  if (pvVar1 != (void *)0x0) {
    if (*(int *)(param_1 + 4) != 0) {
      do {
        iVar2 = FUN_100861f0(*(undefined4 *)(*(int *)(param_1 + 0x10) + uVar3 * 4));
        if (iVar2 == -1) {
          return 0x8007000e;
        }
        uVar3 = uVar3 + 1;
      } while (uVar3 < *(uint *)(param_1 + 4));
    }
    *(undefined4 *)(in_ECX + 8) = 0;
    iVar2 = *(int *)(param_1 + 8);
    *(int *)(in_ECX + 0x20) = iVar2;
    pvVar1 = operator_new(iVar2 << 2);
    uVar3 = 0;
    *(void **)(in_ECX + 0x14) = pvVar1;
    if (pvVar1 != (void *)0x0) {
      if (*(int *)(param_1 + 8) != 0) {
        do {
          iVar2 = FUN_10086240(*(undefined4 *)(*(int *)(param_1 + 0x14) + uVar3 * 4));
          if (iVar2 == -1) {
            return 0x8007000e;
          }
          uVar3 = uVar3 + 1;
        } while (uVar3 < *(uint *)(param_1 + 8));
      }
      *(undefined4 *)(in_ECX + 0xc) = 0;
      iVar2 = *(int *)(param_1 + 0xc);
      *(int *)(in_ECX + 0x24) = iVar2;
      pvVar1 = operator_new(iVar2 << 2);
      uVar3 = 0;
      *(void **)(in_ECX + 0x18) = pvVar1;
      if (pvVar1 != (void *)0x0) {
        if (*(int *)(param_1 + 0xc) != 0) {
          do {
            iVar2 = FUN_10086292(*(undefined4 *)(*(int *)(param_1 + 0x18) + uVar3 * 4));
            if (iVar2 == -1) {
              return 0x8007000e;
            }
            uVar3 = uVar3 + 1;
          } while (uVar3 < *(uint *)(param_1 + 0xc));
        }
        return 0;
      }
    }
  }
  return 0x8007000e;
}


