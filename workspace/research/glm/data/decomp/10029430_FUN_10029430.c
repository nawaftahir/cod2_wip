// 10029430 size=53 FUN_10029430

void FUN_10029430(void)

{
  undefined4 *puVar1;
  
  puVar1 = &DAT_10696c44;
  do {
    *(undefined1 *)(puVar1 + -1) = 0;
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


