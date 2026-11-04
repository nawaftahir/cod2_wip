


int FUN_1009a225(int param_1,unsigned int *param_2)

{
  int iVar1;
  unsigned int uVar2;
  int iVar3;
  unsigned int uVar4;
  
  iVar3 = 0;
  if (param_1 == 0) {
    iVar3 = 0;
  }
  else {
    iVar1 = *(int *)(param_1 + 4);
    if (iVar1 == 1) {
      do {
        if (*(int *)(param_1 + 4) != 1) break;
        iVar1 = FUN_1009a225(*(unsigned int *)(param_1 + 8),param_2 + iVar3 * 4);
        param_1 = *(int *)(param_1 + 0xc);
        iVar3 = iVar3 + iVar1;
      } while (param_1 != 0);
      if (param_1 != 0) {
        iVar1 = FUN_1009a225(param_1,param_2 + iVar3 * 4);
        iVar3 = iVar3 + iVar1;
      }
    }
    else {
      if (iVar1 == 6) {
        uVar4 = *(unsigned int *)(param_1 + 0x18);
      }
      else {
        if (iVar1 == 8) {
          uVar2 = 0;
          if (*(int *)(param_1 + 0x14) == 0) {
            return 0;
          }
          do {
            iVar1 = FUN_1009a225(*(unsigned int *)(param_1 + 0x10),param_2 + iVar3 * 4);
            iVar3 = iVar3 + iVar1;
            uVar2 = uVar2 + 1;
          } while (uVar2 < *(unsigned int *)(param_1 + 0x14));
          return iVar3;
        }
        if (iVar1 == 9) {
          iVar3 = *(int *)(param_1 + 0x1c) * *(int *)(param_1 + 0x18);
          uVar4 = 3;
          switch(*(unsigned int *)(param_1 + 0x14)) {
          case 0:
            uVar4 = 0;
            break;
          case 1:
          case 2:
          case 3:
          case 4:
            uVar4 = 1;
            break;
          case 5:
          case 6:
          case 7:
          case 8:
            uVar4 = 2;
            break;
          case 0xd:
          case 0xe:
          case 0xf:
          case 0x10:
          case 0x11:
          case 0x12:
          case 0x13:
          case 0x19:
          case 0x1a:
          case 0x1b:
          case 0x1c:
            uVar4 = 5;
            break;
          case 0x14:
          case 0x15:
          case 0x16:
          case 0x17:
          case 0x18:
          case 0x1d:
            uVar4 = 4;
          }
          for (iVar1 = iVar3; iVar1 != 0; iVar1 = iVar1 + -1) {
            *param_2 = uVar4;
            param_2 = param_2 + 4;
          }
          return iVar3;
        }
        if (iVar1 != 0xb) {
          return 0;
        }
        uVar4 = *(unsigned int *)(param_1 + 0x20);
      }
      iVar3 = FUN_1009a225(uVar4,param_2);
    }
  }
  return iVar3;
}


