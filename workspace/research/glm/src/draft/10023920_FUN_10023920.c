extern unsigned int DAT_10194210;
extern unsigned int DAT_10196d94;
extern unsigned int DAT_10196d9c;
extern unsigned int DAT_10196dbc;
extern unsigned int DAT_101d1b9c;
extern unsigned int DAT_101da9c8;
extern unsigned int DAT_1067850c;
extern unsigned int DAT_10678ac8;
extern int FUN_10023800();
extern int FUN_10061c80();


/* WARNING: Function: __chkstk replaced with injection: alloca_probe */

void FUN_10023920(void)

{
  int *piVar1;
  size_t sVar2;
  size_t sVar3;
  int iVar4;
  unsigned int uVar5;
  unsigned char *puVar6;
  unsigned int *puVar7;
  size_t local_2028;
  size_t *local_2024;
  char *local_2020 [4];
  char *local_2010;
  char *local_200c;
  char *local_2008;
  char *local_2004;
  unsigned char *local_2000;
  char *local_1ffc;
  size_t local_1ff8 [2045];
  unsigned int uStack_4;
  
  uStack_4 = 0x1002392a;
  sVar3 = 0;
  local_2020[0] = "dobj";
  local_2020[1] = "xmodel";
  local_2020[2] = "smodel";
  local_2020[3] = "bmodel";
  local_2010 = "sprite";
  local_200c = "rail core";
  local_2008 = "cloud";
  local_2004 = "oriented";
  local_2000 = &DAT_10196dbc;
  local_1ffc = "cylinder";
  if (g_1067850c != 0) {
 
	int g_1067850c = DAT_1067850c;   do {
      local_1ff8[sVar3] = sVar3;
      sVar3 = sVar3 + 1;
    } while (sVar3 != g_1067850c);
  }
  _qsort(local_1ff8,g_1067850c,4,FUN_10023800);
  local_2028 = 0;
  if (g_1067850c != 0) {
    do {
      sVar2 = local_1ff8[local_2028];
      piVar1 = (int *)(sVar2 * 0x74 + 0xa0010 + DAT_101da9c8);
      sVar3 = local_2028 + 1;
      if (sVar3 != g_1067850c) {
        local_2024 = local_1ff8 + sVar3;
        do {
          iVar4 = FUN_10023800(local_1ff8 + local_2028,local_2024);
          if (iVar4 != 0) break;
          sVar3 = sVar3 + 1;
          local_2024 = local_2024 + 1;
        } while (sVar3 != g_1067850c);
      }
      FUN_10061c80("%3i: %-8s: ",sVar3 - local_2028,local_2020[*piVar1]);
      switch(*piVar1) {
      case 0:
        uVar5 = (*(void *)RI_RI_unk123)((&g_10678ac8)[sVar2 * 0xd],0);
 
	int g_10678ac8 = DAT_10678ac8;       uVar5 = (*(void *)RI_XModelGetSurfaceName)(uVar5);
        FUN_10061c80(&g_10194210,uVar5);
        break;

	int g_10194210 = DAT_10194210;      case 1:
      case 2:
        uVar5 = (*(void *)RI_XModelGetSurfaceName)((&g_10678ac8)[sVar2 * 0xd]);
        FUN_10061c80(&g_10194210,uVar5);
        break;
      case 3:
        puVar6 = (unsigned char *)((&g_10678ac8)[sVar2 * 0xd] - *(int *)(DAT_101d1b9c + 0x138) >> 5);
        puVar7 = &DAT_10196d9c;
        goto LAB_10023aaf;
      default:
        if ((unsigned int *)piVar1[0x15] == (unsigned int *)0x0) {
          puVar6 = &DAT_10196d94;
        }
        else {
          puVar6 = *(unsigned char **)piVar1[0x15];
        }
        puVar7 = &g_10194210;
LAB_10023aaf:
        FUN_10061c80(puVar7,puVar6);
      }
      local_2028 = local_2028 + (sVar3 - local_2028);
    } while (local_2028 != g_1067850c);
  }
  return;
}


