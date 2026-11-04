extern unsigned int DAT_106d3194;
extern unsigned int DAT_1072d9b0;
extern unsigned int DAT_1072d9c4;
extern unsigned int DAT_1072d9cc;
extern unsigned int DAT_1072d9d0;
extern unsigned int DAT_1072d9d4;
extern unsigned int DAT_1072d9e0;
extern int FUN_100340f0();
extern int FUN_1003a5f0();
extern int FUN_1003a8d0();
extern int FUN_1010a8a8();


void FUN_100341d0(void)

{
  int iVar1;
  unsigned char uVar2;
  unsigned char uVar3;
  unsigned char uVar4;
  unsigned char uVar5;
  int iVar6;
  int iVar7;
  unsigned int local_10;
  int local_c;
  int local_8;
  
  FUN_1003a5f0(0);
  local_8 = 0;
  if (0 < *(int *)(g_106d3194 + 0x249d28)) {
 
	int g_106d3194 = DAT_106d3194;   local_c = 0;
    do {
      iVar6 = *(int *)(g_106d3194 + 0x249d24) + local_c;
      uVar2 = FUN_1010a8a8();
      uVar3 = FUN_1010a8a8();
      uVar4 = FUN_1010a8a8();
      uVar5 = FUN_1010a8a8();
      iVar7 = g_1072d9cc;
 
	int g_1072d9cc = DAT_1072d9cc;     local_10 = CONCAT13(uVar5,CONCAT12(uVar4,CONCAT11(uVar3,uVar2)));
      if ((0x154a < *(int *)(iVar6 + 0x14) + g_1072d9d4) ||
 
	int g_1072d9d4 = DAT_1072d9d4;        (iVar1 = iVar7, 0x100000 < g_1072d9d0 + (*(int *)(iVar6 + 0x14) + -2) * 3)) {
   
	int g_1072d9d0 = DAT_1072d9d0;     FUN_1003a8d0();
        FUN_1003a5f0(DAT_1072d9c4);
        iVar1 = g_1072d9cc;
        if ((g_1072d9cc != iVar7) && ((g_1072d9d0 != 0 || (iVar1 = iVar7, DAT_1072d9e0 != 0))))
        {
          FUN_1003a8d0();
          iVar1 = iVar7;
        }
      }
      g_1072d9cc = iVar1;
      iVar7 = 0;
      if (0 < *(int *)(iVar6 + 0x14)) {
        do {
          FUN_100340f0(local_10);
          iVar7 = iVar7 + 1;
        } while (iVar7 < *(int *)(iVar6 + 0x14));
      }
      iVar7 = 2;
      if (2 < *(int *)(iVar6 + 0x14)) {
        do {
          *(unsigned short *)(g_1072d9b0 + g_1072d9d0 * 2) = (unsigned short)g_1072d9d4;
          *(short *
	int g_1072d9b0 = DAT_1072d9b0;)(g_1072d9b0 + 2 + g_1072d9d0 * 2) = (short)g_1072d9d4 + (short)iVar7;
          *(short *)(g_1072d9b0 + 4 + g_1072d9d0 * 2) = (short)iVar7 + -1 + (short)g_1072d9d4;
          g_1072d9d0 = g_1072d9d0 + 3;
          iVar7 = iVar7 + 1;
        } while (iVar7 < *(int *)(iVar6 + 0x14));
      }
      g_1072d9d4 = g_1072d9d4 + *(int *)(iVar6 + 0x14);
      local_8 = local_8 + 1;
      local_c = local_c + 0x18;
    } while (local_8 < *(int *)(g_106d3194 + 0x249d28));
  }
  FUN_1003a8d0();
  return;
}


