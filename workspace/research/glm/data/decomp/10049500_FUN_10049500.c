// 10049500 size=375 FUN_10049500

void FUN_10049500(void)

{
  int iVar1;
  int iVar2;
  bool bVar3;
  undefined4 *puVar4;
  int *piVar5;
  int *unaff_ESI;
  undefined4 *puVar6;
  int iStack_4;
  
  bVar3 = true;
  puVar4 = (undefined4 *)(**(code **)unaff_ESI[1])();
  unaff_ESI[0x57] = (int)puVar4;
  *puVar4 = &DAT_10048cc0;
  puVar4[1] = FUN_10048d30;
  *(undefined1 *)(puVar4 + 2) = 0;
  if (*(char *)((int)unaff_ESI + 0xbb) != '\0') {
    *(undefined4 *)(*unaff_ESI + 0x14) = 0x19;
    (**(code **)*unaff_ESI)();
  }
  iStack_4 = 0;
  if (0 < unaff_ESI[0x11]) {
    piVar5 = (int *)(unaff_ESI[0x13] + 0xc);
    puVar6 = puVar4 + 3;
    do {
      iVar1 = piVar5[-1];
      iVar2 = unaff_ESI[0x38];
      if ((iVar1 == iVar2) && (*piVar5 == unaff_ESI[0x39])) {
        if (unaff_ESI[0x2f] == 0) {
          *puVar6 = FUN_10048ef0;
        }
        else {
          *puVar6 = FUN_10049380;
          *(undefined1 *)(puVar4 + 2) = 1;
        }
      }
      else if (iVar1 * 2 == iVar2) {
        if (*piVar5 == unaff_ESI[0x39]) {
          bVar3 = false;
          *puVar6 = FUN_10048f70;
        }
        else {
          if ((iVar1 * 2 != iVar2) || (*piVar5 * 2 - unaff_ESI[0x39] != 0)) goto LAB_100495fe;
          if (unaff_ESI[0x2f] == 0) {
            *puVar6 = &LAB_10049010;
          }
          else {
            *puVar6 = FUN_100490f0;
            *(undefined1 *)(puVar4 + 2) = 1;
          }
        }
      }
      else {
LAB_100495fe:
        if ((iVar2 % iVar1 == 0) && (unaff_ESI[0x39] % *piVar5 == 0)) {
          bVar3 = false;
          *puVar6 = &LAB_10048dc0;
        }
        else {
          *(undefined4 *)(*unaff_ESI + 0x14) = 0x26;
          (**(code **)*unaff_ESI)();
        }
      }
      iStack_4 = iStack_4 + 1;
      puVar6 = puVar6 + 1;
      piVar5 = piVar5 + 0x15;
    } while (iStack_4 < unaff_ESI[0x11]);
  }
  if ((unaff_ESI[0x2f] != 0) && (!bVar3)) {
    *(undefined4 *)(*unaff_ESI + 0x14) = 99;
    (**(code **)(*unaff_ESI + 4))();
  }
  return;
}


