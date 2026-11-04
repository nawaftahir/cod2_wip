
void FUN_00467470(void)

{
  int in_EAX;
  int iVar1;
  float local_1c;
  float local_18;
  float local_14;
  float local_10;
  float local_c;
  float local_8;
  
  if ((in_EAX == 0) && (DAT_0124a2e6 == '\0')) {
    iVar1 = FUN_0047d980(&DAT_0054e3c8,".\\entity.cpp",0x4c4);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a2e6 = '\x01';
    }
  }
  iVar1 = *(int *)(in_EAX + 0x50);
  local_1c = *(float *)(iVar1 + 0xc) + *(float *)(in_EAX + 0x58);
  local_18 = *(float *)(iVar1 + 0x10) + *(float *)(in_EAX + 0x5c);
  local_14 = *(float *)(iVar1 + 0x14) + *(float *)(in_EAX + 0x60);
  local_10 = *(float *)(iVar1 + 0x18) + *(float *)(in_EAX + 0x58);
  local_c = *(float *)(iVar1 + 0x1c) + *(float *)(in_EAX + 0x5c);
  local_8 = *(float *)(iVar1 + 0x20) + *(float *)(in_EAX + 0x60);
  FUN_0045b310(&local_1c,&local_10);
  return;
}

