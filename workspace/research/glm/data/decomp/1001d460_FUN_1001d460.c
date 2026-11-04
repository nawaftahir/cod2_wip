// 1001d460 size=129 FUN_1001d460

void FUN_1001d460(int param_1,int param_2,undefined4 param_3,undefined4 param_4,undefined4 param_5,
                 code *param_6)

{
  undefined4 *puVar1;
  undefined4 *puVar2;
  char cVar3;
  int in_EAX;
  int iVar4;
  
  while (param_2 < in_EAX) {
    iVar4 = (in_EAX + -1) / 2;
    puVar1 = (undefined4 *)(param_1 + iVar4 * 0xc);
    cVar3 = (*param_6)(puVar1,&param_3);
    if (cVar3 == '\0') break;
    puVar2 = (undefined4 *)(param_1 + in_EAX * 0xc);
    *puVar2 = *puVar1;
    puVar2[1] = puVar1[1];
    puVar2[2] = puVar1[2];
    in_EAX = iVar4;
  }
  puVar1 = (undefined4 *)(param_1 + in_EAX * 0xc);
  *puVar1 = param_3;
  puVar1[1] = param_4;
  puVar1[2] = param_5;
  return;
}


