// 10028890 size=105 FUN_10028890

void FUN_10028890(int param_1,int param_2,undefined4 param_3,undefined4 param_4,code *param_5)

{
  undefined4 *puVar1;
  char cVar2;
  int in_EAX;
  int iVar3;
  
  while (param_2 < in_EAX) {
    iVar3 = (in_EAX + -1) / 2;
    puVar1 = (undefined4 *)(param_1 + iVar3 * 8);
    cVar2 = (*param_5)(puVar1,&param_3);
    if (cVar2 == '\0') break;
    *(undefined4 *)(param_1 + in_EAX * 8) = *puVar1;
    *(undefined4 *)(param_1 + 4 + in_EAX * 8) = puVar1[1];
    in_EAX = iVar3;
  }
  *(undefined4 *)(param_1 + in_EAX * 8) = param_3;
  *(undefined4 *)(param_1 + 4 + in_EAX * 8) = param_4;
  return;
}


