// 10033d20 size=608 FUN_10033d20

void FUN_10033d20(int param_1)

{
  ushort uVar1;
  char cVar2;
  char cVar3;
  int iVar4;
  ushort *puStack_18;
  undefined4 uStack_14;
  
  DAT_106d3194 = 0;
  if (DAT_101d0a8c == 0) {
    if ((DAT_101d492c == '\0') &&
       ((iVar4 = (**(code **)(*DAT_101d1bf8 + 0xc))(DAT_101d1bf8), iVar4 == -0x7789f798 ||
        (iVar4 == -0x7789f797)))) {
      DAT_101d492c = '\x01';
    }
    cVar2 = DAT_101d492c;
    if ((DAT_101d492c == '\0') || (cVar3 = FUN_100137f0(), cVar3 != '\0')) {
      DAT_106d3194 = param_1;
      FUN_10033c50();
      FUN_10033a90();
      if (cVar2 != '\0') {
        FUN_10035890();
      }
      if (*(char *)(DAT_101ce750 + 8) == '\0') {
        puStack_18 = (ushort *)(DAT_106d3194 + 0x219d0c);
        uStack_14 = 0;
        uVar1 = *puStack_18;
        while (uVar1 != 0) {
          (**(code **)(&DAT_10190518 + (uint)uVar1 * 4))(&puStack_18);
          uVar1 = *puStack_18;
        }
      }
      else {
        if (DAT_1072debc != '\0') {
          FUN_1003e9b0();
        }
        do {
          if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
            _fprintf(DAT_10764584,"%s","dx.device->Clear( 0, 0, 0x00000001l, 0, 0, 0 )\n");
            _fflush(DAT_10764584);
          }
          (**(code **)(*DAT_101d1bf8 + 0xac))(DAT_101d1bf8,0,0,1,0,0,0);
        } while (DAT_1076a830 != 0);
      }
      if ((DAT_1072d9d0 != 0) || (DAT_1072d9e0 != 0)) {
        FUN_1003a8d0();
      }
      if ((DAT_1072ddc8 != 0) && (*(int *)(DAT_101ce7d8 + 8) != 0)) {
        FUN_10034840();
      }
      if (DAT_1076674c != 0) {
        FUN_1003ecb0();
      }
      if (((DAT_10766750 != 0) || (DAT_10766754 != 0)) || (DAT_10766758 != 0)) {
        FUN_1003ed20(0);
      }
      do {
        if ((*(int *)(DAT_101ce7ec + 8) != 0) && (DAT_10764584 != (FILE *)0x0)) {
          _fprintf(DAT_10764584,"%s","dx.device->EndScene()\n");
          _fflush(DAT_10764584);
        }
        (**(code **)(*DAT_101d1bf8 + 0xa8))(DAT_101d1bf8);
      } while (DAT_1076a830 != 0);
      DAT_101d492d = 0;
      if (0 < *(int *)(DAT_101ce75c + 8)) {
        FUN_100335d0();
        (*(code *)RI_Dvar_SetBool)(DAT_101ce75c,0);
      }
      if (0 < *(int *)(DAT_101ce74c + 8)) {
        FUN_100339b0();
        (*(code *)RI_Dvar_SetBool)(DAT_101ce74c,0);
      }
      if (DAT_101d4810 != 3) {
        if (DAT_101d4810 != 2) {
          return;
        }
        FUN_10032cd0();
      }
      FUN_10032d10();
    }
  }
  return;
}


