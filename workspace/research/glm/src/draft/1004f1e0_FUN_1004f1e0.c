


unsigned int FUN_1004f1e0(int *param_1)

{
  byte bVar1;
  unsigned int *puVar2;
  unsigned int uVar3;
  byte *pbVar4;
  int iVar5;
  
  puVar2 = (unsigned int *)param_1[8];
  pbVar4 = (byte *)*puVar2;
  iVar5 = puVar2[1];
  if (iVar5 == 0) {
    uVar3 = (*(void *)puVar2[3])(param_1);
    if ((char)uVar3 == '\0') goto LAB_1004f21c;
    pbVar4 = (byte *)*puVar2;
    iVar5 = puVar2[1];
  }
  bVar1 = *pbVar4;
  iVar5 = iVar5 + -1;
  pbVar4 = pbVar4 + 1;
  if (iVar5 == 0) {
    uVar3 = (*(void *)puVar2[3])(param_1);
    if ((char)uVar3 == '\0') {
LAB_1004f21c:
      return uVar3 & 0xffffff00;
    }
    pbVar4 = (byte *)*puVar2;
    iVar5 = puVar2[1];
  }
  uVar3 = (unsigned int)*pbVar4;
  if ((bVar1 != 0xff) || (uVar3 != 0xd8)) {
    *(unsigned int *)(*param_1 + 0x14) = 0x35;
    *(unsigned int *)(*param_1 + 0x18) = (unsigned int)bVar1;
    *(unsigned int *)(*param_1 + 0x1c) = uVar3;
    (**(void **)*param_1)(param_1);
  }
  param_1[0x61] = uVar3;
  puVar2[1] = iVar5 + -1;
  *puVar2 = pbVar4 + 1;
  return 1;
}


