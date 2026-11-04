// 1005e0b0 size=76 FUN_1005e0b0

void FUN_1005e0b0(void)

{
  float *in_EAX;
  float *unaff_ESI;
  float *unaff_EDI;
  float local_c;
  float local_8;
  float local_4;
  
  FUN_1005df90(&local_c,*in_EAX - *unaff_ESI,in_EAX[1] - unaff_ESI[1],in_EAX[2] - unaff_ESI[2]);
  *unaff_EDI = local_c + *unaff_ESI;
  unaff_EDI[1] = local_8 + unaff_ESI[1];
  unaff_EDI[2] = local_4 + unaff_ESI[2];
  return;
}


