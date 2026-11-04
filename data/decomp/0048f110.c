
undefined4 __fastcall
FUN_0048f110(int param_1,uint param_2,undefined4 param_3,undefined4 param_4,undefined4 param_5,
            undefined4 param_6)

{
  undefined4 uVar1;
  
  if ((((short)*(ushort *)(param_1 + 4) < 0) && ((param_2 & 0x400) != 0)) &&
     ((*(ushort *)(param_1 + 4) & 0xd0) == 0)) {
    uVar1 = FUN_0048ca50(param_4,param_5,param_6);
    return uVar1;
  }
  return param_3;
}

