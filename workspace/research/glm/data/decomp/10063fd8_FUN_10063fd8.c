// 10063fd8 size=505 FUN_10063fd8

int FUN_10063fd8(void)

{
  byte bVar1;
  int iVar2;
  byte *pbVar3;
  void *pvVar4;
  int in_ECX;
  uint uVar5;
  byte *pbVar6;
  bool bVar7;
  undefined4 uVar8;
  char *pcVar9;
  char local_21c [260];
  byte local_118 [260];
  LPSTR local_14;
  undefined4 local_10;
  int local_c;
  byte *local_8;
  
  iVar2 = FUN_100686c0(*(uint *)(in_ECX + 0x298) | 0xc,(int *)(in_ECX + 0x278));
  uVar5 = 0;
  if (iVar2 < 0) {
    return iVar2;
  }
  iVar2 = *(int *)(in_ECX + 0x278);
  if (iVar2 == 10) {
    local_c = 0;
  }
  else {
    if (iVar2 != 0xb) {
      FUN_10063ee5();
      return -0x7fffbffb;
    }
    local_c = 1;
  }
  local_8 = *(byte **)(in_ECX + 0x280);
  if ((*(int *)(in_ECX + 0x270) == 0) && (*(int *)(*(int *)(in_ECX + 0x26c) + 0x18) == 0)) {
    pcVar9 = "include interface required to support #include from resource or memory";
    uVar8 = 0x5e1;
LAB_1006408d:
    FUN_10067c3e(in_ECX + 0x18,in_ECX + 0x278,uVar8,pcVar9);
    *(undefined4 *)(in_ECX + 0x48) = 1;
    *(undefined4 *)(in_ECX + 0x44) = 1;
    return -0x7fffbffb;
  }
  iVar2 = *(int *)(in_ECX + 0x268);
  if (iVar2 != 0) {
    do {
      iVar2 = *(int *)(iVar2 + 0x6c);
      uVar5 = uVar5 + 1;
    } while (iVar2 != 0);
    if (0x1f < uVar5) {
      pcVar9 = "too many nested #includes";
      uVar8 = 0x5e2;
      goto LAB_1006408d;
    }
  }
  if (*(int *)(in_ECX + 0x270) == 0) {
    GetFullPathNameA((LPCSTR)local_8,0x104,(LPSTR)local_118,&local_14);
    pbVar3 = local_118;
    pbVar6 = local_8;
    do {
      bVar1 = *pbVar6;
      bVar7 = bVar1 < *pbVar3;
      if (bVar1 != *pbVar3) {
LAB_100640ee:
        iVar2 = (1 - (uint)bVar7) - (uint)(bVar7 != 0);
        goto LAB_100640f3;
      }
      if (bVar1 == 0) break;
      bVar1 = pbVar6[1];
      bVar7 = bVar1 < pbVar3[1];
      if (bVar1 != pbVar3[1]) goto LAB_100640ee;
      pbVar6 = pbVar6 + 2;
      pbVar3 = pbVar3 + 2;
    } while (bVar1 != 0);
    iVar2 = 0;
LAB_100640f3:
    if (iVar2 != 0) {
      __snprintf(local_21c,0x104,"%s%s",*(undefined4 *)(*(int *)(in_ECX + 0x268) + 0x60),local_8);
      GetFullPathNameA(local_21c,0x104,(LPSTR)local_118,&local_14);
    }
    local_8 = local_118;
  }
  iVar2 = *(int *)(in_ECX + 0x268);
  if ((iVar2 == 0) || (*(int *)(iVar2 + 0x58) == 0)) {
    local_10 = 0;
  }
  else {
    local_10 = *(undefined4 *)(iVar2 + 100);
  }
  pvVar4 = operator_new(0x70);
  if (pvVar4 == (void *)0x0) {
    iVar2 = 0;
  }
  else {
    iVar2 = FUN_10063a97();
  }
  if (iVar2 != 0) {
    local_c = FUN_10063b46(local_8,0,in_ECX,in_ECX + 0x278,in_ECX + 0x18,
                           *(undefined4 *)(in_ECX + 0x270),local_c,local_10);
    if (-1 < local_c) {
      *(undefined4 *)(iVar2 + 0x6c) = *(undefined4 *)(in_ECX + 0x268);
      *(int *)(in_ECX + 0x268) = iVar2;
      return 0;
    }
    *(undefined4 *)(in_ECX + 0x48) = 1;
    *(undefined4 *)(in_ECX + 0x44) = 1;
    FUN_10063b25(1);
    return local_c;
  }
  return -0x7ff8fff2;
}


