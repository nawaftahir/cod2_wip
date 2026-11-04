// 100825f5 size=67 FUN_100825f5

undefined4 FUN_100825f5(void)

{
  undefined4 *in_ECX;
  
  if ((LPCVOID)in_ECX[2] != (LPCVOID)0x0) {
    UnmapViewOfFile((LPCVOID)in_ECX[2]);
    in_ECX[2] = 0;
    in_ECX[3] = 0;
  }
  if ((HANDLE)in_ECX[1] != (HANDLE)0xffffffff) {
    CloseHandle((HANDLE)in_ECX[1]);
    in_ECX[1] = 0xffffffff;
  }
  if ((HANDLE)*in_ECX != (HANDLE)0xffffffff) {
    CloseHandle((HANDLE)*in_ECX);
    *in_ECX = 0xffffffff;
  }
  return 0;
}


