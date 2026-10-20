
void FUN_0046cb10(void)

{
  char cVar1;
  char *in_EAX;
  int iVar2;
  char *pcVar3;
  char *pcVar4;
  uint uVar5;
  
  if ((in_EAX == (char *)0x0) && (DAT_0124a334 == '\0')) {
    iVar2 = FUN_0047d980(&PTR_DAT_0054f828,".\\qe3.cpp",0x17);
    if (iVar2 == 0) {
      DebugBreak();
    }
    else if (iVar2 == 2) {
      DAT_0124a334 = '\x01';
    }
  }
  pcVar3 = in_EAX;
  do {
    cVar1 = *pcVar3;
    pcVar3 = pcVar3 + 1;
  } while (cVar1 != '\0');
  pcVar3 = pcVar3 + (1 - (int)(in_EAX + 1));
  pcVar4 = (char *)thunk_FUN_004ff450(pcVar3);
  for (uVar5 = (uint)pcVar3 >> 2; uVar5 != 0; uVar5 = uVar5 - 1) {
    *(undefined4 *)pcVar4 = *(undefined4 *)in_EAX;
    in_EAX = in_EAX + 4;
    pcVar4 = pcVar4 + 4;
  }
  for (uVar5 = (uint)pcVar3 & 3; uVar5 != 0; uVar5 = uVar5 - 1) {
    *pcVar4 = *in_EAX;
    in_EAX = in_EAX + 1;
    pcVar4 = pcVar4 + 1;
  }
  return;
}

