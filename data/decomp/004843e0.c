
void FUN_004843e0(void)

{
  float fVar1;
  float *in_EAX;
  float *unaff_EBX;
  float *unaff_EDI;
  
  in_EAX[1] = -*unaff_EDI;
  in_EAX[2] = unaff_EDI[1];
  *in_EAX = unaff_EDI[2];
  fVar1 = -(in_EAX[1] * unaff_EDI[1] + unaff_EDI[2] * in_EAX[2] + *unaff_EDI * *in_EAX);
  *in_EAX = fVar1 * *unaff_EDI + *in_EAX;
  in_EAX[1] = fVar1 * unaff_EDI[1] + in_EAX[1];
  in_EAX[2] = fVar1 * unaff_EDI[2] + in_EAX[2];
  FUN_00483b50();
  *unaff_EBX = in_EAX[1] * unaff_EDI[2] - in_EAX[2] * unaff_EDI[1];
  unaff_EBX[1] = in_EAX[2] * *unaff_EDI - unaff_EDI[2] * *in_EAX;
  unaff_EBX[2] = unaff_EDI[1] * *in_EAX - in_EAX[1] * *unaff_EDI;
  return;
}

