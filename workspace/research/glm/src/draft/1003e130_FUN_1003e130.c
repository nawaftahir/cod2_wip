extern unsigned int DAT_101ce708;
extern unsigned int DAT_101ce7ec;
extern unsigned int DAT_101d1bf8;
extern unsigned int DAT_1072e220;
extern unsigned int DAT_1072e320;
extern unsigned int DAT_1072e321;
extern unsigned int DAT_1072e322;
extern unsigned int DAT_1072e323;
extern unsigned int DAT_1072e650;
extern unsigned int DAT_1072e651;
extern unsigned int DAT_1072e652;
extern unsigned int DAT_1072e653;
extern unsigned int DAT_1072e760;
extern unsigned int DAT_1072e761;
extern unsigned int DAT_1072e762;
extern unsigned int DAT_1072e763;
extern unsigned int DAT_1072e870;
extern unsigned int DAT_1072e871;
extern unsigned int DAT_1072e872;
extern unsigned int DAT_1072e873;
extern unsigned int DAT_10730550;
extern unsigned int DAT_10764584;
extern unsigned int DAT_1076a830;


void FUN_1003e130(void)

{
  int iVar1;
  int iVar2;
  
  iVar1 = DAT_101ce708;
  iVar2 = DAT_10730550 * 0xcd0;
  (&DAT_1072e320)[iVar2] = 1;
  (&DAT_1072e321)[iVar2] = 0;
  (&DAT_1072e322)[iVar2] = 0;
  (&DAT_1072e323)[iVar2] = 0;
  (&DAT_1072e650)[iVar2] = 0;
  (&DAT_1072e651)[iVar2] = 0;
  (&DAT_1072e652)[iVar2] = 0;
  (&DAT_1072e653)[iVar2] = 0;
  (&DAT_1072e760)[iVar2] = 0;
  (&DAT_1072e761)[iVar2] = 0;
  (&DAT_1072e762)[iVar2] = 0;
  (&DAT_1072e763)[iVar2] = 0;
  (&DAT_1072e870)[iVar2] = 0;
  (&DAT_1072e871)[iVar2] = 0;
  (&DAT_1072e872)[iVar2] = 0;
  (&DAT_1072e873)[iVar2] = 0;
  if (*(int *)(iVar1 + 8) == 2) {
    do {
      if ((*(int *)(DAT_101ce7ec + 8) != 0) && (g_10764584 != (FILE *)0x0)) {
 
	int g_10764584 = DAT_10764584;       _fprintf(g_10764584,"%s",
                 "dx.device->SetTransform( D3DTS_PROJECTION, &activeMatrices->projection.matrix[0] )\n"
                );
        _fflush(g_10764584);
      }
      (**(void **)(*g_101d1bf8 + 0xb0))(g_101d1bf8,3,&DAT_1072e220 + iVar2);
    } whi
	int g_101d1bf8 = DAT_101d1bf8;le (DAT_1076a830 != 0);
  }
  return;
}


