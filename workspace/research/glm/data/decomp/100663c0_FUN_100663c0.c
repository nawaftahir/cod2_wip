// 100663c0 size=569 FUN_100663c0

int FUN_100663c0(int *param_1)

{
  char cVar1;
  char *pcVar2;
  char *pcVar3;
  int in_ECX;
  int iVar4;
  undefined4 *puVar5;
  undefined1 local_68 [56];
  undefined4 local_30 [8];
  undefined4 local_10;
  int local_c;
  undefined4 *local_8;
  
  local_10 = *(undefined4 *)(in_ECX + 0x26c);
  puVar5 = local_30;
  local_c = in_ECX;
  for (iVar4 = 8; iVar4 != 0; iVar4 = iVar4 + -1) {
    *puVar5 = 0;
    puVar5 = puVar5 + 1;
  }
  local_8 = operator_new(0x14);
  if (local_8 == (undefined4 *)0x0) {
    local_8 = (undefined4 *)0x0;
  }
  else {
    *local_8 = "DIRECT3D";
    local_8[1] = 0;
    local_8[2] = 0;
    local_8[3] = 0;
    local_8[4] = 0;
  }
  if (local_8 != (undefined4 *)0x0) {
    iVar4 = FUN_100652c0(local_8);
    if (iVar4 < 0) goto LAB_1006657b;
    local_8 = operator_new(0x14);
    if (local_8 == (undefined4 *)0x0) {
      local_8 = (undefined4 *)0x0;
    }
    else {
      *local_8 = &DAT_1010c914;
      local_8[1] = 0;
      local_8[2] = 0;
      local_8[3] = 0;
      local_8[4] = 0;
    }
    if (local_8 != (undefined4 *)0x0) {
      iVar4 = FUN_100652c0(local_8);
      if (iVar4 < 0) goto LAB_1006657b;
      local_30[0] = 2;
      local_30[2] = 0x900;
      local_8 = operator_new(0x14);
      if (local_8 == (undefined4 *)0x0) {
        local_8 = (undefined4 *)0x0;
      }
      else {
        *local_8 = "DIRECT3D_VERSION";
        local_8[1] = 0;
        local_8[2] = 0;
        local_8[3] = 0;
        local_8[4] = 0;
      }
      if (local_8 != (undefined4 *)0x0) {
        iVar4 = FUN_1006506e(0x30);
        if (iVar4 == 0) {
          iVar4 = 0;
        }
        else {
          iVar4 = FUN_10082a7b(local_30);
        }
        local_8[2] = iVar4;
        if (iVar4 != 0) {
          iVar4 = FUN_100652c0(local_8);
          if (iVar4 < 0) goto LAB_1006657b;
          local_30[0] = 2;
          local_30[2] = 0x902;
          local_8 = operator_new(0x14);
          if (local_8 == (undefined4 *)0x0) {
            local_8 = (undefined4 *)0x0;
          }
          else {
            *local_8 = "D3DX_VERSION";
            local_8[1] = 0;
            local_8[2] = 0;
            local_8[3] = 0;
            local_8[4] = 0;
          }
          if (local_8 != (undefined4 *)0x0) {
            iVar4 = FUN_1006506e(0x30);
            if (iVar4 == 0) {
              iVar4 = 0;
            }
            else {
              iVar4 = FUN_10082a7b(local_30);
            }
            local_8[2] = iVar4;
            if (iVar4 != 0) {
              iVar4 = FUN_100652c0(local_8);
              if (-1 < iVar4) {
                local_8 = (undefined4 *)0x0;
                if (param_1 != (int *)0x0) {
                  FUN_10067704();
                  *(undefined1 **)(local_c + 0x26c) = local_68;
                  iVar4 = *param_1;
                  while (iVar4 != 0) {
                    pcVar2 = (char *)param_1[1];
                    if (pcVar2 == (char *)0x0) {
                      iVar4 = 0;
                    }
                    else {
                      pcVar3 = pcVar2;
                      do {
                        cVar1 = *pcVar3;
                        pcVar3 = pcVar3 + 1;
                      } while (cVar1 != '\0');
                      iVar4 = (int)pcVar3 - (int)(pcVar2 + 1);
                    }
                    iVar4 = FUN_1006771f(pcVar2,iVar4,0,0,local_c,local_c + 0x18);
                    if ((iVar4 < 0) || (iVar4 = FUN_1006611b(*param_1,0), iVar4 < 0)) {
                      FUN_1006771e();
                      goto LAB_1006657b;
                    }
                    param_1 = param_1 + 2;
                    iVar4 = *param_1;
                  }
                  FUN_1006771e();
                }
                iVar4 = 0;
              }
              goto LAB_1006657b;
            }
          }
        }
      }
    }
  }
  iVar4 = -0x7ff8fff2;
LAB_1006657b:
  *(undefined4 *)(local_c + 0x26c) = local_10;
  if (local_8 != (undefined4 *)0x0) {
    FUN_10065146(1);
  }
  return iVar4;
}


