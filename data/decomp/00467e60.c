
void FUN_00467e60(void)

{
  int iVar1;
  
  DAT_012334f4 = 0;
  if ((DAT_010a44b8 != (undefined4 *)0x0) && (DAT_010a44b8 != &DAT_010a44b4)) {
    iVar1 = MessageBoxA(DAT_010bcd54,"Copy selection?","",4);
    if ((iVar1 == 6) && (*(int *)(DAT_01233488 + 0x7e0) != 0)) {
      DAT_012334f4 = 1;
      FUN_00452e30(*(int *)(DAT_01233488 + 0x7e0));
    }
  }
  return;
}

