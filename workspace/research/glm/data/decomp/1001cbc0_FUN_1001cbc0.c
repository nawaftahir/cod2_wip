// 1001cbc0 size=831 FUN_1001cbc0

void FUN_1001cbc0(undefined4 *param_1,undefined4 *param_2,undefined4 *param_3,code *param_4)

{
  undefined4 *puVar1;
  undefined4 uVar2;
  undefined4 uVar3;
  undefined4 uVar4;
  char cVar5;
  undefined4 *puVar6;
  undefined4 *puVar7;
  undefined4 *puVar8;
  undefined4 *puVar9;
  undefined4 *puVar10;
  undefined4 *local_58;
  
  puVar6 = param_2 + (((int)param_3 - (int)param_2) / 0x18) * 3;
  FUN_1001d070(puVar6,param_3 + -3,param_4);
  puVar1 = puVar6;
  while (local_58 = puVar1, param_2 < local_58) {
    puVar1 = local_58 + -3;
    cVar5 = (*param_4)(puVar1,local_58);
    if ((cVar5 != '\0') || (cVar5 = (*param_4)(local_58,puVar1), cVar5 != '\0')) break;
  }
  do {
    puVar6 = puVar6 + 3;
    puVar1 = puVar6;
    puVar9 = local_58;
    if (param_3 <= puVar6) break;
    cVar5 = (*param_4)(puVar6,local_58);
    if ((cVar5 != '\0') || (cVar5 = (*param_4)(local_58,puVar6), cVar5 != '\0')) break;
  } while( true );
joined_r0x1001cc6a:
  puVar8 = local_58;
  if (param_3 <= puVar1) {
joined_r0x1001ccde:
    for (; param_2 < local_58; local_58 = local_58 + -3) {
      puVar7 = puVar8 + -3;
      cVar5 = (*param_4)(puVar7,puVar9);
      puVar10 = puVar9;
      if (cVar5 == '\0') {
        cVar5 = (*param_4)(puVar9,puVar7);
        if (cVar5 != '\0') break;
        puVar10 = puVar9 + -3;
        uVar2 = *puVar10;
        uVar3 = puVar9[-2];
        uVar4 = puVar9[-1];
        *puVar10 = *puVar7;
        puVar9[-2] = puVar8[-2];
        puVar9[-1] = puVar8[-1];
        *puVar7 = uVar2;
        puVar8[-2] = uVar3;
        puVar8[-1] = uVar4;
      }
      puVar9 = puVar10;
      puVar8 = puVar7;
    }
    if (local_58 == param_2) {
      if (puVar1 == param_3) {
        *param_1 = puVar9;
        param_1[1] = puVar6;
        return;
      }
      if (puVar6 != puVar1) {
        uVar2 = *puVar9;
        uVar3 = puVar9[1];
        uVar4 = puVar9[2];
        *puVar9 = *puVar6;
        puVar9[1] = puVar6[1];
        puVar9[2] = puVar6[2];
        *puVar6 = uVar2;
        puVar6[1] = uVar3;
        puVar6[2] = uVar4;
      }
      uVar2 = *puVar9;
      uVar3 = puVar9[1];
      uVar4 = puVar9[2];
      *puVar9 = *puVar1;
      puVar9[1] = puVar1[1];
      puVar9[2] = puVar1[2];
      *puVar1 = uVar2;
      puVar1[1] = uVar3;
      puVar1[2] = uVar4;
      puVar6 = puVar6 + 3;
      puVar1 = puVar1 + 3;
      puVar9 = puVar9 + 3;
    }
    else {
      puVar8 = local_58 + -3;
      if (puVar1 == param_3) {
        puVar10 = puVar9 + -3;
        if (puVar8 != puVar10) {
          uVar2 = *puVar8;
          uVar3 = local_58[-2];
          uVar4 = local_58[-1];
          *puVar8 = *puVar10;
          local_58[-2] = puVar9[-2];
          local_58[-1] = puVar9[-1];
          *puVar10 = uVar2;
          puVar9[-2] = uVar3;
          puVar9[-1] = uVar4;
        }
        uVar2 = *puVar10;
        uVar3 = puVar9[-2];
        uVar4 = puVar9[-1];
        puVar7 = puVar6 + -3;
        *puVar10 = *puVar7;
        puVar9[-2] = puVar6[-2];
        puVar9[-1] = puVar6[-1];
        *puVar7 = uVar2;
        puVar6[-2] = uVar3;
        puVar6[-1] = uVar4;
        puVar6 = puVar7;
        local_58 = puVar8;
        puVar9 = puVar10;
      }
      else {
        uVar2 = *puVar1;
        uVar3 = puVar1[1];
        uVar4 = puVar1[2];
        *puVar1 = *puVar8;
        puVar1[1] = local_58[-2];
        puVar1[2] = local_58[-1];
        *puVar8 = uVar2;
        local_58[-2] = uVar3;
        local_58[-1] = uVar4;
        puVar1 = puVar1 + 3;
        local_58 = puVar8;
      }
    }
    goto joined_r0x1001cc6a;
  }
  cVar5 = (*param_4)(puVar9,puVar1);
  if (cVar5 == '\0') {
    cVar5 = (*param_4)(puVar1,puVar9);
    if (cVar5 != '\0') goto joined_r0x1001ccde;
    uVar2 = *puVar6;
    uVar3 = puVar6[1];
    uVar4 = puVar6[2];
    *puVar6 = *puVar1;
    puVar6[1] = puVar1[1];
    puVar6[2] = puVar1[2];
    *puVar1 = uVar2;
    puVar1[1] = uVar3;
    puVar6 = puVar6 + 3;
    puVar1[2] = uVar4;
  }
  puVar1 = puVar1 + 3;
  goto joined_r0x1001cc6a;
}


