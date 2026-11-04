
void FUN_0047a760(char *param_1)

{
  DWORD DVar1;
  int iVar2;
  char local_808 [1024];
  char local_408 [1024];
  undefined4 local_8;
  
  local_8 = DAT_0058ea68;
  DVar1 = GetLastError();
  _vsprintf(local_408,param_1,&stack0x00000008);
  _sprintf(local_808,
           "%s\nGetLastError() = %i\nAn unrecoverable error has occured. Would you like to edit Preferences before exiting Q3Radiant?"
           ,local_408,DVar1);
  iVar2 = MessageBoxA(DAT_010bcd54,local_808,"Error",4);
  if (iVar2 == 6) {
    FUN_00439ee0();
    (**(code **)(*DAT_01233b64 + 0x140))();
  }
                    /* WARNING: Subroutine does not return */
  _exit(1);
}

