extern unsigned int DAT_101ce708;
extern unsigned int DAT_101ce7ec;
extern unsigned int DAT_101d1bf8;
extern unsigned int DAT_1072e110;
extern unsigned int DAT_1072e210;
extern unsigned int DAT_1072e211;
extern unsigned int DAT_1072e212;
extern unsigned int DAT_1072e213;
extern unsigned int DAT_1072e430;
extern unsigned int DAT_1072e431;
extern unsigned int DAT_1072e432;
extern unsigned int DAT_1072e433;
extern unsigned int DAT_1072e540;
extern unsigned int DAT_1072e541;
extern unsigned int DAT_1072e542;
extern unsigned int DAT_1072e543;
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


void FUN_1003df90(unsigned int *param_1)

{
  int iVar1;
  int iVar2;
  unsigned int *puVar3;
  unsigned int *puVar4;
  
  iVar1 = DAT_10730550 * 0xcd0;
  puVar3 = param_1;
  puVar4 = (unsigned int *)(&DAT_1072e110 + iVar1);
  for (iVar2 = 0x10; iVar2 != 0; iVar2 = iVar2 + -1) {
    *puVar4 = *puVar3;
    puVar3 = puVar3 + 1;
    puVar4 = puVar4 + 1;
  }
  (&DAT_1072e210)[iVar1] = 1;
  (&DAT_1072e211)[iVar1] = 0;
  (&DAT_1072e212)[iVar1] = 0;
  (&DAT_1072e213)[iVar1] = 0;
  (&DAT_1072e430)[iVar1] = 0;
  (&DAT_1072e431)[iVar1] = 0;
  (&DAT_1072e432)[iVar1] = 0;
  (&DAT_1072e433)[iVar1] = 0;
  (&DAT_1072e650)[iVar1] = 0;
  (&DAT_1072e651)[iVar1] = 0;
  (&DAT_1072e652)[iVar1] = 0;
  (&DAT_1072e653)[iVar1] = 0;
  (&DAT_1072e760)[iVar1] = 0;
  (&DAT_1072e761)[iVar1] = 0;
  (&DAT_1072e762)[iVar1] = 0;
  (&DAT_1072e763)[iVar1] = 0;
  (&DAT_1072e540)[iVar1] = 0;
  (&DAT_1072e541)[iVar1] = 0;
  (&DAT_1072e542)[iVar1] = 0;
  (&DAT_1072e543)[iVar1] = 0;
  (&DAT_1072e870)[iVar1] = 0;
  (&DAT_1072e871)[iVar1] = 0;
  (&DAT_1072e872)[iVar1] = 0;
  (&DAT_1072e873)[iVar1] = 0;
  if (*(int *)(DAT_101ce708 + 8) == 2) {
    do {
      if ((*(int *)(DAT_101ce7ec + 8) != 0) && (g_10764584 != (FILE *)0x0)) {
 
	int g_10764584 = DAT_10764584;       _fprintf(g_10764584,"%s","dx.device->SetTransform( D3DTS_VIEW, matrix )\n");
        _fflush(g_10764584);
      }
      (**(void **)(*g_101d1bf8 + 0xb0))(g_101d1bf8,2,param_1);
    } whi
	int g_101d1bf8 = DAT_101d1bf8;le (DAT_1076a830 != 0);
  }
  return;
}


