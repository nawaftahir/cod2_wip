
void FUN_0048a170(undefined4 param_1,code *param_2)

{
  char cVar1;
  uint in_EAX;
  int iVar2;
  int iVar3;
  char *pcVar4;
  undefined4 *puVar5;
  char *unaff_ESI;
  
  iVar2 = FUN_0047db10(0x400);
  iVar3 = FUN_0048a0a0();
  if ((iVar3 != 0) && (DAT_0124a440 == '\0')) {
    iVar3 = FUN_0047d980("!Hunk_FindDataForFileInternal( type, name, hash )",
                         "\\trees\\cod2src\\src\\universal\\com_memory.cpp",0x3c7,0,1);
    if (iVar3 == 0) {
      DebugBreak();
    }
    else if (iVar3 == 2) {
      DAT_0124a440 = '\x01';
    }
  }
  pcVar4 = unaff_ESI;
  do {
    cVar1 = *pcVar4;
    pcVar4 = pcVar4 + 1;
  } while (cVar1 != '\0');
  puVar5 = (undefined4 *)(*param_2)(pcVar4 + (10 - (int)(unaff_ESI + 1)));
  *puVar5 = param_1;
  *(char *)(puVar5 + 2) = (char)in_EAX;
  if ((in_EAX != (in_EAX & 0xff)) && (DAT_0124a43f == '\0')) {
    iVar3 = FUN_0047d980("type == fileData->type","\\trees\\cod2src\\src\\universal\\com_memory.cpp"
                         ,0x3d1,0,1);
    if (iVar3 == 0) {
      DebugBreak();
    }
    else if (iVar3 == 2) {
      DAT_0124a43f = '\x01';
    }
  }
  iVar3 = 9 - (int)unaff_ESI;
  do {
    cVar1 = *unaff_ESI;
    unaff_ESI[(int)puVar5 + iVar3] = cVar1;
    unaff_ESI = unaff_ESI + 1;
  } while (cVar1 != '\0');
  puVar5[1] = (&DAT_01147dd8)[iVar2];
  (&DAT_01147dd8)[iVar2] = puVar5;
  return;
}

