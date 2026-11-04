extern unsigned int DAT_101ce708;
extern unsigned int DAT_101ce7ec;
extern unsigned int DAT_101d1bf8;
extern unsigned int DAT_1072def0;
extern unsigned int DAT_1072e110;
extern unsigned int DAT_1072e220;
extern unsigned int DAT_10730550;
extern unsigned int DAT_10764584;
extern unsigned int DAT_1076a830;


void FUN_1003e4b0(void)

{
  g_10730550 = g_10730550 + -1;
  i
	int g_10730550 = DAT_10730550;f (*(int *)(DAT_101ce708 + 8) == 2) {
    do {
      if ((*(int *)(g_101ce7ec + 8) != 0) && (g_10764584 != (FILE *)0x0)) {
 
	int g_10764584 = DAT_10764584;      
	int g_101ce7ec = DAT_101ce7ec; _fprintf(g_10764584,"%s",
                 "dx.device->SetTransform( (D3DTRANSFORMSTATETYPE)(0 + 256), &backEnd.codeMatrixStack[backEnd.codeMatrixStackLevel].world.matrix[0] )\n"
                );
        _fflush(g_10764584);
      }
      (**(void **)(*g_101d1bf8 + 0xb0))(g_101d1bf8,0x100,&DAT_1072def0 + g_10730550 * 0xcd0);
    } while (g_
	int g_101d1bf8 = DAT_101d1bf8;1076a830 != 0);
 
	int g_1076a830 = DAT_1076a830;   do {
      if ((*(int *)(g_101ce7ec + 8) != 0) && (g_10764584 != (FILE *)0x0)) {
        _fprintf(g_10764584,"%s",
                 "dx.device->SetTransform( D3DTS_VIEW, &backEnd.codeMatrixStack[backEnd.codeMatrixStackLevel].view.matrix[0] )\n"
                );
        _fflush(g_10764584);
      }
      (**(void **)(*g_101d1bf8 + 0xb0))(g_101d1bf8,2,&DAT_1072e110 + g_10730550 * 0xcd0);
    } while (g_1076a830 != 0);
    do {
      if ((*(int *)(g_101ce7ec + 8) != 0) && (g_10764584 != (FILE *)0x0)) {
        _fprintf(g_10764584,"%s",
                 "dx.device->SetTransform( D3DTS_PROJECTION, &backEnd.codeMatrixStack[backEnd.codeMatrixStackLevel].projection.matrix[0] )\n"
                );
        _fflush(g_10764584);
      }
      (**(void **)(*g_101d1bf8 + 0xb0))(g_101d1bf8,3,&DAT_1072e220 + g_10730550 * 0xcd0);
    } while (g_1076a830 != 0);
  }
  return;
}


