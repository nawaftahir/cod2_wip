// 100198c0 size=170 FUN_100198c0

undefined4 FUN_100198c0(void)

{
  undefined4 *in_EAX;
  int iVar1;
  char *in_EDX;
  char *pcVar2;
  char *pcVar3;
  bool bVar4;
  
  *in_EAX = 0;
  in_EAX[1] = 0;
  in_EAX[2] = 0;
  iVar1 = 7;
  bVar4 = true;
  in_EAX[3] = 0x3f800000;
  pcVar2 = in_EDX;
  pcVar3 = "float1";
  do {
    if (iVar1 == 0) break;
    iVar1 = iVar1 + -1;
    bVar4 = *pcVar2 == *pcVar3;
    pcVar2 = pcVar2 + 1;
    pcVar3 = pcVar3 + 1;
  } while (bVar4);
  if (bVar4) {
    FUN_100197a0();
    return 1;
  }
  iVar1 = 7;
  bVar4 = true;
  pcVar2 = in_EDX;
  pcVar3 = "float2";
  do {
    if (iVar1 == 0) break;
    iVar1 = iVar1 + -1;
    bVar4 = *pcVar2 == *pcVar3;
    pcVar2 = pcVar2 + 1;
    pcVar3 = pcVar3 + 1;
  } while (bVar4);
  if (bVar4) {
    FUN_100197a0();
    return 1;
  }
  iVar1 = 7;
  bVar4 = true;
  pcVar2 = in_EDX;
  pcVar3 = "float3";
  do {
    if (iVar1 == 0) break;
    iVar1 = iVar1 + -1;
    bVar4 = *pcVar2 == *pcVar3;
    pcVar2 = pcVar2 + 1;
    pcVar3 = pcVar3 + 1;
  } while (bVar4);
  if (bVar4) {
    FUN_100197a0();
    return 1;
  }
  iVar1 = 7;
  bVar4 = true;
  pcVar2 = "float4";
  do {
    if (iVar1 == 0) break;
    iVar1 = iVar1 + -1;
    bVar4 = *in_EDX == *pcVar2;
    in_EDX = in_EDX + 1;
    pcVar2 = pcVar2 + 1;
  } while (bVar4);
  if (bVar4) {
    FUN_100197a0();
    return 1;
  }
  return 0;
}


