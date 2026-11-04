extern unsigned int DAT_1072dde0;
extern unsigned int DAT_1072dde4;
extern unsigned int DAT_1072dde8;
extern unsigned int DAT_1072ddec;
extern unsigned int DAT_1072debc;
extern unsigned int DAT_1072debd;
extern unsigned int DAT_1076671c;
extern unsigned int DAT_10766720;
extern unsigned int DAT_10766724;


/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_1003e690(void)

{
  float fVar1;
  unsigned int local_10;
  unsigned int local_c;
  unsigned int local_8;
  unsigned int local_4;
  
  _DAT_1072dcb8 = 1.0 / (float)g_1076671c;
 
	int g_1076671c = DAT_1076671c; DAT_1072debd = 0;
  DAT_1072debc = 1;
  _DAT_1072dcbc = 1.0 / (float)g_10766720;
 
	int g_10766720 = DAT_10766720; if (DAT_10766724 == 1) {
    local_10 = 0;
    local_c = 0;
    local_8 = g_1076671c;
    local_4 = g_10766720;
  }
  else {
    local_10 = DAT_1072dde0;
    local_c = DAT_1072dde4;
    local_8 = DAT_1072dde8;
    local_4 = DAT_1072ddec;
  }
  _DAT_1072dcb4 = (float)g_10766720;
  _DAT_1072dce8 = 0;
  _DAT_1072dcec = 0x3f800000;
  _DAT_1072dcf8 = 0;
  _DAT_1072dcfc = 0;
  _DAT_1072dce0 = (float)local_8 * _DAT_1072dcb8 * 0.5;
  fVar1 = (float)local_4 * _DAT_1072dcbc * 0.5;
  _DAT_1072dcf4 = _DAT_1072dcbc * 0.5 + fVar1 + (float)local_c * _DAT_1072dcbc;
  _DAT_1072dcb0 = (float)g_1076671c;
  _DAT_1072dce4 = -fVar1;
  _DAT_1072dcf0 = _DAT_1072dcb8 * 0.5 + _DAT_1072dce0 + (float)local_10 * _DAT_1072dcb8;
  return;
}


