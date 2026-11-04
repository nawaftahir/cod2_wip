extern unsigned int DAT_1019890c;
extern unsigned int DAT_10764584;
extern int FUN_100f6cf2();


void FUN_10037810(void)

{
  tm *_Tm;
  char *pcVar1;
  __time32_t local_4;
  
  if (g_10764584 == (FILE *)0x0) {
 
	int g_10764584 = DAT_10764584;   g_10764584 = (FILE *)FUN_100f6cf2("dx.log",&DAT_1019890c);
    if (g_10764584 != (FILE *)0x0) {
      FID_conflict___time32(&local_4);
      _Tm = _localtime((time_t *)&local_4);
      pcVar1 = _asctime(_Tm);
      _fprintf(g_10764584,"%s\n",pcVar1);
      _fflush(g_10764584);
    }
  }
  return;
}


