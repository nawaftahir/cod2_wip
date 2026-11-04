// 10068576 size=330 FUN_10068576

int FUN_10068576(char *param_1,undefined4 *param_2)

{
  char cVar1;
  char *pcVar2;
  undefined1 *puVar3;
  int iVar4;
  int in_ECX;
  char *pcVar5;
  char *pcVar6;
  char *pcVar7;
  char *pcVar8;
  char *pcVar9;
  undefined4 uVar10;
  
  pcVar2 = param_1;
  if (*(char **)(in_ECX + 4) <= param_1) {
    return 0;
  }
  if (*param_1 == '\"') {
    param_1._3_1_ = '\"';
  }
  else {
    if (*param_1 != '<') {
      return 0;
    }
    if ((*(byte *)(in_ECX + 0x28) & 8) == 0) {
      return 0;
    }
    param_1._3_1_ = '>';
  }
  pcVar9 = pcVar2 + 1;
  pcVar8 = pcVar9;
  if (pcVar9 < *(char **)(in_ECX + 4)) {
    pcVar6 = pcVar2 + 2;
    do {
      cVar1 = *pcVar8;
      if ((param_1._3_1_ == cVar1) || (cVar1 == '\n')) break;
      pcVar5 = pcVar6;
      pcVar7 = pcVar8;
      if ((cVar1 == '\\') && ((*(byte *)(in_ECX + 0x28) & 4) == 0)) {
        pcVar7 = pcVar8 + 1;
        pcVar5 = pcVar6 + 1;
        if (pcVar7 < *(char **)(in_ECX + 4)) {
          if (*pcVar7 != '\n') {
            if (((*pcVar7 != '\r') || (*(char **)(in_ECX + 4) <= pcVar5)) || (*pcVar5 != '\n'))
            goto LAB_100685f4;
            pcVar7 = pcVar8 + 2;
            pcVar5 = pcVar6 + 2;
          }
          *(int *)(in_ECX + 0x1c) = *(int *)(in_ECX + 0x1c) + 1;
        }
      }
LAB_100685f4:
      pcVar8 = pcVar7 + 1;
      pcVar6 = pcVar5 + 1;
    } while (pcVar8 < *(char **)(in_ECX + 4));
  }
  if (pcVar8 < *(char **)(in_ECX + 4)) {
    if (*pcVar8 != '\n') goto LAB_1006862e;
    pcVar6 = "string continues past end of line";
    uVar10 = 0x3ed;
  }
  else {
    pcVar6 = "string continues past end of file";
    uVar10 = 0x3ee;
    pcVar8 = *(char **)(in_ECX + 4);
  }
  FUN_10067c3e(*(undefined4 *)(in_ECX + 0x30),in_ECX + 8,uVar10,pcVar6);
LAB_1006862e:
  puVar3 = (undefined1 *)FUN_100826bd((int)pcVar8 - (int)pcVar2,1);
  if (puVar3 == (undefined1 *)0x0) {
    return 0;
  }
  *param_2 = puVar3;
  do {
    pcVar6 = pcVar9 + 1;
    if (pcVar6 < pcVar8) {
      pcVar5 = pcVar9 + 2;
      do {
        if ((*pcVar9 != '\\') || ((*(byte *)(in_ECX + 0x28) & 4) != 0)) break;
        if (*pcVar6 == '\n') {
          pcVar9 = pcVar9 + 2;
          pcVar5 = pcVar5 + 2;
          pcVar6 = pcVar6 + 2;
        }
        else {
          if (((*pcVar6 != '\r') || (pcVar8 <= pcVar5)) || (*pcVar5 != '\n')) break;
          pcVar9 = pcVar9 + 3;
          pcVar5 = pcVar5 + 3;
          pcVar6 = pcVar6 + 3;
        }
      } while (pcVar6 < pcVar8);
    }
    if (pcVar8 <= pcVar9) {
      *puVar3 = 0;
      return ((int)pcVar8 - (int)pcVar2) + 1;
    }
    iVar4 = FUN_10068295(pcVar9,&param_2);
    pcVar9 = pcVar9 + iVar4;
    *puVar3 = param_2._0_1_;
    puVar3 = puVar3 + 1;
  } while( true );
}


