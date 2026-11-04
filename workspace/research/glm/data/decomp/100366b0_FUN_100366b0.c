// 100366b0 size=100 FUN_100366b0

void FUN_100366b0(void)

{
  int in_EAX;
  undefined4 *unaff_ESI;
  float10 fVar1;
  undefined4 local_c;
  undefined4 local_8;
  float local_4;
  
  *unaff_ESI = DAT_1072ddb4;
  if (*(char *)(in_EAX + 4) < '\0') {
    local_c = *(undefined4 *)(in_EAX + 8);
    local_8 = *(undefined4 *)(in_EAX + 0xc);
    local_4 = *(float *)(in_EAX + 0x10);
  }
  else {
    local_c = *(undefined4 *)(in_EAX + 0x3c);
    local_4 = *(float *)(in_EAX + 0x44) + 4.0;
    local_8 = *(undefined4 *)(in_EAX + 0x40);
  }
  fVar1 = (float10)FUN_100363a0(DAT_101d1b9c + 0x11c,&local_c,unaff_ESI + 2);
  unaff_ESI[1] = (float)fVar1;
  return;
}


