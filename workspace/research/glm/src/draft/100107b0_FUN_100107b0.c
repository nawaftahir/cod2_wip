extern int FUN_10010160();
extern int FUN_100106b0();


void FUN_100107b0(unsigned int param_1)

{
  unsigned int uVar1;
  
  uVar1 = (*(void *)RI_Hunk_AllocateTempMemoryInternal)(0x18000);
  FUN_10010160(param_1,uVar1,0x40,0,FUN_100106b0);
  (*(void *)RI_Hunk_FreeTempMemory)(uVar1);
  return;
}


