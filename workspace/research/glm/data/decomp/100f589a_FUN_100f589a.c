// 100f589a size=35 FUN_100f589a

undefined4 FUN_100f589a(int param_1,uint param_2)

{
  undefined4 uVar1;
  
  if ((param_1 != 0) && (param_2 < 0x80000000)) {
    uVar1 = FUN_100cc7ab();
    return uVar1;
  }
  return 0x80070057;
}


