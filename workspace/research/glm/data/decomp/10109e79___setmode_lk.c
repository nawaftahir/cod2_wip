// 10109e79 size=108 __setmode_lk

/* Library Function - Single Match
    __setmode_lk
   
   Library: Visual Studio 2003 Release */

int __setmode_lk(uint param_1,int param_2)

{
  int *piVar1;
  byte *pbVar2;
  byte bVar3;
  undefined4 *puVar4;
  int iVar5;
  
  piVar1 = &DAT_1076aca0 + ((int)param_1 >> 5);
  iVar5 = (param_1 & 0x1f) * 0x24;
  bVar3 = *(byte *)(*piVar1 + 4 + iVar5);
  if (param_2 == 0x8000) {
    pbVar2 = (byte *)(*piVar1 + 4 + iVar5);
    *pbVar2 = *pbVar2 & 0x7f;
  }
  else {
    if (param_2 != 0x4000) {
      puVar4 = (undefined4 *)FUN_100fc216();
      *puVar4 = 0x16;
      return -1;
    }
    pbVar2 = (byte *)(*piVar1 + 4 + iVar5);
    *pbVar2 = *pbVar2 | 0x80;
  }
  return (-(uint)((bVar3 & 0x80) != 0) & 0xffffc000) + 0x8000;
}


