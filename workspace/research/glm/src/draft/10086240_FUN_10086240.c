extern int FUN_1006db35();
extern int FUN_10085bf1();
extern int FUN_10085c65();
extern int FUN_10085d76();
extern int FUN_10085ec2();


unsigned int FUN_10086240(unsigned int param_1)

{
  int iVar1;
  int iVar2;
  unsigned int uVar3;
  
  iVar1 = FUN_10085d76(0x80);
  if (iVar1 == 0) {
    iVar1 = 0;
  }
  else {
    iVar1 = FUN_10085bf1();
  }
  if (iVar1 != 0) {
    iVar2 = FUN_10085c65(param_1);
    if (iVar2 >= 0) {
      uVar3 = FUN_10085ec2(iVar1);
      return uVar3;
    }
    FUN_1006db35(1);
  }
  return 0xffffffff;
}


