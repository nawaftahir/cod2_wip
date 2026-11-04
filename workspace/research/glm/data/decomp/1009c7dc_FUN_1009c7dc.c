// 1009c7dc size=218 FUN_1009c7dc

int FUN_1009c7dc(int param_1)

{
  int iVar1;
  int iVar2;
  int iVar3;
  int in_ECX;
  
  iVar1 = FUN_1006506e(0x50);
  if (iVar1 == 0) {
    iVar1 = 0;
  }
  else {
    iVar1 = FUN_10083255(0,0,0,0,1,in_ECX + 0x20);
  }
  if (iVar1 != 0) {
    iVar2 = FUN_1006506e(0x24);
    if (iVar2 == 0) {
      iVar2 = 0;
    }
    else {
      iVar2 = FUN_10082e36(3,0x1d,1,1,0x200);
    }
    *(int *)(iVar1 + 0x10) = iVar2;
    if (iVar2 != 0) {
      iVar2 = FUN_1006506e(0x40);
      if (iVar2 == 0) {
        iVar2 = 0;
      }
      else {
        iVar2 = FUN_1008340d(4,0,in_ECX + 0x20);
      }
      if (iVar2 != 0) {
        *(int *)(iVar1 + 0x20) = iVar2;
        if (param_1 != 0) {
          iVar3 = FUN_10082816(param_1);
          *(int *)(iVar2 + 0x18) = iVar3;
          if (iVar3 == 0) {
            return 0;
          }
        }
        iVar2 = FUN_1006506e(0x14);
        if (iVar2 == 0) {
          iVar2 = 0;
        }
        else {
          iVar2 = FUN_10082872(*(undefined4 *)(iVar1 + 0x20),0,"Value");
        }
        if (iVar2 != 0) {
          *(int *)(iVar1 + 0x20) = iVar2;
          FUN_1009a568(iVar1);
          return iVar1;
        }
      }
    }
  }
  return 0;
}


