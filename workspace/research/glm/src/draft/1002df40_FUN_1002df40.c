extern unsigned int DAT_1072d9c4;
extern unsigned int DAT_1072d9cc;
extern unsigned int DAT_1072d9d0;
extern unsigned int DAT_1072d9e0;
extern int FUN_1003a5f0();
extern int FUN_1003a8d0();


void FUN_1002df40(void)

{
  int iVar1;
  int iVar2;
  
  iVar1 = g_1072d9cc;
 
	int g_1072d9cc = DAT_1072d9cc; FUN_1003a8d0();
  FUN_1003a5f0(DAT_1072d9c4);
  iVar2 = g_1072d9cc;
  if ((g_1072d9cc != iVar1) && ((iVar2 = iVar1, DAT_1072d9d0 != 0 || (DAT_1072d9e0 != 0)))) {
    FUN_1003a8d0();
  }
  g_1072d9cc = iVar2;
  return;
}


