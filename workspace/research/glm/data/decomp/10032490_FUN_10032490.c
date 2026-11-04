// 10032490 size=165 FUN_10032490

void FUN_10032490(void)

{
  undefined1 *in_EAX;
  float *in_ECX;
  undefined1 local_10;
  undefined1 local_c;
  
  local_c = (undefined1)(int)ROUND(*in_ECX * 255.0 + 9.313226e-10);
  *in_EAX = local_c;
  local_10 = (undefined1)(int)ROUND(in_ECX[1] * 255.0 + 9.313226e-10);
  in_EAX[1] = local_10;
  local_10 = (undefined1)(int)ROUND(in_ECX[2] * 255.0 + 9.313226e-10);
  in_EAX[2] = local_10;
  local_10 = (undefined1)(int)ROUND(in_ECX[3] * 255.0 + 9.313226e-10);
  in_EAX[3] = local_10;
  return;
}


