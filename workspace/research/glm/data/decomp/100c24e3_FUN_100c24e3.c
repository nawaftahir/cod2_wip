// 100c24e3 size=317 FUN_100c24e3

undefined4
FUN_100c24e3(undefined4 param_1,undefined4 param_2,undefined4 param_3,undefined4 param_4,
            uint param_5,int param_6)

{
  uint uVar1;
  uint *puVar2;
  int iVar3;
  int iVar4;
  int in_ECX;
  
  if (param_5 != 0) {
    puVar2 = *(uint **)(*(int *)(in_ECX + 0x18) + -4 + param_5 * 4);
    iVar4 = FUN_10085604();
    if ((iVar4 == 0) && (uVar1 = param_5, (*puVar2 & 0xf0000000) != 0x60000000)) {
      while (uVar1 != 0) {
        uVar1 = uVar1 - 1;
        puVar2 = *(uint **)(*(int *)(in_ECX + 0x18) + uVar1 * 4);
        if ((puVar2[9] != param_5) && ((*puVar2 & 0xfff00000) != 0)) {
          if ((*puVar2 & 0xf0000000) == 0x60000000) {
            return 1;
          }
          iVar4 = FUN_10085604();
          if (iVar4 != 0) {
            return 1;
          }
          FUN_100b9ffd(param_4,puVar2,param_5);
          iVar4 = *(int *)(*(int *)(in_ECX + 0x18) + -4 + param_5 * 4);
          iVar3 = *(int *)(*(int *)(in_ECX + 0x18) + uVar1 * 4);
          if ((*(int *)(iVar4 + 0xc) != 0) && (*(int *)(iVar3 + 0xc) != 0)) {
            iVar4 = *(int *)(*(int *)(in_ECX + 0x14) + **(int **)(iVar4 + 0x10) * 4);
            iVar3 = *(int *)(*(int *)(in_ECX + 0x14) + **(int **)(iVar3 + 0x10) * 4);
            if (*(int *)(iVar4 + 0x14) != *(int *)(iVar3 + 0x14)) {
              return 1;
            }
            if (*(int *)(iVar4 + 0x18) != *(int *)(iVar3 + 0x18)) {
              return 1;
            }
            FUN_100c229a(param_5 - 1,uVar1);
            if ((((*(byte *)(in_ECX + 0x6f) & 0x10) != 0) ||
                (iVar4 = FUN_10093058(param_1,0), -1 < iVar4)) &&
               ((param_6 == 0 || (iVar4 = FUN_10093058(param_2,0), -1 < iVar4)))) {
              return 0;
            }
            FUN_100c229a(uVar1,param_5 - 1);
            FUN_100b9ffd(param_4,puVar2,param_5);
          }
        }
      }
    }
  }
  return 1;
}


