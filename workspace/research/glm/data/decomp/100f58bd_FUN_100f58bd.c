// 100f58bd size=35 FUN_100f58bd

undefined4 FUN_100f58bd(int param_1,uint param_2)

{
  undefined4 uVar1;
  
  if ((param_1 != 0) && (param_2 < 0x80000000)) {
    uVar1 = FUN_100cc7e2();
    return uVar1;
  }
  return 0x80070057;
}


