// 10082304 size=33 FUN_10082304

undefined4 FUN_10082304(void)

{
  undefined4 *in_ECX;
  
  if ((HGDIOBJ)*in_ECX != (HGDIOBJ)0x0) {
    DeleteObject((HGDIOBJ)*in_ECX);
  }
  *in_ECX = 0;
  in_ECX[1] = 0;
  in_ECX[2] = 0;
  return 0;
}


