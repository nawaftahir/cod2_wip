// 100108a0 size=519 FUN_100108a0

undefined4 FUN_100108a0(void)

{
  char *in_EAX;
  undefined4 uVar1;
  int iVar2;
  char *pcVar3;
  char *pcVar4;
  bool bVar5;
  
  iVar2 = 7;
  bVar5 = true;
  pcVar3 = in_EAX;
  pcVar4 = "$white";
  do {
    if (iVar2 == 0) break;
    iVar2 = iVar2 + -1;
    bVar5 = *pcVar3 == *pcVar4;
    pcVar3 = pcVar3 + 1;
    pcVar4 = pcVar4 + 1;
  } while (bVar5);
  if (bVar5) {
    uVar1 = FUN_1000cc10();
    FUN_100100f0(uVar1,0xff);
    return uVar1;
  }
  iVar2 = 7;
  bVar5 = true;
  pcVar3 = in_EAX;
  pcVar4 = "$black";
  do {
    if (iVar2 == 0) break;
    iVar2 = iVar2 + -1;
    bVar5 = *pcVar3 == *pcVar4;
    pcVar3 = pcVar3 + 1;
    pcVar4 = pcVar4 + 1;
  } while (bVar5);
  if (bVar5) {
    uVar1 = FUN_1000cc10();
    FUN_100100f0(uVar1,0xff);
    return uVar1;
  }
  iVar2 = 0x13;
  bVar5 = true;
  pcVar3 = in_EAX;
  pcVar4 = "$identitynormalmap";
  do {
    if (iVar2 == 0) break;
    iVar2 = iVar2 + -1;
    bVar5 = *pcVar3 == *pcVar4;
    pcVar3 = pcVar3 + 1;
    pcVar4 = pcVar4 + 1;
  } while (bVar5);
  if (bVar5) {
    uVar1 = FUN_1000cc10();
    FUN_100100f0(uVar1,0x80);
    return uVar1;
  }
  iVar2 = 0xd;
  bVar5 = true;
  pcVar3 = in_EAX;
  pcVar4 = "$specularity";
  do {
    if (iVar2 == 0) break;
    iVar2 = iVar2 + -1;
    bVar5 = *pcVar3 == *pcVar4;
    pcVar3 = pcVar3 + 1;
    pcVar4 = pcVar4 + 1;
  } while (bVar5);
  if (bVar5) {
    uVar1 = FUN_1000cc10();
    FUN_1000fce0();
    return uVar1;
  }
  iVar2 = 9;
  bVar5 = true;
  pcVar3 = in_EAX;
  pcVar4 = "$outdoor";
  do {
    if (iVar2 == 0) break;
    iVar2 = iVar2 + -1;
    bVar5 = *pcVar3 == *pcVar4;
    pcVar3 = pcVar3 + 1;
    pcVar4 = pcVar4 + 1;
  } while (bVar5);
  if (bVar5) {
    uVar1 = FUN_1000cc10();
    FUN_10020a70();
    return uVar1;
  }
  iVar2 = 0x11;
  bVar5 = true;
  pcVar3 = in_EAX;
  pcVar4 = "$lightmapweights";
  do {
    if (iVar2 == 0) break;
    iVar2 = iVar2 + -1;
    bVar5 = *pcVar3 == *pcVar4;
    pcVar3 = pcVar3 + 1;
    pcVar4 = pcVar4 + 1;
  } while (bVar5);
  if (bVar5) {
    uVar1 = FUN_1000cc10();
    FUN_1000fe90(uVar1);
    return uVar1;
  }
  iVar2 = 0x13;
  bVar5 = true;
  pcVar3 = in_EAX;
  pcVar4 = "$lightgridweights0";
  do {
    if (iVar2 == 0) break;
    iVar2 = iVar2 + -1;
    bVar5 = *pcVar3 == *pcVar4;
    pcVar3 = pcVar3 + 1;
    pcVar4 = pcVar4 + 1;
  } while (bVar5);
  if (bVar5) {
    uVar1 = FUN_1000cc10();
    FUN_10010680(0);
    return uVar1;
  }
  iVar2 = 0x13;
  bVar5 = true;
  pcVar3 = in_EAX;
  pcVar4 = "$lightgridweights1";
  do {
    if (iVar2 == 0) break;
    iVar2 = iVar2 + -1;
    bVar5 = *pcVar3 == *pcVar4;
    pcVar3 = pcVar3 + 1;
    pcVar4 = pcVar4 + 1;
  } while (bVar5);
  if (bVar5) {
    uVar1 = FUN_1000cc10();
    FUN_10010680(1);
    return uVar1;
  }
  iVar2 = 0xc;
  bVar5 = true;
  pcVar3 = in_EAX;
  pcVar4 = "$watercolor";
  do {
    if (iVar2 == 0) break;
    iVar2 = iVar2 + -1;
    bVar5 = *pcVar3 == *pcVar4;
    pcVar3 = pcVar3 + 1;
    pcVar4 = pcVar4 + 1;
  } while (bVar5);
  if (bVar5) {
    uVar1 = FUN_1000cc10();
    FUN_10010850(uVar1,0x33);
    return uVar1;
  }
  iVar2 = 0xe;
  bVar5 = true;
  pcVar3 = "$sunhalfangle";
  do {
    if (iVar2 == 0) break;
    iVar2 = iVar2 + -1;
    bVar5 = *in_EAX == *pcVar3;
    in_EAX = in_EAX + 1;
    pcVar3 = pcVar3 + 1;
  } while (bVar5);
  if (bVar5) {
    uVar1 = FUN_1000cc10();
    FUN_100107b0(uVar1);
    return uVar1;
  }
  FUN_10061c80("ERROR: Unknown built-in image \'%s\'");
  return 0;
}


