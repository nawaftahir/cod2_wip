// 10051c10 size=492 FUN_10051c10

void FUN_10051c10(void)

{
  int iVar1;
  int iVar2;
  bool bVar3;
  undefined4 *puVar4;
  int iVar5;
  int iVar6;
  undefined4 uVar7;
  int *piVar8;
  undefined4 *puVar9;
  int *unaff_ESI;
  int iStack_10;
  undefined1 uStack_c;
  
  puVar4 = (undefined4 *)(**(code **)unaff_ESI[1])();
  unaff_ESI[0x6a] = (int)puVar4;
  *puVar4 = &LAB_100516e0;
  puVar4[1] = FUN_10051700;
  *(undefined1 *)(puVar4 + 2) = 0;
  if (*(char *)((int)unaff_ESI + 0x112) != '\0') {
    *(undefined4 *)(*unaff_ESI + 0x14) = 0x19;
    (**(code **)*unaff_ESI)();
  }
  if (((char)unaff_ESI[0x14] == '\0') || (bVar3 = true, unaff_ESI[0x48] < 2)) {
    bVar3 = false;
  }
  iStack_10 = 0;
  if (0 < unaff_ESI[0xb]) {
    piVar8 = (int *)(unaff_ESI[0x33] + 0x24);
    puVar9 = puVar4 + 0xd;
    do {
      iVar5 = (piVar8[-7] * *piVar8) / unaff_ESI[0x48];
      iVar6 = (piVar8[-6] * *piVar8) / unaff_ESI[0x48];
      iVar1 = unaff_ESI[0x47];
      iVar2 = unaff_ESI[0x46];
      puVar9[0xc] = iVar6;
      if ((char)piVar8[3] == '\0') {
        *puVar9 = &LAB_100517f0;
      }
      else if ((iVar5 == iVar2) && (iVar6 == iVar1)) {
        *puVar9 = &LAB_100517e0;
      }
      else {
        if (iVar5 * 2 == iVar2) {
          if (iVar6 == iVar1) {
            if ((bVar3) && (2 < (uint)piVar8[1])) {
              *puVar9 = &LAB_10051a20;
            }
            else {
              *puVar9 = &LAB_10051940;
            }
          }
          else {
            if ((iVar5 * 2 != iVar2) || (iVar6 * 2 != iVar1)) goto LAB_10051d64;
            if ((bVar3) && (2 < (uint)piVar8[1])) {
              *puVar9 = FUN_10051ae0;
              *(undefined1 *)(puVar4 + 2) = 1;
            }
            else {
              *puVar9 = &LAB_100519a0;
            }
          }
        }
        else {
LAB_10051d64:
          if ((iVar2 % iVar5 == 0) && (iVar1 % iVar6 == 0)) {
            uStack_c = (undefined1)(iVar2 / iVar5);
            *puVar9 = FUN_10051800;
            *(undefined1 *)(iStack_10 + 0x8c + (int)puVar4) = uStack_c;
            *(char *)(iStack_10 + 0x96 + (int)puVar4) = (char)(iVar1 / iVar6);
          }
          else {
            *(undefined4 *)(*unaff_ESI + 0x14) = 0x26;
            (**(code **)*unaff_ESI)();
          }
        }
        uVar7 = (**(code **)(unaff_ESI[1] + 8))();
        puVar9[-10] = uVar7;
      }
      iStack_10 = iStack_10 + 1;
      puVar9 = puVar9 + 1;
      piVar8 = piVar8 + 0x15;
    } while (iStack_10 < unaff_ESI[0xb]);
  }
  return;
}


