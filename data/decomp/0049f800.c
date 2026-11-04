
void FUN_0049f800(void)

{
  char cVar1;
  int *in_EAX;
  int iVar2;
  char *pcVar3;
  char *pcVar4;
  int iVar5;
  uint uVar6;
  int *unaff_EBX;
  char *pcVar7;
  char *pcVar8;
  
  if ((int *)*unaff_EBX == (int *)0x0) {
    iVar5 = 0;
  }
  else {
    iVar5 = *(int *)*unaff_EBX;
  }
  if ((int *)*in_EAX == (int *)0x0) {
    iVar2 = 0;
  }
  else {
    iVar2 = *(int *)*in_EAX;
  }
  FUN_004a0380(iVar2 + iVar5 + 1,1);
  pcVar3 = (char *)FUN_0040af30();
  pcVar4 = pcVar3;
  do {
    cVar1 = *pcVar4;
    pcVar4 = pcVar4 + 1;
  } while (cVar1 != '\0');
  pcVar8 = (char *)(*(int *)(*unaff_EBX + 8) + -1);
  do {
    pcVar7 = pcVar8 + 1;
    pcVar8 = pcVar8 + 1;
  } while (*pcVar7 != '\0');
  pcVar7 = pcVar3;
  for (uVar6 = (uint)((int)pcVar4 - (int)pcVar3) >> 2; uVar6 != 0; uVar6 = uVar6 - 1) {
    *(undefined4 *)pcVar8 = *(undefined4 *)pcVar7;
    pcVar7 = pcVar7 + 4;
    pcVar8 = pcVar8 + 4;
  }
  for (uVar6 = (int)pcVar4 - (int)pcVar3 & 3; uVar6 != 0; uVar6 = uVar6 - 1) {
    *pcVar8 = *pcVar7;
    pcVar7 = pcVar7 + 1;
    pcVar8 = pcVar8 + 1;
  }
  *(int *)*unaff_EBX = iVar2 + iVar5;
  return;
}

