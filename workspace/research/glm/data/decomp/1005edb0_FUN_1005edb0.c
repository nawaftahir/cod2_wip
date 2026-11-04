// 1005edb0 size=169 FUN_1005edb0

float * FUN_1005edb0(void)

{
  float *pfVar1;
  uint *puVar2;
  float10 fVar3;
  float *in_EAX;
  int unaff_ESI;
  float10 fVar4;
  uint local_c;
  
  local_c = 0;
  do {
    *(undefined4 *)(unaff_ESI + local_c * 4) = 0;
    if ((local_c & 1) != 0) {
      *(undefined4 *)(unaff_ESI + local_c * 4) = 0x80;
    }
    if ((local_c & 2) != 0) {
      puVar2 = (uint *)(unaff_ESI + local_c * 4);
      *puVar2 = *puVar2 | 0x40;
    }
    if ((local_c & 4) != 0) {
      puVar2 = (uint *)(unaff_ESI + local_c * 4);
      *puVar2 = *puVar2 | 0x20;
    }
    if ((local_c & 8) != 0) {
      puVar2 = (uint *)(unaff_ESI + local_c * 4);
      *puVar2 = *puVar2 | 0x10;
    }
    if ((local_c & 0x10) != 0) {
      puVar2 = (uint *)(unaff_ESI + local_c * 4);
      *puVar2 = *puVar2 | 8;
    }
    if ((local_c & 0x20) != 0) {
      puVar2 = (uint *)(unaff_ESI + local_c * 4);
      *puVar2 = *puVar2 | 4;
    }
    if ((local_c & 0x40) != 0) {
      puVar2 = (uint *)(unaff_ESI + local_c * 4);
      *puVar2 = *puVar2 | 2;
    }
    if ((char)local_c < '\0') {
      puVar2 = (uint *)(unaff_ESI + local_c * 4);
      *puVar2 = *puVar2 | 1;
    }
    pfVar1 = in_EAX + 1;
    fVar3 = (float10)fcos((float10)((float)(int)local_c * 0.024543693));
    fVar4 = (float10)fsin((float10)((float)(int)local_c * 0.024543693));
    *in_EAX = (float)fVar3;
    *pfVar1 = (float)fVar4;
    local_c = local_c + 1;
    in_EAX = in_EAX + 2;
  } while ((int)local_c < 0x100);
  return pfVar1;
}


