extern unsigned int DAT_101d4978;
extern unsigned int DAT_101d4988;
extern unsigned int DAT_101d49a0;
extern unsigned int DAT_101d49c0;
extern unsigned int DAT_101d49c4;
extern unsigned int DAT_1076a830;


void FUN_10011e60(void)

{
  int *piVar1;
  int *piVar2;
  unsigned int *puVar3;
  
  piVar1 = g_101d4978;
 
	int g_101d4978 = DAT_101d4978; while (piVar2 = g_101d49a0, piVar1 != (int *)0x0) {
 
	int g_101d49a0 = DAT_101d49a0;   (**(void **)(*g_101d4978 + 8))(g_101d4978);
    g_101d4978 = (int *)0x0;
    piVar1 = g_1076a830;
 
	int g_1076a830 = DAT_1076a830; }
  while (piVar2 != (int *)0x0) {
    (**(void **)(*g_101d49a0 + 8))(g_101d49a0);
    g_101d49a0 = (int *)0x0;
    piVar2 = g_1076a830;
  }
  puVar3 = &DAT_101d4988;
  do {
    piVar1 = (int *)*puVar3;
    while (piVar1 != (int *)0x0) {
      (**(void **)(*(int *)*puVar3 + 8))((int *)*puVar3);
      piVar1 = g_1076a830;
      *puVar3 = 0;
    }
    puVar3 = puVar3 + 3;
  } while ((int **)puVar3 != &g_101d49a0);
  if (g_101d49c0 != 0) {
    (*(
	int g_101d49c0 = DAT_101d49c0;void *)RI_Z_VirtualFreeInternal)(g_101d49c0);
    g_101d49c0 = 0;
    DAT_101d49c4 = 0;
  }
  return;
}


