// 100cb270 size=217 FUN_100cb270

/* WARNING: Type propagation algorithm not settling */

void FUN_100cb270(undefined4 param_1,uint param_2)

{
  uint *puVar1;
  int in_ECX;
  int iVar2;
  uint uVar3;
  int local_24 [4];
  uint local_14;
  int local_10;
  uint local_c;
  int *local_8;
  
  puVar1 = *(uint **)(in_ECX + 0x100);
  local_14 = puVar1[3];
  local_24[3] = puVar1[4];
  uVar3 = *puVar1 & 0xfffff;
  FUN_100853cf(0,local_24);
  FUN_100853cf(1,local_24 + 1);
  FUN_100853cf(2,local_24 + 2);
  local_10 = 0;
  if (param_2 != 0) {
    param_2 = 0;
    do {
      if (local_10 != 0) break;
      if (((int *)local_24[param_2] != (int *)0x0) && (local_c = 0, uVar3 != 0)) {
        iVar2 = 0;
        local_8 = (int *)local_24[param_2];
        do {
          if ((*(byte *)(iVar2 + 3 + *(int *)(*(int *)(in_ECX + 0x14) + *local_8 * 4)) & 1) != 0) {
            local_10 = 1;
            break;
          }
          local_c = local_c + 1;
          local_8 = local_8 + 1;
          iVar2 = iVar2 + 0x80;
        } while (local_c < uVar3);
      }
      param_2 = param_2 + 1;
    } while (param_2 < 3);
  }
  FUN_100c9a7f(param_1,local_24[3],local_14,local_24[0],local_24[1],local_24[2],uVar3,0,0,0,local_10
              );
  return;
}


