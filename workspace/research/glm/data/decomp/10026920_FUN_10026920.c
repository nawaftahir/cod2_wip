// 10026920 size=154 FUN_10026920

void FUN_10026920(undefined4 param_1)

{
  int iVar1;
  ushort uVar2;
  undefined1 uVar3;
  undefined4 *puVar4;
  int unaff_EBX;
  
  iVar1 = (uint)DAT_101d4928 * (uint)DAT_101d4928 * 4 + 0x12;
  puVar4 = (undefined4 *)(*(code *)RI_Z_MallocInternal)(iVar1);
  uVar2 = DAT_101d4928;
  *puVar4 = 0;
  puVar4[1] = 0;
  puVar4[2] = 0;
  puVar4[3] = 0;
  *(undefined2 *)(puVar4 + 4) = 0;
  uVar3 = (undefined1)(uVar2 >> 8);
  *(undefined1 *)((int)puVar4 + 0xd) = uVar3;
  *(undefined1 *)((int)puVar4 + 0xf) = uVar3;
  *(undefined1 *)((int)puVar4 + 2) = 2;
  uVar3 = (undefined1)uVar2;
  *(undefined1 *)(puVar4 + 3) = uVar3;
  *(undefined1 *)((int)puVar4 + 0xe) = uVar3;
  *(undefined1 *)(puVar4 + 4) = 0x20;
  FUN_100267e0();
  FUN_10026840();
  (*(code *)RI_FS_FileExists)(param_1,puVar4,iVar1);
  (*(code *)RI_Z_FreeInternal)(puVar4);
  (*(code *)RI_Z_FreeInternal)(*(undefined4 *)(&DAT_10696bb0 + unaff_EBX * 4));
  return;
}


