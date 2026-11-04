extern unsigned int DAT_101d0a68;
extern unsigned int DAT_101d0a6c;
extern unsigned int DAT_101d0a70;
extern unsigned int DAT_101d0a74;
extern unsigned int DAT_101d0a78;
extern unsigned int DAT_101d4d28;
extern int FUN_1000d680();
extern int FUN_1000fa40();
extern int FUN_100138c0();


void FUN_10017730(void)

{
  int iVar1;
  unsigned int *puVar2;
  int *piVar3;
  char cVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  unsigned short local_8;
  unsigned int local_4;
  
  FUN_1000d680();
  local_4 = 0;
  do {
    iVar1 = *(int *)((int)&DAT_101d4d28 + local_4);
    if ((iVar1 != 0) && (iVar6 = 0, *(short *)(iVar1 + 0x34) != 0)) {
      iVar7 = 0;
      do {
        if ((*(char *)(*(int *)(iVar1 + 0x3c) + 5 + iVar7) != '\x05') &&
           (puVar2 = *(unsigned int **)(*(int *)(iVar1 + 0x3c) + iVar7 + 8),
           puVar2 != (unsigned int *)0x0)) {
          if (*(char *)((int)puVar2 + 0xb) == '\0') {
            switch(*(unsigned char *)((int)puVar2 + 10)) {
            default:
              goto switchD_1001779d_caseD_0;
            case 2:
            case 5:
              iVar5 = DAT_101d0a68;
              break;
            case 3:
              iVar5 = DAT_101d0a6c;
              break;
            case 4:
              iVar5 = DAT_101d0a70;
            }
            if (iVar5 < 0) {
              local_8 = 0x200;
            }
            else {
              if (3 < iVar5) {
                iVar5 = 3;
              }
              local_8 = CONCAT11(2,(char)iVar5);
            }
          }
          else {
switchD_1001779d_caseD_0:
            local_8 = 0;
          }
          if (*(char *)(puVar2 + 2) != (char)local_8) {
            if ((1 < *(byte *)(puVar2 + 3)) && (*(byte *)(puVar2 + 3) != 4)) {
              g_101d0a74 = g_101d0a74 - puVar2[4];
   
	int g_101d0a74 = DAT_101d0a74;           g_101d0a78 = g_101d0a78 - puVar2[5];
   
	int g_101d0a78 = DAT_101d0a78;         }
            piVar3 = (int *)puVar2[1];
            if (piVar3 != (int *)0x0) {
              (**(void **)(*piVar3 + 8))(piVar3);
              puVar2[1] = 0;
              puVar2[4] = 0;
              puVar2[5] = 0;
            }
            *puVar2 = 0;
            *(unsigned short *)(puVar2 + 2) = local_8;
            cVar4 = FUN_1000fa40();
            if (cVar4 == '\0') {
              FUN_100138c0(1,"failed to load image \'%s\'",puVar2[8]);
            }
          }
        }
        iVar6 = iVar6 + 1;
        iVar7 = iVar7 + 0xc;
      } while (iVar6 < (int)(unsigned int)*(unsigned short *)(iVar1 + 0x34));
    }
    local_4 = local_4 + 4;
    if (0xfff < local_4) {
      return;
    }
  } while( true );
}


