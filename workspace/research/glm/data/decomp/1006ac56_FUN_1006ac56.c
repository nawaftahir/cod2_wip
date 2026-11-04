// 1006ac56 size=222 FUN_1006ac56

int FUN_1006ac56(void)

{
  int iVar1;
  int in_ECX;
  char *pcVar2;
  char *pcVar3;
  char *pcVar4;
  bool bVar5;
  
  while( true ) {
    iVar1 = FUN_1006709e((int *)(in_ECX + 0x10));
    if (iVar1 < 0) {
      *(undefined4 *)(in_ECX + 0x4c) = 1;
      *(undefined4 *)(in_ECX + 0x50) = 1;
      return -1;
    }
    iVar1 = *(int *)(in_ECX + 0x10);
    if (iVar1 < 10) break;
    if (iVar1 == 10) {
      return 0x110;
    }
    if (iVar1 != 0xc) {
      if (iVar1 != 0xd) {
        return 0x110;
      }
      return -1;
    }
  }
  if (iVar1 != 9) {
    if (iVar1 == 0) {
      return 0x110;
    }
    if (iVar1 == 1) {
      if (*(char *)(in_ECX + 0x19) != '\0') {
        return 0x110;
      }
      return (int)*(char *)(in_ECX + 0x18);
    }
    if (iVar1 < 2) {
      return 0x110;
    }
    if (4 < iVar1) {
      if (8 < iVar1) {
        return 0x110;
      }
      return 0x10f;
    }
    return 0x10e;
  }
  pcVar3 = *(char **)(in_ECX + 0x18);
  iVar1 = 0xb;
  bVar5 = true;
  pcVar2 = pcVar3;
  pcVar4 = "entrypoint";
  do {
    if (iVar1 == 0) break;
    iVar1 = iVar1 + -1;
    bVar5 = *pcVar2 == *pcVar4;
    pcVar2 = pcVar2 + 1;
    pcVar4 = pcVar4 + 1;
  } while (bVar5);
  if (bVar5) {
    iVar1 = 0x101;
  }
  else {
    iVar1 = 5;
    bVar5 = true;
    pcVar2 = pcVar3;
    pcVar4 = "true";
    do {
      if (iVar1 == 0) break;
      iVar1 = iVar1 + -1;
      bVar5 = *pcVar2 == *pcVar4;
      pcVar2 = pcVar2 + 1;
      pcVar4 = pcVar4 + 1;
    } while (bVar5);
    if (bVar5) {
      iVar1 = 0x111;
    }
    else {
      iVar1 = 6;
      bVar5 = true;
      pcVar2 = "false";
      do {
        if (iVar1 == 0) break;
        iVar1 = iVar1 + -1;
        bVar5 = *pcVar3 == *pcVar2;
        pcVar3 = pcVar3 + 1;
        pcVar2 = pcVar2 + 1;
      } while (bVar5);
      if (bVar5) {
        iVar1 = 0x112;
      }
      else if (*(int *)(in_ECX + 0x38) == -1) {
        iVar1 = 0x10d;
      }
      else {
        iVar1 = FUN_10068daa(in_ECX + 0x10);
      }
    }
  }
  return iVar1;
}


