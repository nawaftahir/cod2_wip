
/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

void FUN_0043cb00(void)

{
  byte bVar1;
  byte *pbVar2;
  int iVar3;
  HWND unaff_EBX;
  byte *pbVar4;
  byte *unaff_EDI;
  bool bVar5;
  byte local_408 [1024];
  undefined4 local_8;
  
  local_8 = DAT_0058ea68;
  GetWindowTextA(unaff_EBX,(LPSTR)local_408,0x400);
  pbVar4 = local_408;
  pbVar2 = unaff_EDI;
  do {
    bVar1 = *pbVar2;
    bVar5 = bVar1 < *pbVar4;
    if (bVar1 != *pbVar4) {
LAB_0043cb54:
      iVar3 = (1 - (uint)bVar5) - (uint)(bVar5 != 0);
      goto LAB_0043cb59;
    }
    if (bVar1 == 0) break;
    bVar1 = pbVar2[1];
    bVar5 = bVar1 < pbVar4[1];
    if (bVar1 != pbVar4[1]) goto LAB_0043cb54;
    pbVar2 = pbVar2 + 2;
    pbVar4 = pbVar4 + 2;
  } while (bVar1 != 0);
  iVar3 = 0;
LAB_0043cb59:
  if (iVar3 != 0) {
    SetWindowTextA(unaff_EBX,(LPCSTR)unaff_EDI);
  }
  return;
}

