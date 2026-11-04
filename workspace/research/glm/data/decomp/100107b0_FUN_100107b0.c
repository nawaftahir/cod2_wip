// 100107b0 size=46 FUN_100107b0

void FUN_100107b0(undefined4 param_1)

{
  undefined4 uVar1;
  
  uVar1 = (*(code *)RI_Hunk_AllocateTempMemoryInternal)(0x18000);
  FUN_10010160(param_1,uVar1,0x40,0,FUN_100106b0);
  (*(code *)RI_Hunk_FreeTempMemory)(uVar1);
  return;
}


