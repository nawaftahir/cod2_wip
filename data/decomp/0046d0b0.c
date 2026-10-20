
void FUN_0046d0b0(void)

{
  char cVar1;
  LPSTR in_EAX;
  DWORD DVar2;
  DWORD unaff_EBX;
  char *unaff_ESI;
  int iVar3;
  LPSTR local_8;
  
  local_8 = (LPSTR)0x0;
  GetFullPathNameA(unaff_ESI,unaff_EBX,in_EAX,&local_8);
  DVar2 = GetShortPathNameA(unaff_ESI,in_EAX,unaff_EBX);
  if (DVar2 == 0) {
    iVar3 = (int)in_EAX - (int)unaff_ESI;
    do {
      cVar1 = *unaff_ESI;
      unaff_ESI[iVar3] = cVar1;
      unaff_ESI = unaff_ESI + 1;
    } while (cVar1 != '\0');
  }
  return;
}

