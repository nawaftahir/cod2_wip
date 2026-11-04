// 10081466 size=56 FUN_10081466

uint FUN_10081466(undefined4 param_1,int param_2)

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
  return (uint)*(ushort *)(param_2 + 10);
}


