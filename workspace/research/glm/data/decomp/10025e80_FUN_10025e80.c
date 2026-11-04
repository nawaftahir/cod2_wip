// 10025e80 size=656 FUN_10025e80

uint FUN_10025e80(int param_1,int param_2)

{
  int in_EAX;
  HMONITOR hMonitor;
  BOOL BVar1;
  int iVar2;
  undefined4 uVar3;
  uint uVar4;
  int *piVar5;
  int in_ECX;
  int iVar6;
  LONG LVar7;
  undefined1 *puVar8;
  int *piVar9;
  int iVar10;
  int *piVar11;
  char *pcVar12;
  int iVar13;
  int local_4c;
  tagPOINT local_48 [4];
  tagMONITORINFO local_28;
  
  local_4c = 0;
  iVar2 = DAT_101d4c70;
  iVar6 = DAT_101d4c6c;
  local_48[0].x = in_EAX;
  local_48[0].y = in_ECX;
  if (DAT_101d4c78 != 0) {
LAB_10025f4c:
    iVar13 = 0;
    piVar9 = &local_4c;
    piVar11 = (int *)0x3;
    iVar10 = 0x15;
    piVar5 = DAT_101d1bf8;
    iVar2 = (**(code **)(*DAT_101d1bf8 + 0x90))(DAT_101d1bf8,iVar6,iVar2,0x15,3,piVar9,0);
    if (-1 < iVar2) {
      iVar2 = (**(code **)(*DAT_101d4940 + 0x10))(DAT_101d4940,piVar11);
      if (-1 < iVar2) {
        local_4c = (int)piVar9 + param_1;
        piVar9 = (int *)0x10;
        local_48[0].x = iVar13 + local_28.rcWork.left;
        iVar2 = (**(code **)(*piVar11 + 0x34))(piVar11,&stack0xffffffa4,&stack0xffffffac);
        if (-1 < iVar2) {
          if (local_28.rcMonitor.top == 3) {
            if (0 < local_28.rcWork.left) {
              do {
                iVar2 = param_1;
                if (0 < param_1) {
                  do {
                    *(char *)local_28.rcMonitor.right = (char)*piVar11;
                    *(undefined1 *)(local_28.rcMonitor.right + 1) =
                         *(undefined1 *)((int)piVar11 + 1);
                    *(undefined1 *)(local_28.rcMonitor.right + 2) =
                         *(undefined1 *)((int)piVar11 + 2);
                    local_28.rcMonitor.right = local_28.rcMonitor.right + 3;
                    piVar11 = piVar11 + 1;
                    iVar2 = iVar2 + -1;
                  } while (iVar2 != 0);
                }
                piVar11 = (int *)((int)piVar11 + iVar10 + param_1 * -4);
                local_28.rcWork.left = local_28.rcWork.left + -1;
              } while (local_28.rcWork.left != 0);
            }
          }
          else {
            iVar2 = param_1 * 4;
            if (iVar10 == iVar2) {
              FUN_1005eaf0(local_28.rcMonitor.right,piVar11,param_1 * local_28.rcMonitor.left * 4);
            }
            else {
              LVar7 = local_28.rcMonitor.left;
              puVar8 = (undefined1 *)local_28.rcMonitor.right;
              if (0 < local_28.rcMonitor.left) {
                do {
                  FUN_1005eaf0(puVar8,piVar11,iVar2);
                  puVar8 = puVar8 + iVar2;
                  piVar11 = (int *)((int)piVar11 + iVar10);
                  LVar7 = LVar7 + -1;
                } while (LVar7 != 0);
              }
            }
          }
          (**(code **)(*piVar5 + 0x38))(piVar5);
          do {
            (**(code **)(*piVar9 + 8))(piVar9);
            piVar9 = (int *)0x0;
          } while (DAT_1076a830 != 0);
          return 1;
        }
        do {
          (**(code **)(*piVar5 + 8))(piVar5);
          piVar5 = (int *)0x0;
        } while (DAT_1076a830 != 0);
        uVar3 = FUN_100efe3c(iVar2,iVar2);
        uVar4 = (*(code *)RI_Printf)
                          (3,"ERROR: cannot take screenshot: LockRect failed: %s (0x%08x)\n",uVar3);
        return uVar4 & 0xffffff00;
      }
      do {
        (**(code **)(*piVar11 + 8))(piVar11);
        piVar11 = (int *)0x0;
      } while (DAT_1076a830 != 0);
    }
    uVar3 = FUN_100efe3c(iVar2,iVar2);
    uVar4 = (*(code *)RI_Printf)
                      (3,
                       "ERROR: cannot take screenshot: couldn\'t create the off-screen surface: %s (0x%08x)\n"
                       ,uVar3);
    return uVar4 & 0xffffff00;
  }
  hMonitor = MonitorFromWindow(DAT_101d493c,2);
  local_28.cbSize = 0x28;
  BVar1 = GetMonitorInfoA(hMonitor,&local_28);
  if (BVar1 == 0) {
    pcVar12 = "ERROR: cannot take screenshot: couldn\'t get screen dimensions\n";
  }
  else {
    ClientToScreen(DAT_101d493c,local_48);
    if ((((local_28.rcMonitor.left <= local_48[0].x) && (local_28.rcMonitor.top <= local_48[0].y))
        && (local_48[0].x + param_1 <= local_28.rcMonitor.right)) &&
       (local_48[0].y + param_2 <= local_28.rcMonitor.bottom)) {
      local_48[0].x = local_48[0].x - local_28.rcMonitor.left;
      local_48[0].y = local_48[0].y - local_28.rcMonitor.top;
      iVar2 = local_28.rcMonitor.bottom - local_28.rcMonitor.top;
      iVar6 = local_28.rcMonitor.right - local_28.rcMonitor.left;
      goto LAB_10025f4c;
    }
    pcVar12 = "ERROR: cannot take screenshot: game window is partially off-screen\n";
  }
  uVar4 = (*(code *)RI_Printf)(3,pcVar12);
  return uVar4 & 0xffffff00;
}


