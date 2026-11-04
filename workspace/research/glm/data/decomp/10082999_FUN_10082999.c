// 10082999 size=208 FUN_10082999

undefined4 FUN_10082999(void)

{
  byte bVar1;
  int *in_EAX;
  byte *pbVar2;
  int iVar3;
  int *in_ECX;
  byte *pbVar4;
  bool bVar5;
  
  iVar3 = *in_ECX;
  if (iVar3 != *in_EAX) {
    return 0;
  }
  if (iVar3 < 9) {
    if (4 < iVar3) {
      if (*(double *)(in_ECX + 2) != *(double *)(in_EAX + 2)) {
        return 0;
      }
      return 1;
    }
    if (iVar3 != 0) {
      if (iVar3 == 1) {
        pbVar4 = (byte *)(in_EAX + 2);
        pbVar2 = (byte *)(in_ECX + 2);
        do {
          bVar1 = *pbVar2;
          bVar5 = bVar1 < *pbVar4;
          if (bVar1 != *pbVar4) goto LAB_10082a5d;
          if (bVar1 == 0) break;
          bVar1 = pbVar2[1];
          bVar5 = bVar1 < pbVar4[1];
          if (bVar1 != pbVar4[1]) goto LAB_10082a5d;
          pbVar2 = pbVar2 + 2;
          pbVar4 = pbVar4 + 2;
        } while (bVar1 != 0);
        goto LAB_100829f1;
      }
      if (iVar3 < 2) {
        return 1;
      }
      if (4 < iVar3) {
        return 1;
      }
    }
    bVar5 = in_ECX[2] == in_EAX[2];
    goto LAB_100829c3;
  }
  if (iVar3 == 9) {
    pbVar4 = (byte *)in_EAX[2];
    pbVar2 = (byte *)in_ECX[2];
    do {
      bVar1 = *pbVar2;
      bVar5 = bVar1 < *pbVar4;
      if (bVar1 != *pbVar4) goto LAB_10082a5d;
      if (bVar1 == 0) break;
      bVar1 = pbVar2[1];
      bVar5 = bVar1 < pbVar4[1];
      if (bVar1 != pbVar4[1]) goto LAB_10082a5d;
      pbVar2 = pbVar2 + 2;
      pbVar4 = pbVar4 + 2;
    } while (bVar1 != 0);
  }
  else {
    if (iVar3 != 10) {
      return 1;
    }
    pbVar4 = (byte *)in_EAX[2];
    pbVar2 = (byte *)in_ECX[2];
    do {
      bVar1 = *pbVar2;
      bVar5 = bVar1 < *pbVar4;
      if (bVar1 != *pbVar4) goto LAB_10082a5d;
      if (bVar1 == 0) break;
      bVar1 = pbVar2[1];
      bVar5 = bVar1 < pbVar4[1];
      if (bVar1 != pbVar4[1]) goto LAB_10082a5d;
      pbVar2 = pbVar2 + 2;
      pbVar4 = pbVar4 + 2;
    } while (bVar1 != 0);
  }
LAB_100829f1:
  iVar3 = 0;
LAB_10082a62:
  bVar5 = iVar3 == 0;
LAB_100829c3:
  if (!bVar5) {
    return 0;
  }
  return 1;
LAB_10082a5d:
  iVar3 = (1 - (uint)bVar5) - (uint)(bVar5 != 0);
  goto LAB_10082a62;
}


