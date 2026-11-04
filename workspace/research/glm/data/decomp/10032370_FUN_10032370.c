// 10032370 size=76 FUN_10032370

void FUN_10032370(void)

{
  uint uVar1;
  undefined4 *in_ECX;
  char in_DL;
  
  uVar1 = (uint)(byte)(in_DL - 0x30U);
  if (9 < (byte)(in_DL - 0x30U)) {
    uVar1 = 7;
  }
  if (uVar1 < 8) {
    *in_ECX = *(undefined4 *)(&DAT_10197f1c + uVar1 * 4);
    return;
  }
  if (in_DL == '8') {
    *in_ECX = DAT_1072dec4;
    return;
  }
  if (in_DL != '9') {
    *(undefined1 *)((int)in_ECX + 2) = 0xff;
    *(undefined1 *)((int)in_ECX + 1) = 0xff;
    *(undefined1 *)in_ECX = 0xff;
    *(undefined1 *)((int)in_ECX + 3) = 0xff;
    return;
  }
  *in_ECX = DAT_1072dec0;
  return;
}


