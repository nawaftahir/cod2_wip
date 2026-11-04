// 10044a10 size=259 FUN_10044a10

void FUN_10044a10(int *param_1)

{
  int iVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  int local_c;
  char local_8 [8];
  
  iVar2 = (int)param_1;
  local_8[0] = '\0';
  local_8[1] = '\0';
  local_8[2] = '\0';
  local_8[3] = '\0';
  local_8[4] = '\0';
  local_8[5] = '\0';
  local_8[6] = '\0';
  local_8[7] = '\0';
  local_c = 0;
  if (0 < *(int *)((int)param_1 + 0xec)) {
    param_1 = (int *)((int)param_1 + 0xf0);
    do {
      iVar4 = *(int *)(*param_1 + 0x14);
      iVar1 = *(int *)(*param_1 + 0x18);
      if (local_8[iVar4] == '\0') {
        if (*(int *)(iVar2 + 0x60 + iVar4 * 4) == 0) {
          iVar3 = (*(code *)**(undefined4 **)(iVar2 + 4))(iVar2,0,0x112);
          *(undefined1 *)(iVar3 + 0x111) = 0;
          *(int *)(iVar2 + 0x60 + iVar4 * 4) = iVar3;
        }
        FUN_100447b0(iVar2,*(undefined4 *)(iVar2 + 0x60 + iVar4 * 4));
        local_8[iVar4] = '\x01';
      }
      if (local_8[iVar1 + 4] == '\0') {
        if (*(int *)(iVar2 + 0x70 + iVar1 * 4) == 0) {
          iVar4 = (*(code *)**(undefined4 **)(iVar2 + 4))(iVar2,0,0x112);
          *(undefined1 *)(iVar4 + 0x111) = 0;
          *(int *)(iVar2 + 0x70 + iVar1 * 4) = iVar4;
        }
        FUN_100447b0(iVar2,*(undefined4 *)(iVar2 + 0x70 + iVar1 * 4));
        local_8[iVar1 + 4] = '\x01';
      }
      local_c = local_c + 1;
      param_1 = param_1 + 1;
    } while (local_c < *(int *)(iVar2 + 0xec));
  }
  return;
}


