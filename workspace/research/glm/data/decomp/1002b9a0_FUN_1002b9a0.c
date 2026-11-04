// 1002b9a0 size=282 FUN_1002b9a0

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_1002b9a0(void)

{
  undefined4 *puVar1;
  undefined4 *puVar2;
  undefined4 *puVar3;
  int iVar4;
  
  puVar3 = &DAT_10696d00;
  for (iVar4 = 0x310e; iVar4 != 0; iVar4 = iVar4 + -1) {
    *puVar3 = 0;
    puVar3 = puVar3 + 1;
  }
  _DAT_106a3128 = &DAT_106a3128;
  DAT_106a312c = &DAT_106a3128;
  _DAT_106a3108 = &DAT_106a3108;
  _DAT_106a310c = &DAT_106a3108;
  _DAT_106a3110 = &DAT_106a3110;
  _DAT_106a3114 = &DAT_106a3110;
  _DAT_106a3118 = &DAT_106a3118;
  _DAT_106a311c = &DAT_106a3118;
  _DAT_106a3120 = &DAT_106a3120;
  _DAT_106a3124 = &DAT_106a3120;
  DAT_106a3100 = &DAT_106a3100;
  DAT_106a3104 = &DAT_106a3100;
  puVar3 = &DAT_10696f14;
  iVar4 = 0x20;
  do {
    puVar3[-99] = &DAT_106a3100;
    puVar3[-0x62] = DAT_106a3104;
    DAT_106a3104 = puVar3 + -99;
    *(undefined4 **)puVar3[-0x62] = DAT_106a3104;
    puVar3[-1] = &DAT_106a3100;
    *puVar3 = DAT_106a3104;
    DAT_106a3104 = puVar3 + -1;
    *(undefined4 **)*puVar3 = DAT_106a3104;
    puVar1 = puVar3 + 0x61;
    *puVar1 = &DAT_106a3100;
    puVar3[0x62] = DAT_106a3104;
    DAT_106a3104 = puVar1;
    *(undefined4 **)puVar3[0x62] = puVar1;
    puVar1 = puVar3 + 0xc3;
    *puVar1 = &DAT_106a3100;
    puVar3[0xc4] = DAT_106a3104;
    puVar2 = puVar3 + 0xc4;
    puVar3 = puVar3 + 0x188;
    iVar4 = iVar4 + -1;
    DAT_106a3104 = puVar1;
    *(undefined4 **)*puVar2 = puVar1;
  } while (iVar4 != 0);
  return;
}


