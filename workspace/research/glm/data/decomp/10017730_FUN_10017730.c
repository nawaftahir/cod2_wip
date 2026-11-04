// 10017730 size=347 FUN_10017730

void FUN_10017730(void)

{
  int iVar1;
  undefined4 *puVar2;
  int *piVar3;
  char cVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  undefined2 local_8;
  uint local_4;
  
  FUN_1000d680();
  local_4 = 0;
  do {
    iVar1 = *(int *)((int)&DAT_101d4d28 + local_4);
    if ((iVar1 != 0) && (iVar6 = 0, *(short *)(iVar1 + 0x34) != 0)) {
      iVar7 = 0;
      do {
        if ((*(char *)(*(int *)(iVar1 + 0x3c) + 5 + iVar7) != '\x05') &&
           (puVar2 = *(undefined4 **)(*(int *)(iVar1 + 0x3c) + iVar7 + 8),
           puVar2 != (undefined4 *)0x0)) {
          if (*(char *)((int)puVar2 + 0xb) == '\0') {
            switch(*(undefined1 *)((int)puVar2 + 10)) {
            default:
              goto switchD_1001779d_caseD_0;
            case 2:
            case 5:
              iVar5 = DAT_101d0a68;
              break;
            case 3:
              iVar5 = DAT_101d0a6c;
              break;
            case 4:
              iVar5 = DAT_101d0a70;
            }
            if (iVar5 < 0) {
              local_8 = 0x200;
            }
            else {
              if (3 < iVar5) {
                iVar5 = 3;
              }
              local_8 = CONCAT11(2,(char)iVar5);
            }
          }
          else {
switchD_1001779d_caseD_0:
            local_8 = 0;
          }
          if (*(char *)(puVar2 + 2) != (char)local_8) {
            if ((1 < *(byte *)(puVar2 + 3)) && (*(byte *)(puVar2 + 3) != 4)) {
              DAT_101d0a74 = DAT_101d0a74 - puVar2[4];
              DAT_101d0a78 = DAT_101d0a78 - puVar2[5];
            }
            piVar3 = (int *)puVar2[1];
            if (piVar3 != (int *)0x0) {
              (**(code **)(*piVar3 + 8))(piVar3);
              puVar2[1] = 0;
              puVar2[4] = 0;
              puVar2[5] = 0;
            }
            *puVar2 = 0;
            *(undefined2 *)(puVar2 + 2) = local_8;
            cVar4 = FUN_1000fa40();
            if (cVar4 == '\0') {
              FUN_100138c0(1,"failed to load image \'%s\'",puVar2[8]);
            }
          }
        }
        iVar6 = iVar6 + 1;
        iVar7 = iVar7 + 0xc;
      } while (iVar6 < (int)(uint)*(ushort *)(iVar1 + 0x34));
    }
    local_4 = local_4 + 4;
    if (0xfff < local_4) {
      return;
    }
  } while( true );
}


