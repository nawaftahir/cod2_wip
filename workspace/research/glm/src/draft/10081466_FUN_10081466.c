extern int FUN_100811b0();


unsigned int FUN_10081466(unsigned int param_1,int param_2)

{
  int iVar1;
  
  if (param_2 < 0) {
    param_2 = -param_2;
  }
  else {
    iVar1 = FUN_100811b0(param_2,&param_2);
    if (iVar1 < 0) {
      return 0xffffffff;
    }
  }
  if (*(short *)(param_2 + 8) != 3) {
    return 0xffffffff;
  }
  return (unsigned int)*(unsigned short *)(param_2 + 10);
}


