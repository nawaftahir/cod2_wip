extern unsigned int DAT_101d1b9c;
extern int FUN_10026110();


void FUN_10026290(void)

{
  unsigned int *puVar1;
  char local_104 [260];
  
  _sprintf(local_104,"levelshots/%s.tga",*(unsigned int *)(DAT_101d1b9c + 4));
  puVar1 = (unsigned int *)FUN_10026110(0x80,0x12);
  if (puVar1 != (unsigned int *)0x0) {
    *puVar1 = 0;
    puVar1[1] = 0;
    puVar1[2] = 0;
    puVar1[3] = 0;
    *(unsigned short *)(puVar1 + 4) = 0;
    *(unsigned char *)((int)puVar1 + 2) = 2;
    *(unsigned char *)(puVar1 + 3) = 0x80;
    *(unsigned char *)((int)puVar1 + 0xe) = 0x80;
    *(unsigned char *)(puVar1 + 4) = 0x18;
    (*(void *)RI_FS_FileExists)(local_104,puVar1,0xc012);
    (*(void *)RI_Z_FreeInternal)(puVar1);
    (*(void *)RI_Printf)(0,"Wrote %s\n",local_104);
  }
  return;
}


