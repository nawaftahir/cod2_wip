
void FUN_00465c60(byte *param_1)

{
  byte bVar1;
  int *_Memory;
  int *in_EAX;
  byte *pbVar2;
  int iVar3;
  byte *pbVar4;
  bool bVar5;
  
  if (*in_EAX == 0) {
    return;
  }
  do {
    _Memory = (int *)*in_EAX;
    pbVar2 = (byte *)_Memory[1];
    pbVar4 = param_1;
    do {
      bVar1 = *pbVar2;
      bVar5 = bVar1 < *pbVar4;
      if (bVar1 != *pbVar4) {
LAB_00465c9c:
        iVar3 = (1 - (uint)bVar5) - (uint)(bVar5 != 0);
        goto LAB_00465ca1;
      }
      if (bVar1 == 0) break;
      bVar1 = pbVar2[1];
      bVar5 = bVar1 < pbVar4[1];
      if (bVar1 != pbVar4[1]) goto LAB_00465c9c;
      pbVar2 = pbVar2 + 2;
      pbVar4 = pbVar4 + 2;
    } while (bVar1 != 0);
    iVar3 = 0;
LAB_00465ca1:
    if (iVar3 == 0) {
      *in_EAX = *_Memory;
      _free((void *)_Memory[1]);
      _free((void *)_Memory[2]);
      _free(_Memory);
      return;
    }
    in_EAX = _Memory;
    if (*_Memory == 0) {
      return;
    }
  } while( true );
}

