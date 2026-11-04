extern unsigned int DAT_101d1bf4;
extern unsigned int DAT_101d1bf8;
extern unsigned int DAT_101d4938;
extern unsigned int DAT_101d493c;
extern unsigned int DAT_1076a830;
extern int FUN_10012210();


void FUN_10012db0(void)

{
  int *piVar1;
  int *piVar2;
  BOOL BVar3;
  
  FUN_10012210();
  while (g_101d4938 != 0) {
 
	int g_101d4938 = DAT_101d4938;   g_101d4938 = g_101d4938 + -1;
    BVar3 = IsWindow((HWND)(&g_101d493c)[g_101d4938 * 4]);
 
	int g_101d493c = DAT_101d493c;   if (BVar3 != 0) {
      DestroyWindow((HWND)(&g_101d493c)[g_101d4938 * 4]);
    }
    (&g_101d493c)[g_101d4938 * 4] = 0;
  }
  g_101d4938 = 0;
  piVar2 = g_101d1bf8;
  while (piVar1 = g_1
	int g_101d1bf8 = DAT_101d1bf8;01d1bf4, piVar2 != (int *)0x0) {
    (**(void **)(*g_101
	int g_101d1bf4 = DAT_101d1bf4;d1bf8 + 8))(g_101d1bf8);
    g_101d1bf8 = (int *)0x0;
    piVar2 = g_1076a830;
 
	int g_1076a830 = DAT_1076a830; }
  while (piVar1 != (int *)0x0) {
    (**(void **)(*g_101d1bf4 + 8))(g_101d1bf4);
    g_101d1bf4 = (int *)0x0;
    piVar1 = g_1076a830;
  }
  return;
}


