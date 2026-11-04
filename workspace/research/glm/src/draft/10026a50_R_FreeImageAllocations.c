extern unsigned int DAT_101ce7ec;
extern unsigned int DAT_101d1bf8;
extern unsigned int DAT_101d4928;
extern unsigned int DAT_101d492a;
extern unsigned int DAT_10764584;
extern unsigned int DAT_1076a830;
extern int FUN_1003ea30();


void R_FreeImageAllocations(unsigned short param_1,unsigned short param_2)

{
  DAT_101d4928 = param_1;
  DAT_101d492a = param_2;
  FUN_1003ea30();
  do {
    if ((*(int *)(DAT_101ce7ec + 8) != 0) && (g_10764584 != (FILE *)0x0)) {
 
	int g_10764584 = DAT_10764584;     _fprintf(g_10764584,"%s",
               "dx.device->Clear( 0, 0, 0x00000001l | 0x00000002l | 0x00000004l, ((D3DCOLOR)((((255)&0xff)<<24)|(((255)&0xff)<<16)|(((0)&0xff)<<8)|((255)&0xff))), 1, 0 )\n"
              );
      _fflush(g_10764584);
    }
    (**(void **)(*g_101d1bf8 + 0xac))(g_101d1bf8,0,0,7,0xffff00ff,0x3f800000,0);
  } while
	int g_101d1bf8 = DAT_101d1bf8; (DAT_1076a830 != 0);
  return;
}


