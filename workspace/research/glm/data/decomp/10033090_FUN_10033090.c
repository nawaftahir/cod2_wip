// 10033090 size=48 FUN_10033090

float10 FUN_10033090(void)

{
  uint *unaff_ESI;
  uint *unaff_EDI;
  LARGE_INTEGER local_8;
  
  QueryPerformanceFrequency(&local_8);
  return (float10)CONCAT44((unaff_ESI[1] - unaff_EDI[1]) - (uint)(*unaff_ESI < *unaff_EDI),
                           *unaff_ESI - *unaff_EDI) / (float10)(longlong)local_8;
}


