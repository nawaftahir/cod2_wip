// 10026330 size=101 FUN_10026330

void FUN_10026330(void)

{
  int iVar1;
  char local_104 [260];
  
  _sprintf(local_104,"%s.jpg");
  iVar1 = FUN_10026110(0x200,0);
  if (iVar1 != 0) {
    FUN_10014670(local_104,0x5a,0x200,0x200,iVar1);
    (*(code *)RI_Z_FreeInternal)(iVar1);
  }
  return;
}


