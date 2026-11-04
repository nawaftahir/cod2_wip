// 100a6e19 size=61 FUN_100a6e19

undefined4 FUN_100a6e19(int param_1)

{
  undefined4 uVar1;
  
  if ((((param_1 == 0x60500000) || (param_1 == 0x60a00000)) || (param_1 == 0x60000000)) ||
     (((param_1 == 0x72e00000 || (param_1 == 0x60700000)) || (param_1 == 0x60f00000)))) {
    uVar1 = 1;
  }
  else {
    uVar1 = 0;
  }
  return uVar1;
}


