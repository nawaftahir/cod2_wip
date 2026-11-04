// 100087a0 size=283 FUN_100087a0

void FUN_100087a0(int param_1)

{
  char cVar1;
  int iVar2;
  int *piVar3;
  int iVar4;
  undefined *puVar5;
  float local_18;
  float local_14;
  float local_10;
  float local_c;
  float local_8;
  float local_4;
  
  iVar4 = param_1 * 0x34;
  puVar5 = &DAT_10678ac4 + iVar4;
  piVar3 = (int *)(param_1 * 0x74 + DAT_10678510);
  FUN_100084c0();
  cVar1 = FUN_100063e0();
  if (cVar1 != '\0') {
    return;
  }
  if (local_c - local_18 <= 1536.0) {
    if (1536.0 < local_8 - local_14) goto joined_r0x10008840;
  }
  else {
    if (1536.0 < local_8 - local_14) goto LAB_10008867;
joined_r0x10008840:
    if (1536.0 < local_4 - local_10) goto LAB_10008867;
  }
  iVar2 = FUN_10008600(*(undefined4 *)(DAT_101d1b9c + 0xc),param_1,&local_18,&local_c);
  if (iVar2 != -1) {
    return;
  }
LAB_10008867:
  FUN_1001ffc0(puVar5);
  (*(code *)RI_DObjCalcSkel)(*(undefined4 *)(&DAT_10678acc + iVar4));
  if (*piVar3 == 1) {
    FUN_1001f6f0(puVar5,piVar3,0xffffffff);
  }
  else {
    FUN_1001fa70(puVar5,piVar3);
  }
  *(undefined4 *)(&DAT_10678ad0 + iVar4) = 5;
  FUN_10024680(param_1);
  return;
}


