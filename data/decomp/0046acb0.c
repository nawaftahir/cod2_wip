
void FUN_0046acb0(void)

{
  undefined4 *puVar1;
  int iVar2;
  undefined4 *unaff_EBX;
  char *pcVar3;
  char *pcVar4;
  bool bVar5;
  
  if ((DAT_010a4414 == &DAT_010a4410) && (DAT_0124a318 == '\0')) {
    iVar2 = FUN_0047d980("entities.next != &entities",".\\map.cpp",0x4bd,1,1);
    if (iVar2 == 0) {
      DebugBreak();
    }
    else if (iVar2 == 2) {
      DAT_0124a318 = '\x01';
    }
  }
  iVar2 = 0xb;
  bVar5 = true;
  pcVar3 = *(char **)(DAT_010a4414[0x14] + 4);
  pcVar4 = "worldspawn";
  do {
    if (iVar2 == 0) break;
    iVar2 = iVar2 + -1;
    bVar5 = *pcVar3 == *pcVar4;
    pcVar3 = pcVar3 + 1;
    pcVar4 = pcVar4 + 1;
  } while (bVar5);
  puVar1 = DAT_010a4414;
  if ((!bVar5) && (DAT_0124a317 == '\0')) {
    iVar2 = FUN_0047d980("!strcmp( entities.next->eclass->name, \"worldspawn\" )",".\\map.cpp",0x4be
                         ,1,1);
    if (iVar2 == 0) {
      DebugBreak();
      puVar1 = DAT_010a4414;
    }
    else {
      puVar1 = DAT_010a4414;
      if (iVar2 == 2) {
        DAT_0124a317 = '\x01';
      }
    }
  }
  for (; puVar1 != &DAT_010a4410; puVar1 = (undefined4 *)puVar1[1]) {
    (**(code **)*unaff_EBX)();
    FUN_00466c00(puVar1);
  }
  return;
}

