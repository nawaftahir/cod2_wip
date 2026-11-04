extern unsigned int DAT_101ce6dc;
extern unsigned int DAT_101d1bf4;
extern unsigned int DAT_101d4960;
extern unsigned int DAT_101d4968;
extern unsigned int DAT_101d4969;
extern unsigned int DAT_101d496a;
extern unsigned int DAT_101d496b;
extern unsigned int DAT_101d496c;
extern unsigned int DAT_101d496d;
extern unsigned int DAT_101d496e;
extern unsigned int DAT_101d4c84;
extern unsigned int DAT_101d4c88;
extern unsigned int DAT_101d4c94;
extern int FUN_100116c0();
extern int FUN_10011760();


/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_10011900(void)

{
  int iVar1;
  unsigned int local_124;
  unsigned int local_110;
  unsigned int local_10c;
  unsigned int local_f4;
  unsigned int local_d8;
  unsigned int local_d4;
  unsigned int local_c4;
  unsigned int local_a8;
  unsigned int local_9c;
  unsigned int local_98;
  unsigned int local_90;
  unsigned int local_8c;
  
  FUN_100116c0();
  FUN_10011760();
  g_101d4c84 = local_d8;
 
	int g_101d4c84 = DAT_101d4c84; if (local_d4 - local_d8 < 0) {
    g_101d4c84 = local_d4;
  }
  DAT_101d4c88 = local_98;
  DAT_101d4c94 = (byte)(local_124 >> 0x11) & 1;
  _DAT_101d4c8c = local_9c;
  _DAT_101d4c90 = local_90;
  _DAT_101d4964 = 6;
  if (local_8c + -6 < 0) {
    _DAT_101d4964 = local_8c;
  }
  DAT_101d4968 = (byte)((unsigned int)local_a8 >> 8) & 1;
  DAT_101d4969 = ((byte)local_a8 & 0xc0) == 0xc0;
  DAT_101d4960 = local_c4;
  DAT_101d496a = (byte)((unsigned int)local_10c >> 0x19) & 1;
  DAT_101d496d = (byte)(local_110 >> 0x11) & 1;
  DAT_101d496b = (byte)((unsigned int)local_f4 >> 0x10) & 1;
  DAT_101d496c = (byte)(local_110 >> 0xb) & 1;
  if (*(int *)(DAT_101ce6dc + 8) == 1) {
    g_101d496e = 0;
    r
	int g_101d496e = DAT_101d496e;eturn;
  }
  iVar1 = (**(void **)(*g_101d1bf4 + 0x28))(g_101d1bf4);
  g_101d4
	int g_101d1bf4 = DAT_101d1bf4;96e = '\x01' - (iVar1 != 0);
  return;
}


