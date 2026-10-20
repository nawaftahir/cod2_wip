
undefined4 __fastcall FUN_004bd900(int param_1)

{
  int iVar1;
  undefined4 uVar2;
  undefined4 local_8;
  undefined1 local_4 [4];
  
  uVar2 = 0xffff;
  local_8 = 4;
  iVar1 = Ordinal_7(*(undefined4 *)(param_1 + 4),0xffff,0x1001,local_4,&local_8);
  if (iVar1 != 0) {
    uVar2 = 0x1000;
  }
  return uVar2;
}

