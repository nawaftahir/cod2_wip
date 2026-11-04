extern unsigned int DAT_101d0a78;
extern int FUN_1000d480();


/* WARNING: Function: __chkstk replaced with injection: alloca_probe */

void FUN_1000c820(int *param_1)

{
  int iVar1;
  unsigned int uVar2;
  int iVar3;
  int iVar4;
  int local_202c [2058];
  unsigned int uStack_4;
  
  uStack_4 = 0x1000c82a;
  iVar4 = 0;
  local_202c[10] = 0;
  FUN_1000d480();
  local_202c[0] = 0;
  local_202c[1] = 0;
  local_202c[2] = 0;
  local_202c[3] = 0;
  local_202c[4] = 0;
  local_202c[5] = 0;
  local_202c[6] = 0;
  local_202c[7] = 0;
  local_202c[8] = 0;
  iVar3 = 0;
  local_202c[9] = 0;
  if (0 < local_202c[10]) {
    do {
      iVar1 = *(int *)(local_202c[iVar3 + 0xb] + 0x10);
      uVar2 = (unsigned int)*(byte *)(local_202c[iVar3 + 0xb] + 0xc);
      local_202c[uVar2] = local_202c[uVar2] + iVar1;
      if ((1 < uVar2) && (uVar2 != 4)) {
        iVar4 = iVar4 + iVar1;
      }
      iVar3 = iVar3 + 1;
    } while (iVar3 < local_202c[10]);
  }
  *param_1 = iVar4;
  param_1[1] = local_202c[4];
  param_1[2] = DAT_101d0a78;
  return;
}


