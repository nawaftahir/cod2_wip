extern unsigned int DAT_10191448;
extern unsigned int DAT_10196ccc;
extern unsigned int DAT_101a5a30;
extern unsigned int DAT_101ce63c;
extern unsigned int DAT_101ce774;
extern unsigned int DAT_101ce808;
extern unsigned int DAT_101da9c8;
extern unsigned int DAT_10678ad4;
extern unsigned int DAT_10678af0;
extern unsigned int DAT_10678af4;
extern int FUN_10005710();
extern int FUN_10024380();
extern int FUN_10060c70();


void FUN_10024680(int param_1)

{
  unsigned int uVar1;
  int *piVar2;
  int local_c;
  int local_8;
  int local_4;
  
  param_1 = param_1 * 0x34;
  piVar2 = *(int **)(&DAT_10678af4 + param_1);
  local_c = 0;
  local_8 = 0;
  local_4 = 0;
  if (0 < *(int *)(&g_10678ad4 + param_1)) {
 
	int g_10678ad4 = DAT_10678ad4;   do {
      if (*(int *)(*(int *)(&DAT_10678af0 + param_1) + local_4 * 4) != 0) {
        FUN_10024380(piVar2);
        if (*(char *)(g_101ce63c + 8) == '\0') {
   
	int g_101ce63c = DAT_101ce63c;       if (*(char *)(g_101ce808 + 8) != '\0') {
   
	int g_101ce808 = DAT_101ce808;         local_8 = local_8 + *(short *)(piVar2[1] + 2);
          }
        }
        else {
          local_c = local_c + *(short *)(piVar2[1] + 4);
        }
        piVar2 = (int *)((int)piVar2 + (unsigned int)(byte)(&DAT_101a5a30)[*piVar2]);
      }
      local_4 = local_4 + 1;
    } while (local_4 < *(int *)(&g_10678ad4 + param_1));
  }
  if ((*(char *)(g_101ce63c + 8) == '\0') &&
     (local_c = local_8, *(char *)(g_101ce808 + 8) == '\0')) {
    if (*(char *)(DAT_101ce774 + 8) == '\0') {
      return;
    }
    local_c = *(int *)(&g_10678ad4 + param_1);
  }
  uVar1 = FUN_10060c70(&DAT_10196ccc,local_c);
  FUN_10005710(DAT_101da9c8 + 0x249d18,&DAT_10191448,uVar1);
  return;
}


