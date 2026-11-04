// 1008585f size=607 FUN_1008585f

undefined4 FUN_1008585f(uint param_1,uint param_2,uint param_3,int param_4)

{
  uint uVar1;
  uint uVar2;
  undefined4 uVar3;
  uint *in_ECX;
  int iVar4;
  uint uVar5;
  undefined4 *puVar6;
  bool bVar7;
  
  uVar2 = param_1 & 0xfffff;
  *in_ECX = param_1;
  in_ECX[1] = param_2;
  in_ECX[3] = param_3;
  if (param_4 == 0) {
    uVar5 = param_1 & 0xf0000000;
    if (uVar5 == 0) {
      param_2 = 0;
      param_3 = 0;
      goto LAB_10085a01;
    }
    uVar1 = uVar2;
    if (uVar5 == 0x10000000) {
LAB_100859d7:
      param_2 = uVar1;
      param_3 = uVar2;
    }
    else {
      if (uVar5 == 0x20000000) {
        uVar1 = uVar2 * 2;
        goto LAB_100859d7;
      }
      if (uVar5 == 0x30000000) {
        uVar1 = uVar2 * 3;
        goto LAB_100859d7;
      }
      if (uVar5 == 0x40000000) {
        uVar1 = uVar2 << 2;
        goto LAB_100859d7;
      }
      if (uVar5 == 0x50000000) {
        param_1 = param_1 & 0xfff00000;
        if (param_1 != 0x50000000) {
          if (param_1 != 0x50100000) {
            if (param_1 == 0x50200000) goto LAB_100859e7;
            if (param_1 != 0x50300000) goto LAB_10085a01;
          }
          goto LAB_100859d7;
        }
        param_2 = uVar2 * 2;
        uVar2 = param_2;
        if (param_3 == 0xffffffff) {
LAB_100859e7:
          param_2 = uVar2;
          param_3 = 1;
        }
      }
      else if (uVar5 == 0x60000000) {
        param_1 = param_1 & 0xfff00000;
        if (param_1 < 0x60a00001) {
          if (param_1 != 0x60a00000) {
            if (param_1 < 0x60500001) {
              if ((param_1 == 0x60500000) || (param_1 == 0x60000000)) {
                param_2 = 4;
                param_3 = param_2;
                goto LAB_10085a01;
              }
              if (((param_1 != 0x60100000) && (param_1 != 0x60200000)) && (param_1 != 0x60300000)) {
                bVar7 = param_1 == 0x60400000;
                goto LAB_10085921;
              }
            }
            else if (((param_1 != 0x60600000) && (param_1 != 0x60700000)) && (param_1 != 0x60800000)
                    ) {
              bVar7 = param_1 == 0x60900000;
LAB_10085921:
              if (!bVar7) goto LAB_10085a01;
            }
            goto LAB_10085927;
          }
LAB_10085955:
          param_2 = 6;
        }
        else {
          if (param_1 < 0x60f00001) {
            if (param_1 == 0x60f00000) goto LAB_10085955;
            if (param_1 == 0x60b00000) goto LAB_100859a7;
            if ((param_1 != 0x60c00000) && (param_1 != 0x60d00000)) {
              bVar7 = param_1 == 0x60e00000;
              goto LAB_10085921;
            }
          }
          else {
            if (param_1 == 0x61000000) {
LAB_100859a7:
              param_2 = 0xc;
              goto LAB_100859a9;
            }
            if ((param_1 != 0x61100000) && (param_1 != 0x61200000)) {
              bVar7 = param_1 == 0x61300000;
              goto LAB_10085921;
            }
          }
LAB_10085927:
          param_2 = 8;
        }
LAB_100859a9:
        param_3 = 4;
      }
    }
LAB_10085a01:
    if (in_ECX[1] == 0xffffffff) {
      in_ECX[1] = param_2;
    }
    if (in_ECX[3] == 0xffffffff) {
      in_ECX[3] = param_3;
    }
    if ((((in_ECX[1] != param_2) || (in_ECX[3] != param_3)) || (in_ECX[1] == 0xffffffff)) ||
       (in_ECX[3] == 0xffffffff)) {
      return 0x80004005;
    }
  }
  if (in_ECX[1] < 9) {
    in_ECX[2] = (uint)(in_ECX + 0x10);
LAB_10085a50:
    if (in_ECX[3] < 5) {
      in_ECX[4] = (uint)(in_ECX + 0x18);
    }
    else {
      uVar2 = FUN_100857f7(in_ECX[3]);
      in_ECX[4] = uVar2;
      if (uVar2 == 0) goto LAB_10085ab7;
    }
    puVar6 = (undefined4 *)in_ECX[2];
    for (uVar2 = in_ECX[1] & 0x3fffffff; uVar2 != 0; uVar2 = uVar2 - 1) {
      *puVar6 = 0xffffffff;
      puVar6 = puVar6 + 1;
    }
    for (iVar4 = 0; iVar4 != 0; iVar4 = iVar4 + -1) {
      *(undefined1 *)puVar6 = 0xff;
      puVar6 = (undefined4 *)((int)puVar6 + 1);
    }
    puVar6 = (undefined4 *)in_ECX[4];
    for (uVar2 = in_ECX[3] & 0x3fffffff; uVar2 != 0; uVar2 = uVar2 - 1) {
      *puVar6 = 0xffffffff;
      puVar6 = puVar6 + 1;
    }
    for (iVar4 = 0; iVar4 != 0; iVar4 = iVar4 + -1) {
      *(undefined1 *)puVar6 = 0xff;
      puVar6 = (undefined4 *)((int)puVar6 + 1);
    }
    in_ECX[9] = 0;
    in_ECX[10] = 0;
    in_ECX[0xb] = 0;
    in_ECX[0xe] = 0;
    in_ECX[0xf] = 0;
    uVar3 = 0;
  }
  else {
    uVar2 = FUN_100857f7(in_ECX[1]);
    in_ECX[2] = uVar2;
    if (uVar2 != 0) goto LAB_10085a50;
LAB_10085ab7:
    uVar3 = 0x8007000e;
  }
  return uVar3;
}


