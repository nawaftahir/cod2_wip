// 10035fb0 size=141 FUN_10035fb0

uint FUN_10035fb0(uint param_1,int *param_2)

{
  byte bVar1;
  uint in_EAX;
  uint uVar2;
  int *in_ECX;
  int in_EDX;
  uint uVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  
  bVar1 = (((char)in_EAX << 2 | (byte)param_1 & 3) << 2 | (byte)in_EDX & 3) << 2;
  uVar2 = CONCAT31((int3)(in_EAX >> 8),bVar1);
  iVar4 = 0;
  iVar6 = *in_ECX + -1;
  if (-1 < iVar6) {
    do {
      iVar5 = iVar6 + iVar4 >> 1;
      uVar3 = *(int *)(in_ECX[1] + iVar5 * 8) -
              (((in_EAX & 0xfffffffc) << 0xb | param_1 & 0xfffffffc) << 8 | in_EDX >> 2);
      if (uVar3 == 0) {
        uVar2 = (uint)bVar1;
        uVar3 = *(byte *)(in_ECX[1] + 4 + iVar5 * 8) - uVar2 & 0xfffffffe;
        if (uVar3 == 0) {
          *param_2 = iVar5;
          return 1;
        }
      }
      if ((int)uVar3 < 0) {
        iVar4 = iVar5 + 1;
      }
      else {
        iVar6 = iVar5 + -1;
      }
    } while (iVar4 <= iVar6);
  }
  *param_2 = iVar6;
  return uVar2 & 0xffffff00;
}


