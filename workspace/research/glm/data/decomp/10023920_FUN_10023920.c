// 10023920 size=442 FUN_10023920

/* WARNING: Function: __chkstk replaced with injection: alloca_probe */

void FUN_10023920(void)

{
  int *piVar1;
  size_t sVar2;
  size_t sVar3;
  int iVar4;
  undefined4 uVar5;
  undefined1 *puVar6;
  undefined *puVar7;
  size_t local_2028;
  size_t *local_2024;
  char *local_2020 [4];
  char *local_2010;
  char *local_200c;
  char *local_2008;
  char *local_2004;
  undefined1 *local_2000;
  char *local_1ffc;
  size_t local_1ff8 [2045];
  undefined4 uStack_4;
  
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
  if (DAT_1067850c != 0) {
    do {
      local_1ff8[sVar3] = sVar3;
      sVar3 = sVar3 + 1;
    } while (sVar3 != DAT_1067850c);
  }
  _qsort(local_1ff8,DAT_1067850c,4,FUN_10023800);
  local_2028 = 0;
  if (DAT_1067850c != 0) {
    do {
      sVar2 = local_1ff8[local_2028];
      piVar1 = (int *)(sVar2 * 0x74 + 0xa0010 + DAT_101da9c8);
      sVar3 = local_2028 + 1;
      if (sVar3 != DAT_1067850c) {
        local_2024 = local_1ff8 + sVar3;
        do {
          iVar4 = FUN_10023800(local_1ff8 + local_2028,local_2024);
          if (iVar4 != 0) break;
          sVar3 = sVar3 + 1;
          local_2024 = local_2024 + 1;
        } while (sVar3 != DAT_1067850c);
      }
      FUN_10061c80("%3i: %-8s: ",sVar3 - local_2028,local_2020[*piVar1]);
      switch(*piVar1) {
      case 0:
        uVar5 = (*(code *)RI_RI_unk123)((&DAT_10678ac8)[sVar2 * 0xd],0);
        uVar5 = (*(code *)RI_XModelGetSurfaceName)(uVar5);
        FUN_10061c80(&DAT_10194210,uVar5);
        break;
      case 1:
      case 2:
        uVar5 = (*(code *)RI_XModelGetSurfaceName)((&DAT_10678ac8)[sVar2 * 0xd]);
        FUN_10061c80(&DAT_10194210,uVar5);
        break;
      case 3:
        puVar6 = (undefined1 *)((&DAT_10678ac8)[sVar2 * 0xd] - *(int *)(DAT_101d1b9c + 0x138) >> 5);
        puVar7 = &DAT_10196d9c;
        goto LAB_10023aaf;
      default:
        if ((undefined4 *)piVar1[0x15] == (undefined4 *)0x0) {
          puVar6 = &DAT_10196d94;
        }
        else {
          puVar6 = *(undefined1 **)piVar1[0x15];
        }
        puVar7 = &DAT_10194210;
LAB_10023aaf:
        FUN_10061c80(puVar7,puVar6);
      }
      local_2028 = local_2028 + (sVar3 - local_2028);
    } while (local_2028 != DAT_1067850c);
  }
  return;
}


