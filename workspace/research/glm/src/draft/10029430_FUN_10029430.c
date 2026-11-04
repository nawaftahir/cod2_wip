extern unsigned int DAT_10696c44;
extern unsigned int DAT_10696cd0;


void FUN_10029430(void)

{
  unsigned int *puVar1;
  
  puVar1 = &DAT_10696c44;
  do {
    *(unsigned char *)(puVar1 + -1) = 0;
    *puVar1 = 0xffffffff;
    puVar1[1] = 0xffffffff;
    puVar1[2] = 0xffffffff;
    puVar1[3] = 0xffffffff;
    puVar1[4] = 0xffffffff;
    puVar1[5] = 0xffffffff;
    puVar1 = puVar1 + 7;
  } while (puVar1 != &DAT_10696cd0);
  return;
}


