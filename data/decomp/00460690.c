
undefined4 __fastcall FUN_00460690(undefined4 param_1)

{
  char cVar1;
  int in_EAX;
  undefined4 uVar2;
  
  if (*(int *)(in_EAX + 0xa0) != 0) {
    uVar2 = FUN_00447f60();
    cVar1 = FUN_00460470(uVar2,in_EAX + 0x80,param_1,DAT_010a44b8,0);
    if (cVar1 != '\0') {
      return 0;
    }
  }
  uVar2 = FUN_00440840();
  FUN_00459430(uVar2);
  return 1;
}

