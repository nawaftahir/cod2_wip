// 10060f60 size=244 FUN_10060f60

/* WARNING: Function: __chkstk replaced with injection: alloca_probe */

void FUN_10060f60(void)

{
  byte bVar1;
  byte *pbVar2;
  char *pcVar3;
  byte *pbVar4;
  int iVar5;
  byte *in_ECX;
  byte *pbVar6;
  byte *unaff_EBX;
  bool bVar7;
  byte local_4000 [8192];
  byte local_2000 [8188];
  undefined4 uStack_4;
  
  uStack_4 = 0x10060f6a;
  pbVar2 = in_ECX;
  do {
    bVar1 = *pbVar2;
    pbVar2 = pbVar2 + 1;
  } while (bVar1 != 0);
  if (0x1fff < (uint)((int)pbVar2 - (int)(in_ECX + 1))) {
    FUN_10061cd0(1,&DAT_1019bb7c);
  }
  pcVar3 = _strchr((char *)unaff_EBX,0x5c);
  if (pcVar3 != (char *)0x0) {
    return;
  }
  do {
    pbVar2 = in_ECX;
    if (*in_ECX == 0x5c) {
      pbVar2 = in_ECX + 1;
    }
    pbVar6 = local_4000;
    bVar1 = *pbVar2;
    while (bVar1 != 0x5c) {
      if (bVar1 == 0) {
        return;
      }
      *pbVar6 = bVar1;
      pbVar4 = pbVar2 + 1;
      pbVar6 = pbVar6 + 1;
      pbVar2 = pbVar2 + 1;
      bVar1 = *pbVar4;
    }
    bVar1 = pbVar2[1];
    *pbVar6 = 0;
    pbVar6 = local_2000;
    while ((pbVar2 = pbVar2 + 1, bVar1 != 0x5c && (bVar1 != 0))) {
      *pbVar6 = bVar1;
      pbVar6 = pbVar6 + 1;
      bVar1 = pbVar2[1];
    }
    *pbVar6 = 0;
    pbVar6 = local_4000;
    pbVar4 = unaff_EBX;
    do {
      bVar1 = *pbVar4;
      bVar7 = bVar1 < *pbVar6;
      if (bVar1 != *pbVar6) {
LAB_1006101c:
        iVar5 = (1 - (uint)bVar7) - (uint)(bVar7 != 0);
        goto LAB_10061021;
      }
      if (bVar1 == 0) break;
      bVar1 = pbVar4[1];
      bVar7 = bVar1 < pbVar6[1];
      if (bVar1 != pbVar6[1]) goto LAB_1006101c;
      pbVar4 = pbVar4 + 2;
      pbVar6 = pbVar6 + 2;
    } while (bVar1 != 0);
    iVar5 = 0;
LAB_10061021:
    if (iVar5 == 0) {
      iVar5 = (int)in_ECX - (int)pbVar2;
      do {
        bVar1 = *pbVar2;
        pbVar2[iVar5] = bVar1;
        pbVar2 = pbVar2 + 1;
      } while (bVar1 != 0);
      return;
    }
    in_ECX = pbVar2;
    if (*pbVar2 == 0) {
      return;
    }
  } while( true );
}


