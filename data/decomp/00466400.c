
undefined4 * FUN_00466400(void)

{
  undefined4 *puVar1;
  undefined4 uVar2;
  
  puVar1 = (undefined4 *)FUN_004ff450(0xc);
  *puVar1 = 0;
  uVar2 = FUN_0046cb10();
  puVar1[1] = uVar2;
  FUN_00495490();
  uVar2 = FUN_0046cb10();
  puVar1[2] = uVar2;
  return puVar1;
}

