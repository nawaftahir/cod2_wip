// 100a2010 size=456 FUN_100a2010

int FUN_100a2010(int param_1,int param_2,undefined4 param_3,int param_4)

{
  int iVar1;
  int iVar2;
  undefined1 local_1c [4];
  uint local_18;
  int local_10;
  undefined4 local_c;
  int local_8;
  
  if ((param_1 != 0) && (param_2 != 0)) {
    iVar2 = param_1 + 0x10;
    local_10 = iVar2;
    iVar1 = FUN_10063776(*(undefined4 *)(param_1 + 0x18),2,local_1c);
    if (iVar1 < 0) {
      FUN_100994dd(local_c,iVar2,0xbe1,"unsupported compiler target \'%s\'",
                   *(undefined4 *)(param_1 + 0x18));
    }
    else {
      if ((local_18 & 0xffff0000) == 0xfffe0000) {
        param_4 = (uint)(param_4 != 0) * 2 + 0x1a;
      }
      else if ((local_18 & 0xffff0000) == 0xffff0000) {
        param_4 = (uint)(param_4 != 0) * 2 + 0x19;
      }
      iVar1 = FUN_1006506e(0x50);
      if (iVar1 == 0) {
        local_8 = 0;
      }
      else {
        local_8 = FUN_10083255(0,0x1b,0,0,1,iVar2);
      }
      iVar2 = local_8;
      if (local_8 != 0) {
        iVar1 = FUN_1006506e(0x24);
        if (iVar1 == 0) {
          iVar1 = 0;
        }
        else {
          iVar1 = FUN_10082e36(3,param_4,1,1,0x200);
        }
        *(int *)(iVar2 + 0x10) = iVar1;
        if (iVar1 != 0) {
          iVar1 = FUN_10082816(param_1);
          *(int *)(iVar2 + 0x20) = iVar1;
          if (iVar1 != 0) {
            iVar1 = FUN_100a1bf8(param_2,param_3,1);
            *(int *)(iVar2 + 0x24) = iVar1;
            if (iVar1 != 0) {
              iVar2 = FUN_1006506e(0x50);
              if (iVar2 == 0) {
                iVar2 = 0;
              }
              else {
                iVar2 = FUN_10083255(0,0,0,0,1,local_10);
              }
              if (iVar2 != 0) {
                iVar1 = FUN_1006506e(0x24);
                if (iVar1 == 0) {
                  iVar1 = 0;
                }
                else {
                  iVar1 = FUN_10082e36(3,param_4,1,1,0x200);
                }
                *(int *)(iVar2 + 0x10) = iVar1;
                if (iVar1 != 0) {
                  iVar1 = FUN_1006506e(0x14);
                  if (iVar1 == 0) {
                    iVar1 = 0;
                  }
                  else {
                    iVar1 = FUN_10082872(0,0,"Value");
                  }
                  *(int *)(iVar2 + 0x20) = iVar1;
                  if (iVar1 != 0) {
                    iVar1 = FUN_1006506e(0x40);
                    if (iVar1 == 0) {
                      iVar1 = 0;
                    }
                    else {
                      iVar1 = FUN_1008340d(4,local_8,local_10);
                    }
                    *(int *)(*(int *)(iVar2 + 0x20) + 8) = iVar1;
                    if (iVar1 != 0) {
                      FUN_1009a568(iVar2);
                      return iVar2;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return 0;
}


