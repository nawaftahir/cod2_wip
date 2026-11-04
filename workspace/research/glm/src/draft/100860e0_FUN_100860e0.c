extern int FUN_10085de7();
extern int FUN_10085e08();
extern int FUN_100cb926();
extern int FUN_100cb92a();


unsigned int FUN_100860e0(unsigned int param_1,unsigned int param_2,unsigned int param_3,unsigned int param_4)

{
  void *pvVar1;
  int iVar2;
  int iVar3;
  unsigned int uVar4;
  
  pvVar1 = operator_new(0x34);
  if (pvVar1 == (void *)0x0) {
    iVar2 = 0;
  }
  else {
    iVar2 = FUN_100cb926();
  }
  if (iVar2 != 0) {
    iVar3 = FUN_100cb92a(param_1,param_2,param_3,param_4);
    if (iVar3 >= 0) {
      uVar4 = FUN_10085e08(iVar2);
      return uVar4;
    }
    FUN_10085de7(1);
  }
  return 0xffffffff;
}


