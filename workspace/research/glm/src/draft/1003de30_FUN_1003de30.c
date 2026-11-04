extern unsigned int DAT_101ce708;
extern unsigned int DAT_101ce7ec;
extern unsigned int DAT_101d1bf8;
extern unsigned int DAT_1072dee0;
extern unsigned int DAT_1072def0;
extern unsigned int DAT_1072dff0;
extern unsigned int DAT_1072dff1;
extern unsigned int DAT_1072dff2;
extern unsigned int DAT_1072dff3;
extern unsigned int DAT_1072e100;
extern unsigned int DAT_1072e101;
extern unsigned int DAT_1072e102;
extern unsigned int DAT_1072e103;
extern unsigned int DAT_1072e430;
extern unsigned int DAT_1072e431;
extern unsigned int DAT_1072e432;
extern unsigned int DAT_1072e433;
extern unsigned int DAT_1072e540;
extern unsigned int DAT_1072e541;
extern unsigned int DAT_1072e542;
extern unsigned int DAT_1072e543;
extern unsigned int DAT_1072e760;
extern unsigned int DAT_1072e761;
extern unsigned int DAT_1072e762;
extern unsigned int DAT_1072e763;
extern unsigned int DAT_1072e870;
extern unsigned int DAT_1072e871;
extern unsigned int DAT_1072e872;
extern unsigned int DAT_1072e873;
extern unsigned int DAT_1072e980;
extern unsigned int DAT_1072e981;
extern unsigned int DAT_1072e982;
extern unsigned int DAT_1072e983;
extern unsigned int DAT_1072ea90;
extern unsigned int DAT_1072ea91;
extern unsigned int DAT_1072ea92;
extern unsigned int DAT_1072ea93;
extern unsigned int DAT_1072eba0;
extern unsigned int DAT_1072eba1;
extern unsigned int DAT_1072eba2;
extern unsigned int DAT_1072eba3;
extern unsigned int DAT_10730550;
extern unsigned int DAT_10764584;
extern unsigned int DAT_1076a830;


void FUN_1003de30(unsigned int param_1)

{
  int iVar1;
  int iVar2;
  
  iVar1 = DAT_101ce708;
  iVar2 = DAT_10730550 * 0xcd0;
  *(unsigned int *)(&DAT_1072dee0 + iVar2) = param_1;
  (&DAT_1072dff0)[iVar2] = 1;
  (&DAT_1072dff1)[iVar2] = 0;
  (&DAT_1072dff2)[iVar2] = 0;
  (&DAT_1072dff3)[iVar2] = 0;
  (&DAT_1072e430)[iVar2] = 0;
  (&DAT_1072e431)[iVar2] = 0;
  (&DAT_1072e432)[iVar2] = 0;
  (&DAT_1072e433)[iVar2] = 0;
  (&DAT_1072e760)[iVar2] = 0;
  (&DAT_1072e761)[iVar2] = 0;
  (&DAT_1072e762)[iVar2] = 0;
  (&DAT_1072e763)[iVar2] = 0;
  (&DAT_1072e100)[iVar2] = 0;
  (&DAT_1072e101)[iVar2] = 0;
  (&DAT_1072e102)[iVar2] = 0;
  (&DAT_1072e103)[iVar2] = 0;
  (&DAT_1072e540)[iVar2] = 0;
  (&DAT_1072e541)[iVar2] = 0;
  (&DAT_1072e542)[iVar2] = 0;
  (&DAT_1072e543)[iVar2] = 0;
  (&DAT_1072e870)[iVar2] = 0;
  (&DAT_1072e871)[iVar2] = 0;
  (&DAT_1072e872)[iVar2] = 0;
  (&DAT_1072e873)[iVar2] = 0;
  (&DAT_1072e980)[iVar2] = 0;
  (&DAT_1072e981)[iVar2] = 0;
  (&DAT_1072e982)[iVar2] = 0;
  (&DAT_1072e983)[iVar2] = 0;
  (&DAT_1072ea90)[iVar2] = 0;
  (&DAT_1072ea91)[iVar2] = 0;
  (&DAT_1072ea92)[iVar2] = 0;
  (&DAT_1072ea93)[iVar2] = 0;
  (&DAT_1072eba0)[iVar2] = 0;
  (&DAT_1072eba1)[iVar2] = 0;
  (&DAT_1072eba2)[iVar2] = 0;
  (&DAT_1072eba3)[iVar2] = 0;
  if (*(int *)(iVar1 + 8) == 2) {
    do {
      if ((*(int *)(DAT_101ce7ec + 8) != 0) && (g_10764584 != (FILE *)0x0)) {
 
	int g_10764584 = DAT_10764584;       _fprintf(g_10764584,"%s",
                 "dx.device->SetTransform( (D3DTRANSFORMSTATETYPE)(0 + 256), &activeMatrices->world.matrix[0] )\n"
                );
        _fflush(g_10764584);
      }
      (**(void **)(*g_101d1bf8 + 0xb0))(g_101d1bf8,0x100,&DAT_1072def0 + iVar2);
    } whi
	int g_101d1bf8 = DAT_101d1bf8;le (DAT_1076a830 != 0);
  }
  return;
}


