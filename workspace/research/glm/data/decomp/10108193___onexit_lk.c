// 10108193 size=128 __onexit_lk

/* Library Function - Single Match
    __onexit_lk
   
   Library: Visual Studio 2003 Release */

void __onexit_lk(void)

{
  size_t sVar1;
  void *pvVar2;
  size_t sVar3;
  undefined4 unaff_EDI;
  
  sVar1 = __msize(DAT_1076ada8);
  if (sVar1 < (uint)((int)DAT_1076ada4 + (4 - (int)DAT_1076ada8))) {
    sVar3 = 0x800;
    if (sVar1 < 0x800) {
      sVar3 = sVar1;
    }
    pvVar2 = _realloc(DAT_1076ada8,sVar3 + sVar1);
    if (pvVar2 == (void *)0x0) {
      pvVar2 = _realloc(DAT_1076ada8,sVar1 + 0x10);
      if (pvVar2 == (void *)0x0) {
        return;
      }
    }
    DAT_1076ada4 = (undefined4 *)((int)pvVar2 + ((int)DAT_1076ada4 - (int)DAT_1076ada8 >> 2) * 4);
    DAT_1076ada8 = pvVar2;
  }
  *DAT_1076ada4 = unaff_EDI;
  DAT_1076ada4 = DAT_1076ada4 + 1;
  return;
}


