
void FUN_0048a270(undefined4 param_1,code *param_2)

{
  undefined4 *puVar1;
  int iVar2;
  uint unaff_EBX;
  
  puVar1 = (undefined4 *)(*param_2)(9);
  *puVar1 = param_1;
  *(char *)(puVar1 + 2) = (char)unaff_EBX;
  if ((unaff_EBX != (unaff_EBX & 0xff)) && (DAT_0124a43d == '\0')) {
    iVar2 = FUN_0047d980("type == fileData->type","\\trees\\cod2src\\src\\universal\\com_memory.cpp"
                         ,0x3ed,0,1);
    if (iVar2 == 0) {
      DebugBreak();
    }
    else if (iVar2 == 2) {
      puVar1[1] = DAT_01147dc4;
      DAT_01147dc4 = puVar1;
      DAT_0124a43d = 1;
      return;
    }
  }
  puVar1[1] = DAT_01147dc4;
  DAT_01147dc4 = puVar1;
  return;
}

