// 1007dbc1 size=51 FUN_1007dbc1

int FUN_1007dbc1(int param_1,undefined4 param_2)

{
  int iVar1;
  uint uVar2;
  
  uVar2 = 0;
  if (*(int *)(param_1 + 0x18) != 0) {
    do {
      iVar1 = FUN_1007da98(param_2,0);
      if (iVar1 < 0) {
        return iVar1;
      }
      uVar2 = uVar2 + 1;
    } while (uVar2 < *(uint *)(param_1 + 0x18));
  }
  return 0;
}


