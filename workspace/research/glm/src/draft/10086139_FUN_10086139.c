extern int FUN_1006db35();
extern int FUN_10085bf1();
extern int FUN_10085bf5();
extern int FUN_10085d76();
extern int FUN_10085ec2();


unsigned int FUN_10086139(unsigned int param_1,unsigned int param_2,unsigned int param_3,unsigned long long param_4)

{
  int iVar1;
  unsigned int uVar2;
  
  iVar1 = FUN_10085d76();
  if (iVar1 == 0) {
    iVar1 = 0;
  }
  else {
    iVar1 = FUN_10085bf1();
  }
  if (iVar1 != 0) {
    iVar1 = FUN_10085bf5(param_1,param_2,param_3,param_4);
    if (iVar1 >= 0) {
      uVar2 = FUN_10085ec2();
      return uVar2;
    }
    FUN_1006db35();
  }
  return 0xffffffff;
}


