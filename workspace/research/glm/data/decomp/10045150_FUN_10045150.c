// 10045150 size=445 FUN_10045150

void FUN_10045150(int param_1)

{
  byte *pbVar1;
  byte *pbVar2;
  byte *pbVar3;
  byte bVar4;
  int *piVar5;
  int iVar6;
  char in_AL;
  char cVar7;
  byte *pbVar8;
  int *in_ECX;
  int iVar9;
  int iVar10;
  int iVar11;
  
  if (in_AL == '\0') {
    iVar11 = in_ECX[param_1 + 0x18];
  }
  else {
    iVar11 = in_ECX[param_1 + 0x1c];
    param_1 = param_1 + 0x10;
  }
  if (iVar11 == 0) {
    *(undefined4 *)(*in_ECX + 0x14) = 0x32;
    *(int *)(*in_ECX + 0x18) = param_1;
    (**(code **)*in_ECX)();
  }
  if (*(char *)(iVar11 + 0x111) == '\0') {
    FUN_10044e40(0xc4);
    iVar10 = 0;
    pbVar8 = (byte *)(iVar11 + 3);
    iVar9 = 4;
    do {
      pbVar1 = pbVar8 + -1;
      pbVar2 = pbVar8 + -2;
      pbVar3 = pbVar8 + 1;
      bVar4 = *pbVar8;
      pbVar8 = pbVar8 + 4;
      iVar9 = iVar9 + -1;
      iVar10 = (uint)bVar4 + iVar10 + (uint)*pbVar2 + (uint)*pbVar1 + (uint)*pbVar3;
    } while (iVar9 != 0);
    piVar5 = (int *)in_ECX[8];
    *(char *)*piVar5 = (char)((uint)(iVar10 + 0x13) >> 8);
    iVar9 = piVar5[1];
    *piVar5 = *piVar5 + 1;
    piVar5[1] = iVar9 + -1;
    if ((iVar9 + -1 == 0) && (cVar7 = (*(code *)piVar5[3])(), cVar7 == '\0')) {
      *(undefined4 *)(*in_ECX + 0x14) = 0x18;
      (**(code **)*in_ECX)();
    }
    piVar5 = (int *)in_ECX[8];
    *(char *)*piVar5 = (char)(iVar10 + 0x13);
    iVar9 = piVar5[1];
    *piVar5 = *piVar5 + 1;
    piVar5[1] = iVar9 + -1;
    if ((iVar9 + -1 == 0) && (cVar7 = (*(code *)piVar5[3])(), cVar7 == '\0')) {
      *(undefined4 *)(*in_ECX + 0x14) = 0x18;
      (**(code **)*in_ECX)();
    }
    piVar5 = (int *)in_ECX[8];
    *(undefined1 *)*piVar5 = (undefined1)param_1;
    iVar9 = piVar5[1];
    *piVar5 = *piVar5 + 1;
    piVar5[1] = iVar9 + -1;
    if ((iVar9 + -1 == 0) && (cVar7 = (*(code *)piVar5[3])(), cVar7 == '\0')) {
      *(undefined4 *)(*in_ECX + 0x14) = 0x18;
      (**(code **)*in_ECX)();
    }
    iVar9 = 1;
    do {
      piVar5 = (int *)in_ECX[8];
      *(undefined1 *)*piVar5 = *(undefined1 *)(iVar9 + iVar11);
      iVar6 = piVar5[1];
      *piVar5 = *piVar5 + 1;
      piVar5[1] = iVar6 + -1;
      if ((iVar6 + -1 == 0) && (cVar7 = (*(code *)piVar5[3])(), cVar7 == '\0')) {
        *(undefined4 *)(*in_ECX + 0x14) = 0x18;
        (**(code **)*in_ECX)();
      }
      iVar9 = iVar9 + 1;
    } while (iVar9 < 0x11);
    iVar9 = 0;
    if (0 < iVar10) {
      do {
        piVar5 = (int *)in_ECX[8];
        *(undefined1 *)*piVar5 = *(undefined1 *)(iVar11 + 0x11 + iVar9);
        iVar6 = piVar5[1];
        *piVar5 = *piVar5 + 1;
        piVar5[1] = iVar6 + -1;
        if ((iVar6 + -1 == 0) && (cVar7 = (*(code *)piVar5[3])(), cVar7 == '\0')) {
          *(undefined4 *)(*in_ECX + 0x14) = 0x18;
          (**(code **)*in_ECX)();
        }
        iVar9 = iVar9 + 1;
      } while (iVar9 < iVar10);
    }
    *(undefined1 *)(iVar11 + 0x111) = 1;
  }
  return;
}


