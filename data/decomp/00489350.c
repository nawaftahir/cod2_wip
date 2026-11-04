
void FUN_00489350(void)

{
  float *in_EAX;
  float *unaff_ESI;
  float *unaff_EDI;
  float local_1c;
  float local_18;
  float local_14;
  float local_10;
  float local_c;
  float local_8;
  
  local_10 = *in_EAX - *unaff_ESI;
  local_c = in_EAX[1] - unaff_ESI[1];
  local_8 = in_EAX[2] - unaff_ESI[2];
  FUN_00489260(&local_1c);
  *unaff_EDI = local_1c + *unaff_ESI;
  unaff_EDI[1] = local_18 + unaff_ESI[1];
  unaff_EDI[2] = local_14 + unaff_ESI[2];
  return;
}

