
void FUN_0049f740(void)

{
  char cVar1;
  char *in_EAX;
  int iVar2;
  char *pcVar3;
  char *pcVar4;
  uint uVar5;
  int *unaff_EBX;
  char *pcVar6;
  char *pcVar7;
  
  if (in_EAX == (char *)0x0) {
    if (DAT_0124a632 == '\0') {
      iVar2 = FUN_0047d980(&DAT_0053fb8c,"e:\\trees\\cod2src\\src\\universal\\splines\\util_str.h",
                           0x123);
      if (iVar2 == 0) {
        DebugBreak();
        return;
      }
      if (iVar2 == 2) {
        DAT_0124a632 = 1;
        return;
      }
    }
  }
  else {
    pcVar3 = in_EAX;
    do {
      cVar1 = *pcVar3;
      pcVar3 = pcVar3 + 1;
    } while (cVar1 != '\0');
    if ((int *)*unaff_EBX == (int *)0x0) {
      iVar2 = 0;
    }
    else {
      iVar2 = *(int *)*unaff_EBX;
    }
    FUN_004a0380(pcVar3 + (iVar2 - (int)(in_EAX + 1)) + 1,1);
    pcVar4 = in_EAX;
    do {
      cVar1 = *pcVar4;
      pcVar4 = pcVar4 + 1;
    } while (cVar1 != '\0');
    pcVar7 = (char *)(*(int *)(*unaff_EBX + 8) + -1);
    do {
      pcVar6 = pcVar7 + 1;
      pcVar7 = pcVar7 + 1;
    } while (*pcVar6 != '\0');
    pcVar6 = in_EAX;
    for (uVar5 = (uint)((int)pcVar4 - (int)in_EAX) >> 2; uVar5 != 0; uVar5 = uVar5 - 1) {
      *(undefined4 *)pcVar7 = *(undefined4 *)pcVar6;
      pcVar6 = pcVar6 + 4;
      pcVar7 = pcVar7 + 4;
    }
    for (uVar5 = (int)pcVar4 - (int)in_EAX & 3; uVar5 != 0; uVar5 = uVar5 - 1) {
      *pcVar7 = *pcVar6;
      pcVar6 = pcVar6 + 1;
      pcVar7 = pcVar7 + 1;
    }
    *(char **)*unaff_EBX = pcVar3 + (iVar2 - (int)(in_EAX + 1));
  }
  return;
}

