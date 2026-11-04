// 1009e7b8 size=263 FUN_1009e7b8

int FUN_1009e7b8(int param_1,int param_2)

{
  int iVar1;
  int iVar2;
  undefined4 uVar3;
  int iVar4;
  int in_ECX;
  int local_8;
  
  local_8 = 0;
  if (((param_1 != 0) && (*(int *)(param_1 + 4) == 3)) &&
     ((param_1 = param_1 + 0x10, iVar4 = param_2, param_2 != 0 ||
      (iVar1 = FUN_1009e0fb(1,param_1,0,0,*(undefined4 *)(in_ECX + 0x10),1,&local_8,0),
      iVar4 = local_8, iVar1 == 0)))) {
    iVar1 = FUN_1006506e(0x50);
    if (iVar1 == 0) {
      iVar1 = 0;
    }
    else {
      iVar1 = FUN_10083255(0,0,0,0,1,param_1);
    }
    if (iVar1 != 0) {
      if (*(int *)(iVar4 + 0x24) == 0) {
        iVar2 = FUN_1006506e(0x40);
        if (iVar2 == 0) {
          iVar2 = 0;
        }
        else {
          iVar2 = FUN_1008347d(6,*(undefined4 *)(iVar4 + 0x10),*(undefined4 *)(iVar4 + 0x14),param_1
                              );
        }
      }
      else {
        iVar2 = (**(code **)(**(int **)(iVar4 + 0x24) + 4))();
      }
      *(int *)(iVar1 + 0x20) = iVar2;
      if (iVar2 != 0) {
        uVar3 = FUN_10082816(*(undefined4 *)(iVar4 + 0x20));
        *(undefined4 *)(iVar1 + 0x10) = uVar3;
        if (param_2 != 0) {
          FUN_1009991f(uVar3,0);
        }
        iVar4 = FUN_1006506e(0x14);
        if (iVar4 == 0) {
          iVar4 = 0;
        }
        else {
          iVar4 = FUN_10082872(*(undefined4 *)(iVar1 + 0x20),0,"Value");
        }
        if (iVar4 != 0) {
          *(int *)(iVar1 + 0x20) = iVar4;
          FUN_1009a568(iVar1);
          return iVar1;
        }
      }
    }
  }
  return 0;
}


