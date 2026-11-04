// 100826bd size=234 FUN_100826bd

int FUN_100826bd(int param_1,int param_2)

{
  uint uVar1;
  int *lpAddress;
  LPVOID pvVar2;
  int *in_ECX;
  uint dwSize;
  uint uVar3;
  
  uVar3 = (param_2 + -1 + in_ECX[2] & ~(param_2 - 1U)) + param_1;
  if ((uint)in_ECX[4] < uVar3) {
    uVar3 = (param_2 + 3U & ~(param_2 - 1U)) + param_1;
    for (uVar1 = in_ECX[5]; uVar1 < uVar3; uVar1 = uVar1 * 2) {
    }
    lpAddress = VirtualAlloc((LPVOID)0x0,uVar1,0x2000,4);
    if (lpAddress == (int *)0x0) {
      return 0;
    }
    dwSize = in_ECX[1] + -1 + uVar3 & ~(in_ECX[1] - 1U);
    pvVar2 = VirtualAlloc(lpAddress,dwSize,0x1000,4);
    if (pvVar2 == (LPVOID)0x0) {
      VirtualFree(lpAddress,0,0x8000);
      return 0;
    }
    *lpAddress = *in_ECX;
    *in_ECX = (int)lpAddress;
    in_ECX[4] = uVar1;
  }
  else {
    uVar1 = in_ECX[3];
    if (uVar3 <= uVar1) goto LAB_10082764;
    dwSize = in_ECX[1] + -1 + uVar3 & ~(in_ECX[1] - 1U);
    pvVar2 = VirtualAlloc((LPVOID)(*in_ECX + uVar1),dwSize - uVar1,0x1000,4);
    if (pvVar2 == (LPVOID)0x0) {
      return 0;
    }
  }
  in_ECX[3] = dwSize;
LAB_10082764:
  in_ECX[2] = uVar3;
  return (*in_ECX - param_1) + uVar3;
}


