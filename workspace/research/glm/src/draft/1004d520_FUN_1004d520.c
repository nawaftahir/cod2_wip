extern int FUN_1004d460();


void FUN_1004d520(int *param_1)

{
  unsigned int *puVar1;
  
  puVar1 = (unsigned int *)param_1[0x66];
  *puVar1 = FUN_1004d460;
  *(unsigned char *)(puVar1 + 4) = 0;
  *(unsigned char *)((int)puVar1 + 0x11) = 0;
  *(unsigned char *)(puVar1 + 5) = 1;
  (**(void **)(*param_1 + 0x10))(param_1);
  (**(void **)param_1[0x67])(param_1);
  param_1[0x25] = 0;
  return;
}


