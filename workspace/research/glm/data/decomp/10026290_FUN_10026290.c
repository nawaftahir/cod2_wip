// 10026290 size=159 FUN_10026290

void FUN_10026290(void)

{
  undefined4 *puVar1;
  char local_104 [260];
  
  _sprintf(local_104,"levelshots/%s.tga",*(undefined4 *)(DAT_101d1b9c + 4));
  puVar1 = (undefined4 *)FUN_10026110(0x80,0x12);
  if (puVar1 != (undefined4 *)0x0) {
    *puVar1 = 0;
    puVar1[1] = 0;
    puVar1[2] = 0;
    puVar1[3] = 0;
    *(undefined2 *)(puVar1 + 4) = 0;
    *(undefined1 *)((int)puVar1 + 2) = 2;
    *(undefined1 *)(puVar1 + 3) = 0x80;
    *(undefined1 *)((int)puVar1 + 0xe) = 0x80;
    *(undefined1 *)(puVar1 + 4) = 0x18;
    (*(code *)RI_FS_FileExists)(local_104,puVar1,0xc012);
    (*(code *)RI_Z_FreeInternal)(puVar1);
    (*(code *)RI_Printf)(0,"Wrote %s\n",local_104);
  }
  return;
}


