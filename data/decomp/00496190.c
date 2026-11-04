
undefined4 FUN_00496190(undefined4 param_1)

{
  uint uVar1;
  uint uVar2;
  undefined4 uVar3;
  
  uVar3 = param_1;
  uVar1 = (uint)param_1 >> 0x18;
  uVar2 = (uint)param_1 >> 0x10;
  param_1 = CONCAT13((char)uVar3,
                     CONCAT12((char)((uint)uVar3 >> 8),CONCAT11((char)uVar2,(char)uVar1)));
  return param_1;
}

