// 1002baf0 size=111 FUN_1002baf0

void FUN_1002baf0(void)

{
  int *piVar1;
  int *piVar2;
  int *piVar3;
  
  if (DAT_106a312c == (int *)0x0) {
    return;
  }
  if (DAT_106a312c != (int *)&DAT_106a3128) {
    do {
      piVar2 = DAT_106a312c;
      FUN_1002aac0(&DAT_10696d00,DAT_106a312c,0,4);
      piVar3 = DAT_106a312c;
      piVar1 = DAT_106a312c + 1;
      *(int *)DAT_106a312c[1] = *DAT_106a312c;
      *(int *)(*piVar3 + 4) = *piVar1;
      piVar1 = piVar2 + 0x22;
      *piVar1 = (int)&DAT_106a3100;
      piVar2[0x23] = (int)DAT_106a3104;
      DAT_106a3104 = piVar1;
      *(int **)piVar2[0x23] = piVar1;
    } while (DAT_106a312c != (int *)&DAT_106a3128);
  }
  FUN_1002b9a0();
  return;
}


