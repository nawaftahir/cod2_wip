
void FUN_00420020(void)

{
  DWORD DVar1;
  
  DVar1 = GetLastError();
  if (0 < (int)DVar1) {
    DVar1 = DVar1 & 0xffff | 0x80070000;
  }
                    /* WARNING: Subroutine does not return */
  FUN_00402c90(DVar1);
}

