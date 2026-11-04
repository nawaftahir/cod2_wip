
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00492c50(void)

{
  short *in_EAX;
  undefined4 *puVar1;
  float *unaff_EBX;
  short sVar2;
  float local_8;
  
  puVar1 = &DAT_01154680 + *in_EAX * 0x12;
  sVar2 = 0;
  local_8 = *(float *)(&DAT_011546c0 + *in_EAX * 0x48) * *(float *)(in_EAX + 2) +
            *(float *)(in_EAX + 6) * *(float *)(in_EAX + 4);
  if (0 < DAT_01154630) {
    do {
      sVar2 = sVar2 + 1;
      if ((*(short *)(puVar1 + 0x11) < 0) || ((float)puVar1[0x10] == _DAT_00556a70)) {
        local_8 = 0.0;
        break;
      }
      if (local_8 < (float)puVar1[0x10]) break;
      local_8 = local_8 - (float)puVar1[0x10];
      puVar1 = &DAT_01154680 + *(short *)(puVar1 + 0x11) * 0x12;
    } while (sVar2 < DAT_01154630);
  }
  *unaff_EBX = local_8 * (float)puVar1[10] + (float)puVar1[7];
  unaff_EBX[1] = local_8 * (float)puVar1[0xb] + (float)puVar1[8];
  unaff_EBX[2] = local_8 * (float)puVar1[0xc] + (float)puVar1[9];
  return;
}

