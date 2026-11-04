// 1000de10 size=340 FUN_1000de10

void FUN_1000de10(byte *param_1,int param_2)

{
  undefined1 *in_EAX;
  int iVar1;
  byte *pbVar2;
  byte *pbVar3;
  int in_ECX;
  int in_EDX;
  int iVar4;
  undefined1 *puVar5;
  undefined1 *puVar6;
  undefined1 *local_28;
  int local_24;
  int local_1c;
  int local_10;
  
  if ((in_EDX != 1) || (param_2 != 1)) {
    iVar4 = in_EDX * in_ECX;
    iVar1 = in_EDX >> 1;
    local_10 = param_2 >> 1;
    if ((iVar1 == 0) || (local_10 == 0)) {
      local_10 = iVar1 + local_10;
      local_28 = in_EAX;
      if (0 < local_10) {
        do {
          if (0 < in_ECX) {
            pbVar3 = param_1;
            iVar1 = in_ECX;
            do {
              pbVar3[(int)local_28 - (int)param_1] =
                   (byte)((int)((uint)pbVar3[in_ECX] + (uint)*pbVar3) >> 1);
              pbVar3 = pbVar3 + 1;
              iVar1 = iVar1 + -1;
            } while (iVar1 != 0);
          }
          param_1 = param_1 + in_ECX * 2;
          local_28 = local_28 + in_ECX;
          local_10 = local_10 + -1;
        } while (local_10 != 0);
      }
    }
    else if (0 < local_10) {
      do {
        pbVar3 = param_1;
        puVar5 = in_EAX;
        local_1c = iVar1;
        if (0 < iVar1) {
          do {
            if (0 < in_ECX) {
              pbVar2 = pbVar3 + iVar4;
              puVar6 = puVar5;
              local_24 = in_ECX;
              do {
                *puVar6 = (char)((int)((uint)pbVar2[in_ECX - iVar4] +
                                       (uint)(byte)puVar6[(int)pbVar3 - (int)puVar5] +
                                       (uint)pbVar2[in_ECX] + (uint)*pbVar2) >> 2);
                pbVar2 = pbVar2 + 1;
                puVar6 = puVar6 + 1;
                local_24 = local_24 + -1;
              } while (local_24 != 0);
            }
            local_1c = local_1c + -1;
            pbVar3 = pbVar3 + in_ECX * 2;
            puVar5 = puVar5 + in_ECX;
          } while (local_1c != 0);
        }
        param_1 = param_1 + iVar4 * 2;
        in_EAX = in_EAX + iVar1 * in_ECX;
        local_10 = local_10 + -1;
      } while (local_10 != 0);
      return;
    }
  }
  return;
}


