// 100fe51a size=174 __cftoe2

/* Library Function - Single Match
    __cftoe2
   
   Library: Visual Studio 2003 Release */

void __cftoe2(int param_1,int param_2,char param_3)

{
  int *in_EAX;
  undefined1 *puVar1;
  int iVar2;
  int iVar3;
  undefined1 *unaff_EBX;
  
  if (param_3 != '\0') {
    __shift();
  }
  if (*in_EAX == 0x2d) {
    *unaff_EBX = 0x2d;
    unaff_EBX = unaff_EBX + 1;
  }
  puVar1 = unaff_EBX;
  if (0 < param_1) {
    puVar1 = unaff_EBX + 1;
    *unaff_EBX = *puVar1;
    *puVar1 = DAT_101a50e4;
  }
  puVar1 = (undefined1 *)FUN_100fe890(puVar1 + param_1 + (uint)(param_3 == '\0'),"e+000");
  if (param_2 != 0) {
    *puVar1 = 0x45;
  }
  if (*(char *)in_EAX[3] != '0') {
    iVar2 = in_EAX[1] + -1;
    if (iVar2 < 0) {
      iVar2 = -iVar2;
      puVar1[1] = 0x2d;
    }
    if (99 < iVar2) {
      iVar3 = iVar2 / 100;
      iVar2 = iVar2 % 100;
      puVar1[2] = puVar1[2] + (char)iVar3;
    }
    if (9 < iVar2) {
      iVar3 = iVar2 / 10;
      iVar2 = iVar2 % 10;
      puVar1[3] = puVar1[3] + (char)iVar3;
    }
    puVar1[4] = puVar1[4] + (char)iVar2;
  }
  return;
}


