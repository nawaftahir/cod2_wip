// 10105490 size=37 write_char

/* Library Function - Single Match
    _write_char
   
   Library: Visual Studio 2003 Release */

void __cdecl write_char(undefined4 param_1)

{
  short sVar1;
  int in_EAX;
  int *unaff_ESI;
  
  if (((*(byte *)(in_EAX + 0xc) & 0x40) == 0) || (*(int *)(in_EAX + 8) != 0)) {
    sVar1 = __putwc_lk(param_1);
    if (sVar1 == -1) {
      *unaff_ESI = -1;
      return;
    }
  }
  *unaff_ESI = *unaff_ESI + 1;
  return;
}


