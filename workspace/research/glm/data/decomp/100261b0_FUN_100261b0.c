// 100261b0 size=138 FUN_100261b0

void FUN_100261b0(undefined4 param_1,undefined4 param_2,int param_3,undefined4 param_4)

{
  int iVar1;
  char cVar2;
  undefined4 *puVar3;
  int unaff_EBX;
  
  iVar1 = (param_3 * unaff_EBX + 6) * 3;
  puVar3 = (undefined4 *)(*(code *)RI_Z_MallocInternal)(iVar1);
  *puVar3 = 0;
  puVar3[1] = 0;
  puVar3[2] = 0;
  puVar3[3] = 0;
  *(undefined2 *)(puVar3 + 4) = 0;
  *(char *)((int)puVar3 + 0xd) = (char)((uint)param_3 >> 8);
  *(char *)(puVar3 + 3) = (char)param_3;
  *(char *)((int)puVar3 + 0xf) = (char)((uint)unaff_EBX >> 8);
  *(undefined1 *)((int)puVar3 + 2) = 2;
  *(char *)((int)puVar3 + 0xe) = (char)unaff_EBX;
  *(undefined1 *)(puVar3 + 4) = 0x18;
  *(undefined1 *)((int)puVar3 + 0x11) = 0x20;
  cVar2 = FUN_10025e80(param_3);
  if (cVar2 != '\0') {
    (*(code *)RI_FS_FileExists)(param_4,puVar3,iVar1);
  }
  (*(code *)RI_Z_FreeInternal)(puVar3);
  return;
}


