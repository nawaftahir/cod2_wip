// 100ab063 size=125 FUN_100ab063

uint FUN_100ab063(int param_1,uint param_2,uint param_3,int param_4,int param_5,undefined4 *param_6)

{
  int iVar1;
  int iVar2;
  int iVar3;
  int in_ECX;
  uint uVar4;
  uint local_8;
  
  local_8 = 0;
  *param_6 = 0;
  for (; param_2 < param_3; param_2 = param_2 + 1) {
    iVar1 = *(int *)(param_1 + param_2 * 4);
    uVar4 = 0;
    if ((iVar1 != 0) && (*(int *)(iVar1 + 4) != 0)) {
      do {
        iVar2 = *(int *)(*(int *)(iVar1 + 8) + uVar4 * 4);
        iVar3 = *(int *)(*(int *)(in_ECX + 0x14) + iVar2 * 4);
        if ((iVar2 == param_4) || (*(int *)(iVar3 + 0x38) == param_4)) {
          *(undefined4 *)(iVar3 + 0xc) = *(undefined4 *)(param_5 + 0xc);
          *(undefined4 *)(iVar3 + 0x10) = *(undefined4 *)(param_5 + 0x10);
          *param_6 = 1;
          local_8 = param_2;
        }
        uVar4 = uVar4 + 1;
      } while (uVar4 < *(uint *)(iVar1 + 4));
    }
  }
  return local_8;
}


