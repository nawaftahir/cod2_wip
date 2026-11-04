// 1006ddf3 size=313 FUN_1006ddf3

int FUN_1006ddf3(int param_1,uint *param_2)

{
  int iVar1;
  int iVar2;
  int in_ECX;
  uint uVar3;
  undefined4 uVar4;
  
  uVar3 = 0;
  if (param_1 == 0) {
    iVar1 = 0;
  }
  else {
    iVar2 = *(int *)(param_1 + 4);
    iVar1 = 0;
    if (iVar2 == 1) {
      do {
        if (*(int *)(param_1 + 4) != 1) break;
        iVar2 = FUN_1006ddf3(*(undefined4 *)(param_1 + 8),param_2 + iVar1);
        param_1 = *(int *)(param_1 + 0xc);
        iVar1 = iVar1 + iVar2;
      } while (param_1 != 0);
      if (param_1 != 0) {
        iVar2 = FUN_1006ddf3(param_1,param_2 + iVar1);
        iVar1 = iVar1 + iVar2;
      }
    }
    else {
      if (iVar2 == 6) {
        uVar4 = *(undefined4 *)(param_1 + 0x18);
      }
      else {
        if (iVar2 == 8) {
          if (*(int *)(param_1 + 0x14) == 0) {
            return 0;
          }
          do {
            iVar2 = FUN_1006ddf3(*(undefined4 *)(param_1 + 0x10),param_2 + iVar1);
            iVar1 = iVar1 + iVar2;
            uVar3 = uVar3 + 1;
          } while (uVar3 < *(uint *)(param_1 + 0x14));
          return iVar1;
        }
        if (iVar2 == 9) {
          iVar1 = *(int *)(param_1 + 0x1c) * *(int *)(param_1 + 0x18);
          uVar3 = 0;
          switch(*(undefined4 *)(param_1 + 0x14)) {
          case 0:
            uVar3 = 0x17;
            break;
          case 1:
          case 5:
            uVar3 = 2;
            break;
          case 2:
          case 6:
            uVar3 = 0x2000002;
            break;
          case 3:
          case 7:
            uVar3 = 0x4000002;
            break;
          case 4:
          case 8:
            uVar3 = 0x8000002;
            break;
          case 10:
            uVar3 = 0x2000000;
            break;
          case 0xb:
            uVar3 = 0x4000000;
            break;
          case 0xc:
            uVar3 = 0x8000000;
          }
          if ((*(byte *)(in_ECX + 0x14) & 0x20) != 0) {
            uVar3 = uVar3 & 0xf3ffffff | 0x2000000;
          }
          iVar2 = iVar1;
          if (iVar1 == 0) {
            return 0;
          }
          for (; iVar2 != 0; iVar2 = iVar2 + -1) {
            *param_2 = uVar3;
            param_2 = param_2 + 1;
          }
          return iVar1;
        }
        if (iVar2 != 0xb) {
          FUN_1006dca1();
          return 0;
        }
        uVar4 = *(undefined4 *)(param_1 + 0x20);
      }
      iVar1 = FUN_1006ddf3(uVar4,param_2);
    }
  }
  return iVar1;
}


