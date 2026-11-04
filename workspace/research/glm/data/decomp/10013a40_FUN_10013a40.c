// 10013a40 size=1003 FUN_10013a40

void FUN_10013a40(undefined4 *param_1,undefined4 *param_2,undefined4 *param_3,code *param_4)

{
  undefined4 *puVar1;
  undefined4 uVar2;
  undefined4 uVar3;
  undefined4 uVar4;
  undefined4 uVar5;
  char cVar6;
  undefined4 *puVar7;
  undefined4 *puVar8;
  undefined4 *puVar9;
  undefined4 *puVar10;
  undefined4 *puVar11;
  undefined4 *puStack_74;
  
  puVar7 = param_2 + (((int)param_3 - (int)param_2 >> 4) - ((int)param_3 - (int)param_2 >> 0x1f) >>
                     1) * 4;
  FUN_10013f30(puVar7,param_3 + -4,param_4);
  puVar1 = puVar7;
  while (puStack_74 = puVar1, param_2 < puStack_74) {
    puVar1 = puStack_74 + -4;
    cVar6 = (*param_4)(puVar1,puStack_74);
    if ((cVar6 != '\0') || (cVar6 = (*param_4)(puStack_74,puVar1), cVar6 != '\0')) break;
  }
  do {
    puVar7 = puVar7 + 4;
    puVar1 = puVar7;
    puVar10 = puStack_74;
    if (param_3 <= puVar7) break;
    cVar6 = (*param_4)(puVar7,puStack_74);
    if ((cVar6 != '\0') || (cVar6 = (*param_4)(puStack_74,puVar7), cVar6 != '\0')) break;
  } while( true );
joined_r0x10013ae7:
  puVar9 = puStack_74;
  if (param_3 <= puVar1) {
joined_r0x10013b7c:
    for (; param_2 < puStack_74; puStack_74 = puStack_74 + -4) {
      puVar8 = puVar9 + -4;
      cVar6 = (*param_4)(puVar8,puVar10);
      puVar11 = puVar10;
      if (cVar6 == '\0') {
        cVar6 = (*param_4)(puVar10,puVar8);
        if (cVar6 != '\0') break;
        puVar11 = puVar10 + -4;
        uVar2 = *puVar11;
        uVar3 = puVar10[-3];
        uVar4 = puVar10[-2];
        uVar5 = puVar10[-1];
        *puVar11 = *puVar8;
        puVar10[-3] = puVar9[-3];
        puVar10[-2] = puVar9[-2];
        puVar10[-1] = puVar9[-1];
        *puVar8 = uVar2;
        puVar9[-3] = uVar3;
        puVar9[-2] = uVar4;
        puVar9[-1] = uVar5;
      }
      puVar10 = puVar11;
      puVar9 = puVar8;
    }
    if (puStack_74 == param_2) {
      if (puVar1 == param_3) {
        *param_1 = puVar10;
        param_1[1] = puVar7;
        return;
      }
      if (puVar7 != puVar1) {
        uVar2 = *puVar10;
        uVar3 = puVar10[1];
        uVar4 = puVar10[2];
        uVar5 = puVar10[3];
        *puVar10 = *puVar7;
        puVar10[1] = puVar7[1];
        puVar10[2] = puVar7[2];
        puVar10[3] = puVar7[3];
        *puVar7 = uVar2;
        puVar7[1] = uVar3;
        puVar7[2] = uVar4;
        puVar7[3] = uVar5;
      }
      uVar2 = *puVar10;
      uVar3 = puVar10[1];
      uVar4 = puVar10[2];
      uVar5 = puVar10[3];
      *puVar10 = *puVar1;
      puVar10[1] = puVar1[1];
      puVar10[2] = puVar1[2];
      puVar10[3] = puVar1[3];
      *puVar1 = uVar2;
      puVar1[1] = uVar3;
      puVar1[2] = uVar4;
      puVar1[3] = uVar5;
      puVar7 = puVar7 + 4;
      puVar1 = puVar1 + 4;
      puVar10 = puVar10 + 4;
    }
    else {
      puVar9 = puStack_74 + -4;
      if (puVar1 == param_3) {
        puVar11 = puVar10 + -4;
        if (puVar9 != puVar11) {
          uVar2 = *puVar9;
          uVar3 = puStack_74[-3];
          uVar4 = puStack_74[-2];
          uVar5 = puStack_74[-1];
          *puVar9 = *puVar11;
          puStack_74[-3] = puVar10[-3];
          puStack_74[-2] = puVar10[-2];
          puStack_74[-1] = puVar10[-1];
          *puVar11 = uVar2;
          puVar10[-3] = uVar3;
          puVar10[-2] = uVar4;
          puVar10[-1] = uVar5;
        }
        uVar2 = *puVar11;
        uVar3 = puVar10[-3];
        uVar4 = puVar10[-2];
        uVar5 = puVar10[-1];
        puVar8 = puVar7 + -4;
        *puVar11 = *puVar8;
        puVar10[-3] = puVar7[-3];
        puVar10[-2] = puVar7[-2];
        puVar10[-1] = puVar7[-1];
        *puVar8 = uVar2;
        puVar7[-3] = uVar3;
        puVar7[-2] = uVar4;
        puVar7[-1] = uVar5;
        puVar7 = puVar8;
        puStack_74 = puVar9;
        puVar10 = puVar11;
      }
      else {
        uVar2 = *puVar1;
        uVar3 = puVar1[1];
        uVar4 = puVar1[2];
        uVar5 = puVar1[3];
        *puVar1 = *puVar9;
        puVar1[1] = puStack_74[-3];
        puVar1[2] = puStack_74[-2];
        puVar1[3] = puStack_74[-1];
        *puVar9 = uVar2;
        puStack_74[-3] = uVar3;
        puStack_74[-2] = uVar4;
        puStack_74[-1] = uVar5;
        puVar1 = puVar1 + 4;
        puStack_74 = puVar9;
      }
    }
    goto joined_r0x10013ae7;
  }
  cVar6 = (*param_4)(puVar10,puVar1);
  if (cVar6 == '\0') {
    cVar6 = (*param_4)(puVar1,puVar10);
    if (cVar6 != '\0') goto joined_r0x10013b7c;
    uVar2 = *puVar7;
    uVar3 = puVar7[1];
    uVar4 = puVar7[2];
    uVar5 = puVar7[3];
    *puVar7 = *puVar1;
    puVar7[1] = puVar1[1];
    puVar7[2] = puVar1[2];
    puVar7[3] = puVar1[3];
    *puVar1 = uVar2;
    puVar1[1] = uVar3;
    puVar1[2] = uVar4;
    puVar7 = puVar7 + 4;
    puVar1[3] = uVar5;
  }
  puVar1 = puVar1 + 4;
  goto joined_r0x10013ae7;
}


