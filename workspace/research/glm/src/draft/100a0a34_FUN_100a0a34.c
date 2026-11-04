extern int FUN_1006506e();
extern int FUN_10082e36();
extern int FUN_100994dd();
extern int FUN_100a07e3();


unsigned int FUN_100a0a34(unsigned int param_1,unsigned int param_2)

{
  unsigned int uVar1;
  int iVar2;
  unsigned int uVar3;
  
  uVar1 = param_1;
  if (param_1 != 0) {
    iVar2 = FUN_100a07e3(param_2,&param_1);
    if (iVar2 < 0) {
      FUN_100994dd();
    }
    else if ((param_1 == 0) || (4 < param_1)) {
      FUN_100994dd();
    }
    else {
      iVar2 = FUN_1006506e(0x24);
      if (iVar2 != 0) {
        uVar3 = FUN_10082e36(1,*(unsigned int *)(uVar1 + 0x14),1,param_1,0);
        return uVar3;
      }
    }
  }
  return 0;
}


