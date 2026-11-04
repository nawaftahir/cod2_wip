// 100ff48e size=197 __Strftime_mt

/* Library Function - Single Match
    __Strftime_mt
   
   Library: Visual Studio 2003 Release */

int __Strftime_mt(int param_1,byte *param_2,uint param_3,byte *param_4,undefined4 param_5,
                 uint param_6)

{
  byte bVar1;
  int iVar2;
  int iVar3;
  byte *pbVar4;
  bool bVar5;
  
  iVar2 = param_6;
  if (param_6 == 0) {
    iVar2 = *(int *)(param_1 + 0x4c);
  }
  if (param_3 != 0) {
    param_6 = param_3;
    if (param_3 == 0) {
LAB_100ff53d:
      bVar5 = param_6 == 0;
    }
    else {
      do {
        bVar1 = *param_4;
        if (bVar1 == 0) break;
        if (bVar1 == 0x25) {
          pbVar4 = param_4 + 1;
          bVar1 = *pbVar4;
          if (bVar1 == 0x23) {
            pbVar4 = param_4 + 2;
          }
          iVar3 = __expandtime(param_1,param_5,iVar2,bVar1 == 0x23);
          if (iVar3 == 0) goto LAB_100ff53d;
        }
        else {
          if (((*(byte *)(*(int *)(param_1 + 0x48) + 1 + (uint)bVar1 * 2) & 0x80) != 0) &&
             (1 < param_6)) {
            param_4 = param_4 + 1;
            if (*param_4 == 0) goto LAB_100ff53d;
            *param_2 = bVar1;
            param_2 = param_2 + 1;
            param_6 = param_6 - 1;
          }
          *param_2 = *param_4;
          param_2 = param_2 + 1;
          param_6 = param_6 - 1;
          pbVar4 = param_4;
        }
        param_4 = pbVar4 + 1;
      } while (param_6 != 0);
      bVar5 = true;
      if (param_6 != 0) {
        *param_2 = 0;
        return param_3 - param_6;
      }
    }
    if (bVar5) {
      param_2 = param_2 + -1;
    }
    *param_2 = 0;
  }
  return 0;
}


