// 1000e080 size=408 FUN_1000e080

void FUN_1000e080(undefined4 *param_1,undefined4 *param_2,undefined4 *param_3,code *param_4)

{
  undefined4 uVar1;
  int iVar2;
  undefined4 *puVar3;
  undefined4 *puVar4;
  undefined4 *puVar5;
  undefined4 *puVar6;
  
  puVar3 = param_2 + (((int)param_3 - (int)param_2 >> 2) - ((int)param_3 - (int)param_2 >> 0x1f) >>
                     1);
  FUN_1000e330(param_3 + -1,param_4);
  puVar6 = puVar3;
  while (((param_2 < puVar6 && (iVar2 = (*param_4)(puVar6[-1],*puVar6), iVar2 == 0)) &&
         (iVar2 = (*param_4)(*puVar6,puVar6[-1]), iVar2 == 0))) {
    puVar6 = puVar6 + -1;
  }
  do {
    puVar3 = puVar3 + 1;
    puVar4 = puVar3;
    puVar5 = puVar6;
    if ((param_3 <= puVar3) || (iVar2 = (*param_4)(*puVar3,*puVar6), iVar2 != 0)) break;
    iVar2 = (*param_4)(*puVar6,*puVar3);
  } while (iVar2 == 0);
joined_r0x1000e114:
  do {
    if (param_3 <= puVar3) {
joined_r0x1000e154:
      for (; param_2 < puVar5; puVar5 = puVar5 + -1) {
        iVar2 = (*param_4)(puVar5[-1],*puVar6);
        if (iVar2 == 0) {
          iVar2 = (*param_4)(*puVar6,puVar5[-1]);
          if (iVar2 != 0) break;
          uVar1 = puVar6[-1];
          puVar6 = puVar6 + -1;
          *puVar6 = puVar5[-1];
          puVar5[-1] = uVar1;
        }
      }
      if (puVar5 == param_2) {
        if (puVar3 == param_3) {
          *param_1 = puVar6;
          param_1[1] = puVar4;
          return;
        }
        if (puVar4 != puVar3) {
          uVar1 = *puVar6;
          *puVar6 = *puVar4;
          *puVar4 = uVar1;
        }
        uVar1 = *puVar6;
        *puVar6 = *puVar3;
        puVar6 = puVar6 + 1;
        *puVar3 = uVar1;
        puVar3 = puVar3 + 1;
        puVar4 = puVar4 + 1;
      }
      else {
        puVar5 = puVar5 + -1;
        if (puVar3 == param_3) {
          puVar6 = puVar6 + -1;
          if (puVar5 != puVar6) {
            uVar1 = *puVar5;
            *puVar5 = *puVar6;
            *puVar6 = uVar1;
          }
          uVar1 = *puVar6;
          *puVar6 = puVar4[-1];
          puVar4[-1] = uVar1;
          puVar4 = puVar4 + -1;
        }
        else {
          uVar1 = *puVar3;
          *puVar3 = *puVar5;
          *puVar5 = uVar1;
          puVar3 = puVar3 + 1;
        }
      }
      goto joined_r0x1000e114;
    }
    iVar2 = (*param_4)(*puVar6,*puVar3);
    if (iVar2 == 0) {
      iVar2 = (*param_4)(*puVar3,*puVar6);
      if (iVar2 != 0) goto joined_r0x1000e154;
      uVar1 = *puVar4;
      *puVar4 = *puVar3;
      puVar4 = puVar4 + 1;
      *puVar3 = uVar1;
    }
    puVar3 = puVar3 + 1;
  } while( true );
}


