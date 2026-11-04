// 10018ff0 size=197 FUN_10018ff0

undefined4 FUN_10018ff0(void)

{
  char cVar1;
  char *in_EAX;
  int iVar2;
  char *unaff_EBX;
  char *pcVar3;
  char *pcVar4;
  bool bVar5;
  char local_4 [4];
  
  iVar2 = 9;
  bVar5 = true;
  pcVar3 = in_EAX;
  pcVar4 = "position";
  do {
    if (iVar2 == 0) break;
    iVar2 = iVar2 + -1;
    bVar5 = *pcVar3 == *pcVar4;
    pcVar3 = pcVar3 + 1;
    pcVar4 = pcVar4 + 1;
  } while (bVar5);
  if (bVar5) {
    *unaff_EBX = '\0';
    return 1;
  }
  iVar2 = 7;
  bVar5 = true;
  pcVar3 = in_EAX;
  pcVar4 = "normal";
  do {
    if (iVar2 == 0) break;
    iVar2 = iVar2 + -1;
    bVar5 = *pcVar3 == *pcVar4;
    pcVar3 = pcVar3 + 1;
    pcVar4 = pcVar4 + 1;
  } while (bVar5);
  if (bVar5) {
    *unaff_EBX = '\x01';
    return 1;
  }
  iVar2 = 6;
  bVar5 = true;
  pcVar3 = in_EAX;
  pcVar4 = "color";
  do {
    if (iVar2 == 0) break;
    iVar2 = iVar2 + -1;
    bVar5 = *pcVar3 == *pcVar4;
    pcVar3 = pcVar3 + 1;
    pcVar4 = pcVar4 + 1;
  } while (bVar5);
  if (bVar5) {
    cVar1 = FUN_10018f90(local_4);
    if (cVar1 != '\0') {
      *unaff_EBX = local_4[0] + '\x02';
      return 1;
    }
  }
  else {
    iVar2 = 9;
    bVar5 = true;
    pcVar3 = "texcoord";
    do {
      if (iVar2 == 0) break;
      iVar2 = iVar2 + -1;
      bVar5 = *in_EAX == *pcVar3;
      in_EAX = in_EAX + 1;
      pcVar3 = pcVar3 + 1;
    } while (bVar5);
    if (bVar5) {
      cVar1 = FUN_10018f90(local_4);
      if (cVar1 != '\0') {
        *unaff_EBX = local_4[0] + '\x04';
        return 1;
      }
    }
    else {
      FUN_1005f360("unknown stream destination \'%s\'\n");
    }
  }
  return 0;
}


