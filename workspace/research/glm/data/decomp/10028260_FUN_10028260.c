// 10028260 size=521 FUN_10028260

void FUN_10028260(undefined4 *param_1,undefined4 *param_2,undefined4 *param_3,code *param_4)

{
  undefined4 *puVar1;
  undefined4 uVar2;
  undefined4 uVar3;
  char cVar4;
  undefined4 *puVar5;
  undefined4 *puVar6;
  undefined4 *puVar7;
  undefined4 *puVar8;
  undefined4 *puVar9;
  undefined4 *puVar10;
  undefined4 *puStack_14;
  
  puVar7 = param_2 + (((int)param_3 - (int)param_2 >> 3) - ((int)param_3 - (int)param_2 >> 0x1f) >>
                     1) * 2;
  FUN_10028580(puVar7,param_3 + -2,param_4);
  puVar1 = puVar7;
  while (puStack_14 = puVar1, param_2 < puStack_14) {
    puVar1 = puStack_14 + -2;
    cVar4 = (*param_4)(puVar1,puStack_14);
    if ((cVar4 != '\0') || (cVar4 = (*param_4)(puStack_14,puVar1), cVar4 != '\0')) break;
  }
  do {
    puVar7 = puVar7 + 2;
    puVar1 = puVar7;
    puVar8 = puStack_14;
    puVar6 = puStack_14;
    if (param_3 <= puVar7) break;
    cVar4 = (*param_4)(puVar7,puStack_14);
    if ((cVar4 != '\0') || (cVar4 = (*param_4)(puStack_14,puVar7), cVar4 != '\0')) break;
  } while( true );
joined_r0x100282f9:
  puVar10 = puVar6;
  if (param_3 <= puVar1) {
joined_r0x1002834a:
    while (param_2 < puVar6) {
      puVar5 = puVar10 + -2;
      cVar4 = (*param_4)(puVar5,puVar8);
      puVar9 = puVar8;
      if (cVar4 == '\0') {
        cVar4 = (*param_4)(puVar8,puVar5);
        puVar6 = puStack_14;
        if (cVar4 != '\0') break;
        uVar2 = puVar8[-2];
        uVar3 = puVar8[-1];
        puVar9 = puVar8 + -2;
        *puVar9 = *puVar5;
        puVar8[-1] = puVar10[-1];
        *puVar5 = uVar2;
        puVar10[-1] = uVar3;
      }
      puVar6 = puStack_14 + -2;
      puVar10 = puVar5;
      puVar8 = puVar9;
      puStack_14 = puVar6;
    }
    if (puVar6 == param_2) {
      if (puVar1 == param_3) {
        *param_1 = puVar8;
        param_1[1] = puVar7;
        return;
      }
      if (puVar7 != puVar1) {
        uVar2 = *puVar8;
        uVar3 = puVar8[1];
        *puVar8 = *puVar7;
        puVar8[1] = puVar7[1];
        *puVar7 = uVar2;
        puVar7[1] = uVar3;
      }
      uVar2 = *puVar8;
      uVar3 = puVar8[1];
      *puVar8 = *puVar1;
      puVar8[1] = puVar1[1];
      *puVar1 = uVar2;
      puVar1[1] = uVar3;
      puVar7 = puVar7 + 2;
      puVar1 = puVar1 + 2;
      puVar8 = puVar8 + 2;
    }
    else {
      puStack_14 = puVar6 + -2;
      if (puVar1 == param_3) {
        puVar10 = puVar8 + -2;
        if (puStack_14 != puVar10) {
          uVar2 = *puStack_14;
          uVar3 = puVar6[-1];
          *puStack_14 = *puVar10;
          puVar6[-1] = puVar8[-1];
          *puVar10 = uVar2;
          puVar8[-1] = uVar3;
        }
        uVar2 = *puVar10;
        uVar3 = puVar8[-1];
        *puVar10 = puVar7[-2];
        puVar8[-1] = puVar7[-1];
        puVar7[-2] = uVar2;
        puVar7[-1] = uVar3;
        puVar7 = puVar7 + -2;
        puVar8 = puVar10;
        puVar6 = puStack_14;
      }
      else {
        uVar2 = *puVar1;
        uVar3 = puVar1[1];
        *puVar1 = *puStack_14;
        puVar1[1] = puVar6[-1];
        *puStack_14 = uVar2;
        puVar6[-1] = uVar3;
        puVar1 = puVar1 + 2;
        puVar6 = puStack_14;
      }
    }
    goto joined_r0x100282f9;
  }
  cVar4 = (*param_4)(puVar8,puVar1);
  if (cVar4 == '\0') {
    cVar4 = (*param_4)(puVar1,puVar8);
    if (cVar4 != '\0') goto joined_r0x1002834a;
    uVar2 = puVar7[1];
    uVar3 = *puVar7;
    *puVar7 = *puVar1;
    puVar7[1] = puVar1[1];
    puVar7 = puVar7 + 2;
    *puVar1 = uVar3;
    puVar1[1] = uVar2;
  }
  puVar1 = puVar1 + 2;
  goto joined_r0x100282f9;
}


