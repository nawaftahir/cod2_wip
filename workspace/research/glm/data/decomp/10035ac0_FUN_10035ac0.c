// 10035ac0 size=271 FUN_10035ac0

undefined4 FUN_10035ac0(int param_1)

{
  int iVar1;
  byte in_CL;
  
  if (((byte)(1 << (in_CL & 0x1f)) & *(byte *)(param_1 + 5)) == 0) {
    if (*(char *)(DAT_101ce818 + 8) != '\0') {
      FUN_10035a50(0x3f666666,&DAT_101913c8);
      return 1;
    }
  }
  else {
    FUN_100590b0();
    iVar1 = (*(code *)RI_CM_BoxTrace)(0);
    if (iVar1 != 0) {
      if (*(char *)(DAT_101ce818 + 8) != '\0') {
        FUN_10035a50(0x3f8ccccd,&DAT_101913b8);
      }
      return 0;
    }
    if (*(char *)(DAT_101ce818 + 8) != '\0') {
      FUN_10035a50(0x3f800000,&DAT_10191408);
    }
  }
  return 1;
}


