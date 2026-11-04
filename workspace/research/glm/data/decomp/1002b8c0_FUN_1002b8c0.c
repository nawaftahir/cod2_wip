// 1002b8c0 size=87 FUN_1002b8c0

void FUN_1002b8c0(void)

{
  int *piVar1;
  int iVar2;
  int in_EAX;
  int *piVar3;
  
  iVar2 = (in_EAX + -0x10696d00) / 0x188;
  piVar3 = &DAT_10696d00 + iVar2 * 0x62;
  piVar1 = (int *)(&DAT_10696d04)[iVar2 * 0x62];
  *(undefined4 *)(&DAT_10696d08 + iVar2 * 0x188) = *DAT_101da9c8;
  *piVar1 = *piVar3;
  *(undefined4 *)(*piVar3 + 4) = (&DAT_10696d04)[iVar2 * 0x62];
  *piVar3 = (int)&DAT_106a3128;
  (&DAT_10696d04)[iVar2 * 0x62] = DAT_106a312c;
  DAT_106a312c = piVar3;
  *(int **)(&DAT_10696d04)[iVar2 * 0x62] = piVar3;
  return;
}


