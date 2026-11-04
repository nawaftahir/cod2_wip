extern int FUN_1006506e();
extern int FUN_10082872();
extern int FUN_10082e36();
extern int FUN_10083255();
extern int FUN_10083442();
extern int FUN_1009a568();


int FUN_1009c5c8(int param_1)

{
  unsigned int uVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  
  iVar4 = param_1;
  if ((((param_1 != 0) && (*(int *)(param_1 + 4) == 0xf)) &&
      (*(unsigned int **)(param_1 + 0x30) != (unsigned int *)0x0)) && (3 < *(unsigned int *)(param_1 + 0x34))) {
    uVar1 = **(unsigned int **)(param_1 + 0x30) & 0xffff0000;
    if (uVar1 == 0x7ffe0000) {
      param_1 = 0x1c;
    }
    else if (uVar1 == 0x7fff0000) {
      param_1 = 0x1b;
    }
    else if (uVar1 == 0xfffe0000) {
      param_1 = 0x1a;
    }
    else {
      if (uVar1 != 0xffff0000) {
        return 0;
      }
      param_1 = 0x19;
    }
    iVar2 = FUN_1006506e(0x50);
    if (iVar2 == 0) {
      iVar2 = 0;
    }
    else {
      iVar2 = FUN_10083255(0,0,0,0,1,iVar4 + 0x10);
    }
    if (iVar2 != 0) {
      iVar3 = FUN_1006506e(0x24);
      if (iVar3 == 0) {
        iVar3 = 0;
      }
      else {
        iVar3 = FUN_10082e36(3,param_1,1,1,0x200);
      }
      *(int *)(iVar2 + 0x10) = iVar3;
      if (iVar3 != 0) {
        iVar3 = FUN_1006506e(0x40);
        if (iVar3 == 0) {
          iVar4 = 0;
        }
        else {
          iVar4 = FUN_10083442(5,*(unsigned int *)(iVar4 + 0x30),*(unsigned int *)(iVar4 + 0x34),
                               iVar4 + 0x10);
        }
        *(int *)(iVar2 + 0x20) = iVar4;
        if (iVar4 != 0) {
          iVar4 = FUN_1006506e(0x14);
          if (iVar4 == 0) {
            iVar4 = 0;
          }
          else {
            iVar4 = FUN_10082872(*(unsigned int *)(iVar2 + 0x20),0,"Value");
          }
          if (iVar4 != 0) {
            *(int *)(iVar2 + 0x20) = iVar4;
            FUN_1009a568(iVar2);
            return iVar2;
          }
        }
      }
    }
  }
  return 0;
}


