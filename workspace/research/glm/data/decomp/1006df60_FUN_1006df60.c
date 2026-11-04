// 1006df60 size=524 FUN_1006df60

int FUN_1006df60(int param_1,int param_2,int param_3,undefined4 param_4,int param_5,
                undefined4 param_6,undefined4 *param_7,int *param_8)

{
  byte *pbVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  int in_ECX;
  uint uVar5;
  undefined4 local_c;
  int local_8;
  
  iVar3 = param_2;
  iVar2 = param_1;
  uVar5 = 0;
  local_8 = 0;
  local_c = 0;
  if (param_7 == (undefined4 *)0x0) {
    param_7 = &local_c;
  }
  if (param_1 != 0) {
    iVar4 = *(int *)(param_1 + 4);
    if (iVar4 == 1) {
      iVar4 = FUN_1006df60(*(undefined4 *)(param_1 + 8),param_2,param_3,param_4,param_5,param_6,
                           param_7,&param_2);
      if (iVar4 < 0) {
        return iVar4;
      }
      iVar2 = FUN_1006df60(*(undefined4 *)(iVar2 + 0xc),iVar3 + param_2 * 4,param_3,param_4,param_5,
                           param_6,param_7,&param_1);
      if (iVar2 < 0) {
        return iVar2;
      }
      local_8 = param_1 + param_2;
    }
    else {
      if (iVar4 == 6) {
        iVar2 = FUN_1006df60(*(undefined4 *)(param_1 + 0x18),param_2,param_3,param_4,param_5,param_6
                             ,param_7,&local_8);
      }
      else {
        if (iVar4 == 8) {
          iVar3 = param_1;
          if (param_5 == 0) {
            do {
              if (*(int *)(iVar3 + 4) != 8) break;
              iVar3 = *(int *)(iVar3 + 0x10);
            } while (iVar3 != 0);
            if (((iVar3 != 0) && (*(int *)(iVar3 + 4) == 9)) && (*(int *)(iVar3 + 0x10) == 3)) {
              param_3 = FUN_100860e0(&DAT_1010e8dc,0x2d1,0xffffffff,4);
              param_5 = 1;
            }
          }
          if (*(int *)(iVar2 + 0x14) != 0) {
            do {
              iVar3 = FUN_1006df60(*(undefined4 *)(iVar2 + 0x10),param_2 + local_8 * 4,param_3,
                                   param_4,param_5,param_6,param_7,&param_1);
              if (iVar3 < 0) {
                return iVar3;
              }
              local_8 = local_8 + param_1;
              uVar5 = uVar5 + 1;
            } while (uVar5 < *(uint *)(iVar2 + 0x14));
          }
          goto LAB_1006e157;
        }
        if (iVar4 == 9) {
          if (*(int *)(param_1 + 0x10) == 3) {
            if (param_5 == 0) {
              param_3 = FUN_100860e0(&DAT_1010e8dc,0x2d1,0xffffffff,4);
            }
            else {
              pbVar1 = (byte *)(*(int *)(*(int *)(*(int *)(in_ECX + 8) + 0x10) + param_3 * 4) + 4);
              *pbVar1 = *pbVar1 | 0x80;
            }
          }
          iVar2 = FUN_1006c582(*(undefined4 *)(iVar2 + 0x10),*(undefined4 *)(iVar2 + 0x18),
                               *(undefined4 *)(iVar2 + 0x1c),*(undefined4 *)(iVar2 + 0x20),param_2,
                               param_3,param_7,param_6,&local_8);
        }
        else {
          if (iVar4 != 0xb) {
            FUN_1006dca1();
            goto LAB_1006e157;
          }
          iVar2 = FUN_1006eb85(*(undefined4 *)(param_1 + 0x20),param_2,param_3,param_4,param_5,
                               param_6,param_7,*(undefined4 *)(param_1 + 0x2c),
                               *(undefined4 *)(param_1 + 0x30),&local_8);
        }
      }
      if (iVar2 < 0) {
        return iVar2;
      }
    }
  }
LAB_1006e157:
  if (param_8 != (int *)0x0) {
    *param_8 = local_8;
  }
  return 0;
}


