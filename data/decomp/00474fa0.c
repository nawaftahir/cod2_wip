
void __thiscall FUN_00474fa0(uint param_1,CArchive *param_2)

{
  void *in_EAX;
  uint uVar1;
  void *local_8;
  
  if ((~*(uint *)(param_2 + 0x18) & 1) == 0) {
    for (; param_1 != 0; param_1 = param_1 - uVar1) {
      uVar1 = param_1;
      if (0xaaaaaa9 < param_1) {
        uVar1 = 0xaaaaaaa;
      }
      CArchive::Read(param_2,in_EAX,uVar1 * 0xc);
      in_EAX = (void *)((int)in_EAX + uVar1 * 0xc);
    }
  }
  else {
    local_8 = in_EAX;
    if (param_1 != 0) {
      do {
        uVar1 = param_1;
        if (0xaaaaaa9 < param_1) {
          uVar1 = 0xaaaaaaa;
        }
        CArchive::Write(param_2,local_8,uVar1 * 0xc);
        param_1 = param_1 - uVar1;
        local_8 = (void *)((int)local_8 + uVar1 * 0xc);
      } while (param_1 != 0);
      return;
    }
  }
  return;
}

