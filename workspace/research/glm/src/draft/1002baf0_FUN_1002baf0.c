extern unsigned int DAT_10696d00;
extern unsigned int DAT_106a3100;
extern unsigned int DAT_106a3104;
extern unsigned int DAT_106a3128;
extern unsigned int DAT_106a312c;
extern int FUN_1002aac0();
extern int FUN_1002b9a0();


void FUN_1002baf0(void)

{
  int *piVar1;
  int *piVar2;
  int *piVar3;
  
  if (g_106a312c == (int *)0x0) {
 
	int g_106a312c = DAT_106a312c;   return;
  }
  if (g_106a312c != (int *)&g_106a3128) {
    d
	int g_106a3128 = DAT_106a3128;o {
      piVar2 = g_106a312c;
      FUN_1002aac0(&DAT_10696d00,g_106a312c,0,4);
      piVar3 = g_106a312c;
      piVar1 = g_106a312c + 1;
      *(int *)g_106a312c[1] = *g_106a312c;
      *(int *)(*piVar3 + 4) = *piVar1;
      piVar1 = piVar2 + 0x22;
      *piVar1 = (int)&DAT_106a3100;
      piVar2[0x23] = (int)g_106a3104;
      g_106a3104 = 
	int g_106a3104 = DAT_106a3104;piVar1;
      *(int **)piVar2[0x23] = piVar1;
    } while (g_106a312c != (int *)&g_106a3128);
  }
  FUN_1002b9a0();
  return;
}


