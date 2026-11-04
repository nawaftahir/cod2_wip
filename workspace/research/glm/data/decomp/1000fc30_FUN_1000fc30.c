// 1000fc30 size=169 FUN_1000fc30

undefined4 FUN_1000fc30(void)

{
  int iVar1;
  int *in_EAX;
  int local_14;
  undefined4 local_10;
  undefined4 local_c;
  undefined4 local_8;
  undefined4 local_4;
  
  local_14 = 0;
  FUN_10014940(&local_4,&local_14,&local_c,&local_10,&local_8);
  iVar1 = local_14;
  if (local_14 == 0) {
    return 0;
  }
  FUN_1000ee30(local_c,local_10,1,3,0);
  if (*in_EAX == 4) {
    FUN_1000ec00();
  }
  else {
    FUN_1000ea20(local_8,iVar1);
  }
  (*(code *)RI_Hunk_FreeTempMemory)(iVar1);
  (*(code *)RI_FS_ReadFile)(local_4);
  return 1;
}


