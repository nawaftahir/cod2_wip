// 1008974a size=128 FUN_1008974a

void FUN_1008974a(undefined4 param_1,undefined4 param_2,int *param_3,uint param_4)

{
  int iVar1;
  int iVar2;
  int iVar3;
  int in_ECX;
  uint uVar4;
  
  iVar3 = param_4;
  FUN_100896fc(param_1,param_2,param_4);
  param_4 = 0;
  if (*(int *)(in_ECX + 0xc) != 0) {
    do {
      iVar1 = *(int *)(*(int *)(in_ECX + 0x18) + param_4 * 4);
      uVar4 = 0;
      if ((*(int *)(iVar1 + 0x24) == 0) && (*(int *)(iVar1 + 0x14) != 0)) {
        do {
          iVar2 = *(int *)(*(int *)(in_ECX + 0x18) +
                          *(int *)(*(int *)(iVar1 + 0x18) + uVar4 * 4) * 4);
          if (iVar3 == *(int *)(iVar1 + 0x38)) {
            if (*(int *)(iVar2 + 0x24) != 0) {
              *param_3 = *param_3 + -0x10000;
            }
          }
          else if (iVar3 == *(int *)(iVar2 + 0x38)) {
            *param_3 = *param_3 + 0x10000;
          }
          uVar4 = uVar4 + 1;
        } while (uVar4 < *(uint *)(iVar1 + 0x14));
      }
      param_4 = param_4 + 1;
    } while (param_4 < *(uint *)(in_ECX + 0xc));
  }
  return;
}


