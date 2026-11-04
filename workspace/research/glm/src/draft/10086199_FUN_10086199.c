extern int FUN_1006c418();
extern int FUN_10085379();
extern int FUN_10085814();
extern int FUN_1008585f();
extern int FUN_10086026();


unsigned int FUN_10086199(unsigned int param_1,unsigned int param_2,unsigned int param_3)

{
  int iVar1;
  int iVar2;
  unsigned int uVar3;
  
  iVar1 = FUN_10085814(0x74);
  if (iVar1 == 0) {
    iVar1 = 0;
  }
  else {
    iVar1 = FUN_10085379();
  }
  if (iVar1 != 0) {
    iVar2 = FUN_1008585f(param_1,param_2,param_3,0);
    if (iVar2 >= 0) {
      uVar3 = FUN_10086026(iVar1);
      return uVar3;
    }
    FUN_1006c418(1);
  }
  return 0xffffffff;
}


