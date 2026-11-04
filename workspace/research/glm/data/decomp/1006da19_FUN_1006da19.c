// 1006da19 size=284 FUN_1006da19

int FUN_1006da19(int param_1,undefined4 *param_2)

{
  int iVar1;
  int iVar2;
  int iVar3;
  int in_ECX;
  uint uVar4;
  undefined1 local_20 [4];
  uint local_1c;
  int local_14;
  undefined4 local_10;
  int local_c;
  uint local_8;
  
  local_14 = 0;
  local_8 = 0xffffffff;
  local_10 = 0;
  iVar1 = *(int *)(in_ECX + 4);
  if ((iVar1 == 0) || (*(int *)(iVar1 + 4) != 4)) {
    local_14 = 0;
  }
  else {
    for (local_c = *(int *)(iVar1 + 0x1c); local_c != 0; local_c = *(int *)(local_c + 0xc)) {
      iVar1 = *(int *)(local_c + 8);
      if ((((iVar1 != 0) && (*(int *)(iVar1 + 4) == 6)) && (*(int *)(iVar1 + 0x10) == 2)) &&
         (param_1 != 0)) {
        iVar2 = param_1;
        do {
          if (*(int *)(iVar1 + 0x24) == *(int *)(*(int *)(iVar2 + 8) + 0x18)) break;
          iVar2 = *(int *)(iVar2 + 0xc);
        } while (iVar2 != 0);
        if ((iVar2 != 0) && (iVar2 = *(int *)(iVar1 + 0x18), *(int *)(iVar2 + 0x3c) != 0)) {
          uVar4 = 0;
          if ((*(int *)(iVar2 + 0x1c) != 0) &&
             (iVar3 = FUN_10063776(*(undefined4 *)(*(int *)(iVar2 + 0x1c) + 0x18),0,local_20),
             uVar4 = local_1c, iVar3 < 0)) {
            uVar4 = 0xffffffff;
          }
          if (((((uVar4 & 0xffff0000) == 0) ||
               ((uVar4 & 0xffff0000) == (*(uint *)(in_ECX + 0x10) & 0xffff0000))) &&
              (((uVar4 & 0xffff) == 0 || ((uVar4 & 0xffff) == (*(uint *)(in_ECX + 0x10) & 0xffff))))
              ) && ((local_8 == 0xffffffff || (local_8 < uVar4)))) {
            local_10 = *(undefined4 *)(*(int *)(iVar1 + 0x14) + 0x18);
            local_14 = iVar2;
            local_8 = uVar4;
          }
        }
      }
    }
    if (param_2 != (undefined4 *)0x0) {
      *param_2 = local_10;
    }
  }
  return local_14;
}


