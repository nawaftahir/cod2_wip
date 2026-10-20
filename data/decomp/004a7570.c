
void FUN_004a7570(void)

{
  uint uVar1;
  byte bVar2;
  uint uVar4;
  char cVar5;
  byte bVar3;
  
  uVar1 = 0;
  do {
    cVar5 = '\0';
    for (uVar4 = uVar1; uVar4 != 0; uVar4 = (int)uVar4 >> 1) {
      if ((uVar4 & 1) != 0) {
        cVar5 = cVar5 + '\x01';
      }
    }
    (&DAT_01203000)[uVar1] = cVar5;
    bVar3 = 8;
    bVar2 = 8;
    if ((char)uVar1 != '\0') {
      do {
        bVar2 = bVar3 - 1;
        bVar3 = bVar2;
      } while ((uVar1 & (1 << (bVar2 & 0x1f)) - 1U) != 0);
    }
    cVar5 = '\0';
    (&DAT_01202f00)[uVar1] = bVar2;
    for (uVar4 = uVar1; uVar4 != 0; uVar4 = (int)uVar4 >> 1) {
      cVar5 = cVar5 + '\x01';
    }
    (&DAT_01203100)[uVar1] = cVar5;
    uVar1 = uVar1 + 1;
  } while ((int)uVar1 < 0x100);
  return;
}

