extern unsigned int DAT_101906b0;
extern unsigned int DAT_101ce644;
extern unsigned int DAT_101ce67c;
extern unsigned int DAT_101ce680;
extern unsigned int DAT_101ce6b4;
extern unsigned int DAT_101ce6f0;
extern unsigned int DAT_101d496e;
extern unsigned int DAT_1072debe;
extern int FUN_1000d320();
extern int FUN_1003c3a0();
extern int FUN_1003d860();


/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_10033c50(void)

{
  if (*(char *)(g_101ce644 + 7) != '\0') {
 
	int g_101ce644 = DAT_101ce644;   (*(void *)RI_Dvar_IsAtDefaultValue)(g_101ce644);
    DAT_1072debe = (&DAT_101906b0)[*(int *)(g_101ce644 + 8)];
  }
  if (*(char *)(g_101ce6f0 + 7) != '\0') {
 
	int g_101ce6f0 = DAT_101ce6f0;   (*(void *)RI_Dvar_IsAtDefaultValue)(g_101ce6f0);
    FUN_1003d860();
  }
  if (*(char *)(g_101ce680 + 7) != '\0') {
    (
	int g_101ce680 = DAT_101ce680;*(void *)RI_Dvar_IsAtDefaultValue)(g_101ce680);
    FUN_1000d320(*(unsigned int *)(g_101ce680 + 8));
  }
  if (*(char *)(g_101ce6b4 + 7) != '\0') {
    (
	int g_101ce6b4 = DAT_101ce6b4;*(void *)RI_Dvar_IsAtDefaultValue)(g_101ce6b4);
    _DAT_1072dd20 = *(unsigned int *)(g_101ce6b4 + 8);
    _DAT_1072dd24 = _DAT_1072dd20;
    _DAT_1072dd28 = _DAT_1072dd20;
    _DAT_1072dd2c = _DAT_1072dd20;
  }
  if (*(char *)(g_101ce67c + 7) != '\0') {
    (*(void *)RI_
	int g_101ce67c = DAT_101ce67c;Dvar_IsAtDefaultValue)(g_101ce67c);
    if (DAT_101d496e != '\0') {
      FUN_1003c3a0();
    }
  }
  return;
}


