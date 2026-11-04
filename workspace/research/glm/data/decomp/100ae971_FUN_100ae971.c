// 100ae971 size=353 FUN_100ae971

undefined4
FUN_100ae971(undefined4 param_1,undefined4 param_2,uint *param_3,uint *param_4,int *param_5,
            undefined4 *param_6,int param_7,uint param_8)

{
  bool bVar1;
  uint *puVar2;
  undefined4 uVar3;
  uint uVar4;
  int *piVar5;
  uint *puVar6;
  int iVar7;
  int in_ECX;
  uint uVar8;
  uint uVar9;
  int iVar10;
  
  puVar2 = param_3;
  uVar9 = *param_3 & 0xfffff;
  *param_6 = 0;
  *param_5 = 0;
  *param_4 = 0;
  if (uVar9 == 0) {
    uVar3 = 0x80004005;
  }
  else {
    uVar4 = param_3[1] / uVar9;
    if ((param_8 == 0) && (param_8 = 0, uVar4 != 0)) {
      param_3 = (uint *)0x0;
      do {
        uVar8 = 0;
        if (uVar9 != 0) {
          piVar5 = (int *)(puVar2[2] + (int)param_3);
          do {
            if (*(uint *)(*(int *)(*(int *)(in_ECX + 0x14) + *piVar5 * 4) + 0x10) != uVar8) {
              return 1;
            }
            uVar8 = uVar8 + 1;
            piVar5 = piVar5 + 1;
          } while (uVar8 < uVar9);
        }
        param_8 = param_8 + 1;
        param_3 = (uint *)((int)param_3 + uVar9 * 4);
      } while (param_8 < uVar4);
    }
    iVar10 = 0;
    bVar1 = false;
    param_3 = (uint *)0x0;
    if (uVar4 != 0) {
      do {
        puVar6 = (uint *)FUN_100ae879(param_1,param_2,puVar2[2] + iVar10 * 4,uVar9,param_7);
        if (puVar6 != (uint *)0x0) {
          uVar8 = *puVar6 & 0xfff00000;
          if (param_7 == 0) {
            if (uVar8 == 0x72100000) goto LAB_100aea60;
          }
          else if ((((uVar8 == 0x60000000) || (uVar8 == 0x60500000)) || (uVar8 == 0x60a00000)) ||
                  (uVar8 == 0x60f00000)) {
LAB_100aea60:
            if (bVar1) {
              *param_5 = 0;
              *param_4 = 0;
              *param_6 = 0;
              return 1;
            }
            *param_6 = puVar6;
            bVar1 = true;
            *param_5 = iVar10;
            if (param_7 == 0) {
              iVar7 = *(int *)puVar6[2];
            }
            else {
              iVar7 = *(int *)(puVar6[2] + (*puVar6 & 0xfffff) * 4);
            }
            *param_4 = (uint)*(byte *)(*(int *)(*(int *)(in_ECX + 0x14) + iVar7 * 4) + 0x6d);
          }
        }
        param_3 = (uint *)((int)param_3 + 1);
        iVar10 = iVar10 + uVar9;
      } while (param_3 < uVar4);
    }
    uVar3 = 0;
  }
  return uVar3;
}


