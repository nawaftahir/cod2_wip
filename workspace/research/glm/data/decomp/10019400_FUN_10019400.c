// 10019400 size=123 FUN_10019400

uint FUN_10019400(undefined4 param_1,int param_2,byte *param_3)

{
  byte bVar1;
  int *in_ECX;
  byte *pbVar2;
  int iVar3;
  uint uVar4;
  byte *pbVar5;
  bool bVar6;
  
  uVar4 = 0;
  if (*(uint *)(param_2 + 0xc) != 0) {
    do {
      pbVar2 = (byte *)(*in_ECX + param_2);
      pbVar5 = param_3;
      do {
        bVar1 = *pbVar2;
        bVar6 = bVar1 < *pbVar5;
        if (bVar1 != *pbVar5) {
LAB_10019444:
          iVar3 = (1 - (uint)bVar6) - (uint)(bVar6 != 0);
          goto LAB_10019449;
        }
        if (bVar1 == 0) break;
        bVar1 = pbVar2[1];
        bVar6 = bVar1 < pbVar5[1];
        if (bVar1 != pbVar5[1]) goto LAB_10019444;
        pbVar2 = pbVar2 + 2;
        pbVar5 = pbVar5 + 2;
      } while (bVar1 != 0);
      iVar3 = 0;
LAB_10019449:
      if (iVar3 == 0) {
        return uVar4;
      }
      uVar4 = uVar4 + 1;
      in_ECX = in_ECX + 5;
    } while (uVar4 < *(uint *)(param_2 + 0xc));
  }
  _printf("*WARNING*: constant \'%s\' is not used by shader \'%s\'\n",param_3,param_1);
  return 0xffffffff;
}


