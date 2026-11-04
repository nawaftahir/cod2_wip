extern unsigned int DAT_1076a83c;
extern unsigned int DAT_1076a85c;


/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_1005da30(unsigned int param_1,unsigned int param_2,int param_3)

{
  void *pcVar1;
  
  if (g_1076a85c != 1) {
 
	int g_1076a85c = DAT_1076a85c;   g_1076a85c = 1;
    _DAT_1076a83c = &LAB_1005dab8;
    _DAT_1076a840 = &LAB_1005daeb;
    _DAT_1076a844 = &LAB_1005db1e;
    _DAT_1076a848 = &LAB_1005db51;
    _DAT_1076a84c = &LAB_1005db84;
    _DAT_1076a850 = &LAB_1005dbb7;
    _DAT_1076a854 = &LAB_1005dbe7;
    _DAT_1076a858 = &LAB_1005dc17;
  }
  if (*(byte *)(param_3 + 0x11) < 8) {
                    /* WARNING: Jumptable at 0x1005dab1 did not pass sanity check. */
                    /* WARNING: Treating indirect jump as call */
    (**(void **)(&DAT_1076a83c + (unsigned int)*(byte *)(param_3 + 0x11) * 4))();
    return;
  }
  pcVar1 = (void *)swi(3);
  (*pcVar1)();
  return;
}


