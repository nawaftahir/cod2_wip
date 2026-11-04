extern int FUN_100827da();
extern int FUN_10082999();


unsigned char FUN_10082aa4(unsigned int param_1)

{
  int iVar1;
  unsigned char bVar2;
  
  iVar1 = FUN_100827da(param_1);
  bVar2 = false;
  if (iVar1 != 0) {
    iVar1 = FUN_10082999();
    bVar2 = iVar1 != 0;
  }
  return bVar2;
}


