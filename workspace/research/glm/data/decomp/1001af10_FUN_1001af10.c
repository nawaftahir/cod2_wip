// 1001af10 size=165 FUN_1001af10

bool FUN_1001af10(undefined4 param_1,int param_2,uint *param_3)

{
  char cVar1;
  int iVar2;
  int iVar3;
  byte bVar4;
  int iVar5;
  int local_4;
  
  iVar2 = FUN_1005faf0(&DAT_10195544,1);
  if (iVar2 == 0) {
    return false;
  }
  iVar2 = 0;
  if (0 < param_2) {
    iVar5 = 10;
    do {
      if ((iVar5 != 10) && (iVar3 = FUN_1005faf0(&DAT_1019581c,1), iVar3 == 0)) {
        return false;
      }
      cVar1 = FUN_1001ad80(param_1,&local_4);
      if (cVar1 == '\0') {
        return false;
      }
      bVar4 = (byte)iVar5;
      iVar5 = iVar5 + 5;
      *param_3 = *param_3 | local_4 << (bVar4 & 0x1f);
      iVar2 = iVar2 + 1;
    } while (iVar2 < param_2);
  }
  iVar2 = FUN_1005faf0(&DAT_10195540,1);
  return iVar2 != 0;
}


