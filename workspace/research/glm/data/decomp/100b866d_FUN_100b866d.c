// 100b866d size=193 FUN_100b866d

undefined4 FUN_100b866d(int param_1)

{
  uint uVar1;
  int in_ECX;
  undefined4 uVar2;
  
  uVar1 = *(uint *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(param_1 + 4) * 4) + 4);
  if ((uVar1 & 0x100) == 0) {
    if (((uVar1 & 0x200) == 0) || (-1 < (char)uVar1)) {
      if ((uVar1 & 0x200) == 0) {
        if ((uVar1 & 0x10) == 0) {
          if ((uVar1 & 0x2020) == 0x2020) {
            uVar2 = 5;
          }
          else if ((uVar1 & 0x40020) == 0x40020) {
            uVar2 = 6;
          }
          else if ((uVar1 & 0x20) == 0) {
            if ((uVar1 & 1) == 0) {
              if (((uVar1 & 2) == 0) || ((uVar1 & 4) == 0)) goto LAB_100b86fd;
              uVar2 = 8;
            }
            else {
              if ((uVar1 & 2) == 0) {
LAB_100b86fd:
                if ((uVar1 & 0x10000) != 0) {
                  FUN_1008b0b5();
                }
                return 0x80004005;
              }
              uVar2 = 7;
            }
          }
          else {
            uVar2 = 4;
          }
          uVar2 = FUN_100c7b3a(uVar2);
          return uVar2;
        }
        uVar2 = 3;
      }
      else {
        uVar2 = 2;
      }
    }
    else {
      uVar2 = 9;
    }
  }
  else {
    uVar2 = 1;
  }
  uVar2 = FUN_100c7b3a(uVar2);
  return uVar2;
}


