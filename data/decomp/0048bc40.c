
void FUN_0048bc40(int param_1)

{
  byte bVar1;
  byte *in_EAX;
  undefined4 uVar2;
  byte *pbVar3;
  int iVar4;
  byte *pbVar5;
  byte *pbVar6;
  bool bVar7;
  
  pbVar6 = *(byte **)(param_1 + 8);
  if (pbVar6 != (byte *)0x0) {
    pbVar3 = in_EAX;
    pbVar5 = pbVar6;
    if (in_EAX == pbVar6) goto LAB_0048bc85;
    do {
      bVar1 = *pbVar3;
      bVar7 = bVar1 < *pbVar5;
      if (bVar1 != *pbVar5) {
LAB_0048bc7c:
        iVar4 = (1 - (uint)bVar7) - (uint)(bVar7 != 0);
        goto LAB_0048bc81;
      }
      if (bVar1 == 0) break;
      bVar1 = pbVar3[1];
      bVar7 = bVar1 < pbVar5[1];
      if (bVar1 != pbVar5[1]) goto LAB_0048bc7c;
      pbVar3 = pbVar3 + 2;
      pbVar5 = pbVar5 + 2;
    } while (bVar1 != 0);
    iVar4 = 0;
LAB_0048bc81:
    if (iVar4 == 0) goto LAB_0048bc85;
  }
  pbVar6 = *(byte **)(param_1 + 0x10);
  if (pbVar6 == (byte *)0x0) {
LAB_0048bccf:
    uVar2 = FUN_0048b9b0();
    *(undefined4 *)(param_1 + 0xc) = uVar2;
    return;
  }
  pbVar3 = pbVar6;
  if (in_EAX != pbVar6) {
    do {
      bVar1 = *in_EAX;
      bVar7 = bVar1 < *pbVar3;
      if (bVar1 != *pbVar3) {
LAB_0048bcc6:
        iVar4 = (1 - (uint)bVar7) - (uint)(bVar7 != 0);
        goto LAB_0048bccb;
      }
      if (bVar1 == 0) break;
      bVar1 = in_EAX[1];
      bVar7 = bVar1 < pbVar3[1];
      if (bVar1 != pbVar3[1]) goto LAB_0048bcc6;
      in_EAX = in_EAX + 2;
      pbVar3 = pbVar3 + 2;
    } while (bVar1 != 0);
    iVar4 = 0;
LAB_0048bccb:
    if (iVar4 != 0) goto LAB_0048bccf;
  }
LAB_0048bc85:
  *(byte **)(param_1 + 0xc) = pbVar6;
  return;
}

