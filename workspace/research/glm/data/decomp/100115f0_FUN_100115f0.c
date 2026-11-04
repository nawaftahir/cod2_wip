// 100115f0 size=190 FUN_100115f0

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_100115f0(void)

{
  int iVar1;
  int in_EAX;
  int local_14;
  int local_10;
  
  DAT_101d4c6c = *(int *)(in_EAX + 0x14);
  DAT_101d4c70 = *(int *)(in_EAX + 0x18);
  DAT_101d4c74 = *(undefined4 *)(in_EAX + 4);
  DAT_101d4c78 = (uint)*(byte *)(in_EAX + 8);
  switch(*(undefined4 *)(DAT_101ce804 + 8)) {
  case 0:
    FUN_10011560();
    iVar1 = (int)ROUND(((float)local_14 * 16.0) / (float)local_10 + 9.313226e-10);
    if (iVar1 == 10) goto switchD_10011627_caseD_2;
    if (9 < iVar1) goto switchD_10011627_caseD_1;
  case 3:
    _DAT_101d4c7c = 1.7777778;
    break;
  case 1:
switchD_10011627_caseD_1:
    _DAT_101d4c7c = 1.3333334;
    break;
  case 2:
switchD_10011627_caseD_2:
    _DAT_101d4c7c = 1.6;
    break;
  default:
    break;
  }
  _DAT_101d4c80 = ((float)DAT_101d4c70 * _DAT_101d4c7c) / (float)DAT_101d4c6c;
  return;
}


