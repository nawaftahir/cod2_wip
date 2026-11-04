// 100188e0 size=505 FUN_100188e0

/* WARNING: Function: __chkstk replaced with injection: alloca_probe */

undefined4
FUN_100188e0(undefined4 *param_1,undefined4 param_2,undefined4 param_3,undefined4 *param_4)

{
  char cVar1;
  int iVar2;
  int iVar3;
  char *pcVar4;
  undefined4 *puVar5;
  undefined4 uVar6;
  int local_2034;
  int local_2030;
  int local_202c;
  undefined4 local_2028 [4];
  undefined4 local_2018 [10];
  undefined4 local_1ff0 [2041];
  undefined4 uStack_c;
  
  uStack_c = 0x100188f0;
  iVar2 = FUN_1005faf0(param_2,1);
  if ((iVar2 != 0) && (iVar2 = FUN_1005faf0(&DAT_10195818,1), iVar2 != 0)) {
    puVar5 = local_2028;
    for (iVar2 = 0x808; iVar2 != 0; iVar2 = iVar2 + -1) {
      *puVar5 = 0;
      puVar5 = puVar5 + 1;
    }
    iVar2 = 0;
    local_202c = 0;
    local_2034 = 0;
    local_2030 = 0;
    do {
      iVar3 = DAT_101aac70 * 0x45c;
      if ((&DAT_101a6ab4)[iVar3] != '\0') {
        (&DAT_101a6ab4)[iVar3] = 0;
        *param_1 = *(undefined4 *)(&DAT_101a6ac8 + iVar3);
        *(undefined4 *)(&DAT_101a6ab0 + iVar3) = *(undefined4 *)(&DAT_101a6ac4 + iVar3);
      }
      pcVar4 = (char *)FUN_1005f690(param_1);
      if (*pcVar4 == '}') {
        if (local_2034 == 0) {
          FUN_1005f360("no entries for state %s: you may want to do \'default: passthrough;\'\n",
                       param_2);
          return 0;
        }
        if (local_202c != local_2034) {
          FUN_1005f360("missing value for state %s\n",param_2);
          return 0;
        }
        uVar6 = FUN_10018890(local_2028);
        *param_4 = uVar6;
        return 1;
      }
      iVar3 = FUN_100185b0(param_1,(int)local_2028 + local_2030);
      if (iVar3 == 0) {
        local_2034 = local_2034 + 1;
        local_2030 = local_2030 + 0x20;
      }
      else {
        if (iVar3 == 2) {
          return 0;
        }
        if (local_202c == local_2034) {
          FUN_1005f360("missing rule condition for state %s\n",param_2);
          return 0;
        }
        cVar1 = FUN_10018710(param_1,param_3,(int)local_2028 + iVar2);
        if (cVar1 == '\0') {
          return 0;
        }
        if (local_202c + 1 < local_2034) {
          puVar5 = (undefined4 *)((int)local_1ff0 + iVar2);
          iVar3 = local_2034 - (local_202c + 1);
          do {
            puVar5[-2] = *(undefined4 *)((int)local_2018 + iVar2);
            puVar5[-1] = *(undefined4 *)((int)local_2018 + iVar2 + 4);
            *puVar5 = *(undefined4 *)((int)local_2018 + iVar2 + 8);
            puVar5[1] = *(undefined4 *)((int)local_2018 + iVar2 + 0xc);
            puVar5 = puVar5 + 8;
            iVar3 = iVar3 + -1;
          } while (iVar3 != 0);
        }
        local_202c = local_2034;
        iVar2 = local_2030;
      }
    } while (local_2030 < 0x2001);
    FUN_1005f360("state %s has more than %i rules\n",param_2,0x100);
  }
  return 0;
}


