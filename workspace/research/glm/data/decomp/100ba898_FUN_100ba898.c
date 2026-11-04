// 100ba898 size=555 FUN_100ba898

bool FUN_100ba898(uint *param_1,undefined4 *param_2,ushort param_3,int *param_4)

{
  int *piVar1;
  char *_Source;
  uint *puVar2;
  char cVar3;
  char *pcVar4;
  int iVar5;
  undefined4 *puVar6;
  undefined4 *puVar7;
  char local_50 [63];
  undefined1 local_11;
  undefined4 local_10;
  int local_c;
  undefined4 local_8;
  
  puVar2 = param_1;
  local_c = 0;
  *param_4 = 0;
  *(byte *)((int)param_1 + 3) = *(byte *)((int)param_1 + 3) & 0xbf;
  _Source = *(char **)(param_1[0x1a] + 0x18);
  _strncpy(local_50,_Source,0x3f);
  local_11 = 0;
  pcVar4 = local_50;
  cVar3 = local_50[0];
  while (cVar3 != '\0') {
    if (*pcVar4 == '_') goto LAB_100ba8e9;
    pcVar4 = pcVar4 + 1;
    cVar3 = *pcVar4;
  }
  if (*pcVar4 == '_') {
LAB_100ba8e9:
    *pcVar4 = '\0';
    iVar5 = __stricmp(pcVar4 + 1,"centroid");
    if (iVar5 != 0) {
      *param_4 = 1;
      param_1[0x1b] = 0;
      FUN_1008b0b5(local_8,param_1[0x1a],0x1196,
                   "invalid input semantic \'%s\', only _centroid allowed",_Source);
      goto LAB_100baab2;
    }
    local_c = 1;
  }
  pcVar4 = local_50;
  if (local_50[0] == '\0') {
LAB_100ba95b:
    param_1 = (uint *)0x0;
  }
  else {
    do {
      iVar5 = _isalpha((int)*pcVar4);
      if (iVar5 == 0) break;
      pcVar4 = pcVar4 + 1;
    } while (*pcVar4 != '\0');
    if (*pcVar4 == '\0') goto LAB_100ba95b;
    param_1 = (uint *)_atol(pcVar4);
  }
  if (*pcVar4 != '\0') {
    *pcVar4 = '\0';
    pcVar4 = pcVar4 + 1;
  }
  cVar3 = *pcVar4;
  if (cVar3 == '\0') {
LAB_100ba98e:
    param_1 = (uint *)((int)param_1 + (puVar2[0x1c] >> 2));
  }
  else {
    do {
      iVar5 = _isdigit((int)cVar3);
      if (iVar5 == 0) break;
      pcVar4 = pcVar4 + 1;
      cVar3 = *pcVar4;
    } while (cVar3 != '\0');
    if (*pcVar4 == '\0') goto LAB_100ba98e;
    param_1 = (uint *)0xffffffff;
  }
  local_10 = FUN_100862e1(puVar2);
  puVar6 = (undefined4 *)0x0;
  if (param_2[4] != -1) {
    do {
      iVar5 = __stricmp((char *)*param_2,local_50);
      if ((iVar5 == 0) &&
         (puVar6 = param_2, puVar7 = param_2, (*(ushort *)(param_2 + 1) & param_3) != 0)) break;
      puVar7 = param_2 + 9;
      piVar1 = param_2 + 0xd;
      param_2 = puVar7;
    } while (*piVar1 != -1);
    if ((puVar6 != (undefined4 *)0x0) && (puVar7[4] != -1)) {
      if ((local_c != 0) && ((*(byte *)(puVar6 + 2) & 1) == 0)) {
        *puVar2 = *puVar2 | 0x40000000;
      }
      if (puVar6[3] != 0) {
        FUN_1008b13a(local_8,puVar2[0x1a],0x1261,
                     "%s semantics \'%s\' has been deprecated; use \'%s%d\' instead",local_10,
                     local_50,puVar6[3],param_1);
      }
      if ((param_1 < (uint)puVar7[5]) || ((uint)puVar7[6] <= param_1)) {
        *puVar2 = *puVar2 | 0x40000000;
      }
      if (puVar2[4] < (uint)puVar7[8]) {
        if ((*(ushort *)(puVar6 + 1) & param_3) == 0) {
          *puVar2 = *puVar2 | 0x40000000;
        }
        puVar2[0x1b] = (puVar6[7] + (int)param_1) * 0x10000 | puVar6[4] & 0xffff;
        if (local_c != 0) {
          *(byte *)((int)puVar2 + 3) = *(byte *)((int)puVar2 + 3) | 1;
        }
      }
      else {
        *puVar2 = *puVar2 | 0x40000000;
        *param_4 = 1;
        FUN_1008b0b5(local_8,puVar2[0x1a],0x11cb,"invalid type used for \'%s\' %s semantics",
                     local_50,local_10);
      }
      goto LAB_100baab2;
    }
  }
  *(byte *)((int)puVar2 + 3) = *(byte *)((int)puVar2 + 3) | 0x40;
  puVar2[0x1b] = 0;
LAB_100baab2:
  return *param_4 != 0;
}


