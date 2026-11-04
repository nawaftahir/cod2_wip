// 100fc8d6 size=391 __isindst_lk

/* Library Function - Single Match
    __isindst_lk
   
   Library: Visual Studio 2003 Release */

bool __isindst_lk(void)

{
  int iVar1;
  bool bVar2;
  int iVar3;
  int *unaff_EBX;
  undefined2 uVar4;
  undefined2 uVar5;
  undefined2 uVar6;
  
  if (DAT_101a4db4 == 0) {
    return false;
  }
  iVar1 = unaff_EBX[5];
  if ((iVar1 != DAT_101a4e48) || (iVar1 != DAT_101a4e54)) {
    if (DAT_101adfd4 == 0) {
      cvtdate(1,1,iVar1,1,0,0,0,0,0);
      cvtdate(0,1,iVar1,5,0,0,0,0,0);
    }
    else {
      if (DAT_101adfc0 != 0) {
        uVar5 = 0;
        uVar4 = 0;
        uVar6 = DAT_101adfc6;
      }
      else {
        uVar5 = DAT_101adfc4;
        uVar4 = DAT_101adfc6;
        uVar6 = 0;
      }
      cvtdate(1,DAT_101adfc0 == 0,iVar1,uVar4,uVar5,uVar6,DAT_101adfca,DAT_101adfcc,DAT_101adfce);
      if (DAT_101adf6c != 0) {
        uVar5 = 0;
        uVar4 = 0;
        uVar6 = DAT_101adf72;
      }
      else {
        uVar5 = DAT_101adf70;
        uVar4 = DAT_101adf72;
        uVar6 = 0;
      }
      cvtdate(0,DAT_101adf6c == 0,iVar1,uVar4,uVar5,uVar6,DAT_101adf76,DAT_101adf78,DAT_101adf7a);
    }
  }
  iVar1 = unaff_EBX[7];
  if (DAT_101a4e4c < DAT_101a4e58) {
    if ((iVar1 < DAT_101a4e4c) || (DAT_101a4e58 < iVar1)) {
      return false;
    }
    if ((DAT_101a4e4c < iVar1) && (iVar1 < DAT_101a4e58)) {
      return true;
    }
  }
  else {
    if (iVar1 < DAT_101a4e58) {
      return true;
    }
    if (DAT_101a4e4c < iVar1) {
      return true;
    }
    if ((DAT_101a4e58 < iVar1) && (iVar1 < DAT_101a4e4c)) {
      return false;
    }
  }
  iVar3 = ((unaff_EBX[2] * 0x3c + unaff_EBX[1]) * 0x3c + *unaff_EBX) * 1000;
  if (iVar1 == DAT_101a4e4c) {
    bVar2 = DAT_101a4e50 <= iVar3;
  }
  else {
    bVar2 = iVar3 < DAT_101a4e5c;
  }
  return bVar2;
}


