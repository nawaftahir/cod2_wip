
uint FUN_0047ec70(char *param_1)

{
  char cVar1;
  char *pcVar2;
  char *pcVar3;
  uint uVar4;
  char *pcVar5;
  undefined1 **ppuVar6;
  undefined1 *local_24;
  char *local_20 [4];
  char *local_10;
  undefined *local_c;
  undefined1 *local_8;
  
  local_24 = &DAT_005514c4;
  local_20[0] = ".txt";
  local_20[1] = ".cfg";
  local_20[2] = ".levelshots";
  local_20[3] = ".menu";
  local_10 = ".arena";
  local_c = &DAT_00551490;
  local_8 = &DAT_0053d753;
  do {
    pcVar2 = param_1;
    param_1 = pcVar2 + 1;
  } while (*pcVar2 != '\0');
  pcVar5 = ".hlsl";
  ppuVar6 = &local_24;
  while( true ) {
    pcVar3 = pcVar5;
    do {
      cVar1 = *pcVar3;
      pcVar3 = pcVar3 + 1;
    } while (cVar1 != '\0');
    uVar4 = FUN_004965d0((int)pcVar2 - ((int)pcVar3 - (int)(pcVar5 + 1)),pcVar5);
    if (uVar4 == 0) break;
    pcVar5 = ppuVar6[1];
    ppuVar6 = ppuVar6 + 1;
    if (*pcVar5 == '\0') {
      return uVar4 & 0xffffff00;
    }
  }
  return 1;
}

