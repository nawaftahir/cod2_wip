// 10038cf0 size=636 FUN_10038cf0

undefined * FUN_10038cf0(uint param_1,int param_2)

{
  undefined *puVar1;
  int iVar2;
  undefined4 uVar3;
  
  iVar2 = DAT_10730550 * 0xcd0;
  switch(param_1 & 0xfffffffc) {
  case 0xbc:
    puVar1 = &DAT_1072def0 + iVar2;
    goto LAB_10038edc;
  case 0xc0:
    puVar1 = &DAT_1072e110 + iVar2;
    goto LAB_10038edc;
  case 0xc4:
    puVar1 = &DAT_1072e220 + iVar2;
    goto LAB_10038edc;
  case 200:
    puVar1 = &DAT_1072e330 + iVar2;
    if ((&DAT_1072e430)[iVar2] != '\0') goto LAB_10038edc;
    FUN_1005a880();
    break;
  case 0xcc:
    puVar1 = &DAT_1072e550 + iVar2;
    if ((&DAT_1072e650)[iVar2] != '\0') goto LAB_10038edc;
    FUN_1005a880();
    break;
  case 0xd0:
    puVar1 = &DAT_1072e660 + iVar2;
    if ((&DAT_1072e760)[iVar2] != '\0') goto LAB_10038edc;
    if ((&DAT_1072e430)[iVar2] == '\0') {
      FUN_1005a880();
      (&DAT_1072e430)[iVar2] = 1;
    }
    FUN_1005a880();
    break;
  case 0xd4:
    puVar1 = &DAT_1072e000 + iVar2;
    if ((&DAT_1072e100)[iVar2] != '\0') goto LAB_10038edc;
    uVar3 = 0xbc;
    goto LAB_10038e4e;
  case 0xd8:
    puVar1 = &DAT_1072e440 + iVar2;
    if ((&DAT_1072e540)[iVar2] != '\0') goto LAB_10038edc;
    uVar3 = 200;
    goto LAB_10038e4e;
  case 0xdc:
    puVar1 = &DAT_1072e440 + iVar2;
    if ((&DAT_1072e540)[iVar2] != '\0') goto LAB_10038edc;
    uVar3 = 0xd0;
LAB_10038e4e:
    FUN_10038cf0(uVar3,0,4);
    FUN_10038c60(1.0 / *(float *)(&DAT_1072dee0 + iVar2));
    break;
  case 0xe0:
    puVar1 = (undefined *)(iVar2 + 0x1072e880);
    if ((&DAT_1072e980)[iVar2] != '\0') goto LAB_10038edc;
    FUN_1005a880();
    break;
  case 0xe4:
    puVar1 = (undefined *)(iVar2 + 0x1072e990);
    if ((&DAT_1072ea90)[iVar2] != '\0') goto LAB_10038edc;
    FUN_10038cf0(0xbf,0,4);
    FUN_1005a880();
    break;
  case 0xe8:
    puVar1 = (undefined *)(iVar2 + 0x1072eaa0);
    if ((&DAT_1072eba0)[iVar2] != '\0') goto LAB_10038edc;
    FUN_10038fd0();
    break;
  default:
    return (undefined *)0x0;
  }
  puVar1[0x100] = 1;
LAB_10038edc:
  param_1 = param_1 & 3;
  if (puVar1[param_1 + 0x100] == '\0') {
    if (puVar1[(param_1 ^ 2) + 0x100] == '\0') {
      if (puVar1[(param_1 ^ 1) + 0x100] == '\0') {
        FUN_1005aad0();
        puVar1[(param_1 ^ 2) + 0x100] = 1;
      }
      FUN_1005ad00();
    }
    else {
      FUN_1005aad0();
    }
    puVar1[param_1 + 0x100] = 1;
  }
  return puVar1 + (param_2 + param_1 * 4) * 0x10;
}


