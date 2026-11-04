// 10038fd0 size=198 FUN_10038fd0

void FUN_10038fd0(void)

{
  float fVar1;
  int unaff_ESI;
  
  fVar1 = *(float *)(DAT_101ce614 + 8);
  FUN_10038cf0(0xbc,0,4);
  FUN_10038cf0(0xc1,0,4);
  FUN_1005b340();
  FUN_1005b340();
  FUN_1005a880();
  *(float *)(unaff_ESI + 0x30) = *(float *)(unaff_ESI + 0x30) + 0.0;
  *(float *)(unaff_ESI + 0x34) = *(float *)(unaff_ESI + 0x34) + 0.0;
  *(float *)(unaff_ESI + 0x38) = -fVar1 + *(float *)(unaff_ESI + 0x38);
  *(float *)(unaff_ESI + 0x3c) = *(float *)(unaff_ESI + 0x3c) + 0.0;
  return;
}


