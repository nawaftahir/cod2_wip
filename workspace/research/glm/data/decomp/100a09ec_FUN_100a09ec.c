// 100a09ec size=72 FUN_100a09ec

undefined4 FUN_100a09ec(undefined4 param_1,undefined4 param_2)

{
  int iVar1;
  undefined4 uVar2;
  
  iVar1 = FUN_1006506e(0x14);
  if (iVar1 == 0) {
    iVar1 = 0;
  }
  else {
    iVar1 = FUN_10082872(param_2,0,&DAT_101151e8);
  }
  if (iVar1 == 0) {
    uVar2 = 0;
  }
  else {
    uVar2 = FUN_100a083c(param_1,iVar1);
    *(undefined4 *)(iVar1 + 8) = 0;
  }
  return uVar2;
}


