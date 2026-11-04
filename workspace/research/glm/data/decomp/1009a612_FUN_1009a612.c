// 1009a612 size=131 FUN_1009a612

int FUN_1009a612(void)

{
  int iVar1;
  int iVar2;
  int in_ECX;
  
  if (*(int *)(in_ECX + 0x18) != 0) {
    iVar1 = FUN_1006506e(0x24);
    if (iVar1 == 0) {
      iVar1 = 0;
    }
    else {
      iVar1 = FUN_10083159();
    }
    if (iVar1 != 0) {
      *(undefined4 *)(iVar1 + 0x10) = 6;
      iVar2 = FUN_1006506e(0x50);
      if (iVar2 == 0) {
        iVar2 = 0;
      }
      else {
        iVar2 = FUN_10083255(0,0,0,0,1,in_ECX + 0x20);
      }
      if (iVar2 != 0) {
        *(int *)(iVar1 + 0x18) = iVar2;
        iVar2 = FUN_1006506e(0x14);
        if (iVar2 == 0) {
          iVar1 = 0;
        }
        else {
          iVar1 = FUN_10082872(iVar1,0,"Stmts");
        }
        if (iVar1 != 0) {
          return iVar1;
        }
      }
    }
  }
  return 0;
}


