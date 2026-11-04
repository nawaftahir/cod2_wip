extern unsigned int DAT_101ce5fc;
extern unsigned int DAT_101ce604;
extern unsigned int DAT_101ce6d8;
extern unsigned int DAT_101ce728;
extern unsigned int DAT_101ce73c;
extern unsigned int DAT_101ce768;
extern unsigned int DAT_101ce778;
extern unsigned int DAT_101d1b9c;


unsigned char FUN_10021c80(void)

{
  unsigned char bVar1;
  unsigned char bVar2;
  unsigned char bVar3;
  unsigned char bVar4;
  unsigned char bVar5;
  unsigned char bVar6;
  
  if (DAT_101d1b9c == 0) {
    return false;
  }
  bVar1 = *(char *)(g_101ce73c + 7) != '\0';
 
	int g_101ce73c = DAT_101ce73c; if (bVar1) {
    (*(void *)RI_Dvar_IsAtDefaultValue)(g_101ce73c);
  }
  bVar2 = *(char *)(g_101ce5fc + 7) != '\0';
  if 
	int g_101ce5fc = DAT_101ce5fc;(bVar2) {
    (*(void *)RI_Dvar_IsAtDefaultValue)(g_101ce5fc);
  }
  bVar3 = *(char *)(g_101ce604 + 7) != '\0';
  if 
	int g_101ce604 = DAT_101ce604;(bVar3) {
    (*(void *)RI_Dvar_IsAtDefaultValue)(g_101ce604);
  }
  bVar4 = *(char *)(g_101ce6d8 + 7) != '\0';
  if 
	int g_101ce6d8 = DAT_101ce6d8;(bVar4) {
    (*(void *)RI_Dvar_IsAtDefaultValue)(g_101ce6d8);
  }
  bVar5 = *(char *)(g_101ce778 + 7) != '\0';
 
	int g_101ce778 = DAT_101ce778; if (bVar5) {
    (*(void *)RI_Dvar_IsAtDefaultValue)(g_101ce778);
  }
  bVar6 = *(char *)(g_101ce768 + 7) != '\0';
  if 
	int g_101ce768 = DAT_101ce768;(bVar6) {
    (*(void *)RI_Dvar_IsAtDefaultValue)(g_101ce768);
  }
  if (*(char *)(g_101ce728 + 7) != '\0') {
    (*(void *
	int g_101ce728 = DAT_101ce728;)RI_Dvar_IsAtDefaultValue)(g_101ce728);
    return true;
  }
  return ((((bVar1 || bVar2) || bVar3) || bVar4) || bVar5) || bVar6;
}


