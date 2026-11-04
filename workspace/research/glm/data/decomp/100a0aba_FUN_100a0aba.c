// 100a0aba size=169 FUN_100a0aba

undefined4 FUN_100a0aba(uint param_1,uint param_2,undefined4 param_3)

{
  uint uVar1;
  int iVar2;
  undefined4 uVar3;
  
  uVar1 = param_1;
  if (param_1 != 0) {
    iVar2 = FUN_100a07e3(param_2,&param_2);
    if ((iVar2 < 0) || (iVar2 = FUN_100a07e3(param_3,&param_1), iVar2 < 0)) {
      FUN_100994dd();
    }
    else if ((param_2 == 0) || (((4 < param_2 || (param_1 == 0)) || (4 < param_1)))) {
      FUN_100994dd();
    }
    else {
      iVar2 = FUN_1006506e(0x24);
      if (iVar2 != 0) {
        uVar3 = FUN_10082e36(2,*(undefined4 *)(uVar1 + 0x14),param_2,param_1,0);
        return uVar3;
      }
    }
  }
  return 0;
}


