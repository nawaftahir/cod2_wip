
void FUN_004bbde0(int param_1)

{
  int iVar1;
  int unaff_ESI;
  char *pcVar2;
  char *pcVar3;
  bool bVar4;
  char *pcStack_24;
  undefined4 local_20;
  undefined1 local_1c [4];
  undefined1 local_18 [8];
  undefined1 local_10 [12];
  
  local_20 = 0;
  iVar1 = (**(code **)(*(int *)(param_1 + 0xc) + 0x10))(0,local_18,local_10);
  do {
    if (iVar1 == 0) {
      return;
    }
    iVar1 = 5;
    bVar4 = true;
    pcVar2 = pcStack_24;
    pcVar3 = "data";
    do {
      if (iVar1 == 0) break;
      iVar1 = iVar1 + -1;
      bVar4 = *pcVar2 == *pcVar3;
      pcVar2 = pcVar2 + 1;
      pcVar3 = pcVar3 + 1;
    } while (bVar4);
    if (!bVar4) {
      iVar1 = 5;
      bVar4 = true;
      pcVar2 = pcStack_24;
      pcVar3 = "func";
      do {
        if (iVar1 == 0) break;
        iVar1 = iVar1 + -1;
        bVar4 = *pcVar2 == *pcVar3;
        pcVar2 = pcVar2 + 1;
        pcVar3 = pcVar3 + 1;
      } while (bVar4);
      if (bVar4) {
        return;
      }
      FUN_004bbd20(&pcStack_24,local_1c);
    }
    unaff_ESI = unaff_ESI + 1;
    iVar1 = (**(code **)(*(int *)(param_1 + 0xc) + 0x10))(unaff_ESI,&pcStack_24,local_1c);
  } while( true );
}

