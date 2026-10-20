
void __fastcall FUN_00494f90(undefined4 param_1,int param_2)

{
  char cVar1;
  undefined1 *puVar2;
  uint uVar3;
  char *pcVar4;
  undefined4 *unaff_EDI;
  
  puVar2 = &DAT_00592788 + DAT_00596d48 * 0x45c;
  uVar3 = 0;
  pcVar4 = (char *)*unaff_EDI;
  *puVar2 = 0;
  if (param_2 == 0) {
    if (*pcVar4 == '\r') {
      return;
    }
    if (*pcVar4 == '\n') {
      return;
    }
  }
  else {
    for (; (*pcVar4 == '\r' || (*pcVar4 == '\n')); pcVar4 = pcVar4 + 1) {
    }
  }
  cVar1 = *pcVar4;
  DAT_00596d50 = DAT_00596d4c;
  DAT_00596d4c = pcVar4;
  do {
    if (cVar1 == '\0') {
LAB_00494ff9:
      *unaff_EDI = 0;
      puVar2[uVar3] = 0;
      return;
    }
    if ((cVar1 == ',') || (cVar1 == '\n')) {
      if (*pcVar4 != '\0') {
        if (*pcVar4 != '\n') {
          pcVar4 = pcVar4 + 1;
        }
        *unaff_EDI = pcVar4;
        puVar2[uVar3] = 0;
        return;
      }
      goto LAB_00494ff9;
    }
    if (cVar1 != '\r') {
      if (cVar1 == '\"') {
        do {
          for (pcVar4 = pcVar4 + 1; *pcVar4 == '\"'; pcVar4 = pcVar4 + 2) {
            if (pcVar4[1] != '\"') goto LAB_00494ff1;
            if (uVar3 < 0x3ff) {
              puVar2[uVar3] = 0x22;
              uVar3 = uVar3 + 1;
            }
          }
          if (uVar3 < 0x3ff) {
            puVar2[uVar3] = *pcVar4;
            uVar3 = uVar3 + 1;
          }
        } while( true );
      }
      if (uVar3 < 0x3ff) {
        puVar2[uVar3] = cVar1;
        uVar3 = uVar3 + 1;
      }
    }
LAB_00494ff1:
    cVar1 = pcVar4[1];
    pcVar4 = pcVar4 + 1;
  } while( true );
}

