// 1004ebd0 size=169 FUN_1004ebd0

void FUN_1004ebd0(int param_1)

{
  char cVar1;
  char cVar2;
  byte bVar3;
  char cVar4;
  char cVar5;
  int iVar6;
  char *in_EAX;
  uint in_ECX;
  int *unaff_ESI;
  
  if ((((0xb < in_ECX) && (*in_EAX == 'A')) && (in_EAX[1] == 'd')) &&
     (((in_EAX[2] == 'o' && (in_EAX[3] == 'b')) && (in_EAX[4] == 'e')))) {
    cVar1 = in_EAX[7];
    cVar2 = in_EAX[8];
    bVar3 = in_EAX[0xb];
    cVar4 = in_EAX[9];
    cVar5 = in_EAX[10];
    iVar6 = *unaff_ESI;
    *(uint *)(iVar6 + 0x18) = (uint)CONCAT11(in_EAX[5],in_EAX[6]);
    *(uint *)(iVar6 + 0x1c) = (uint)CONCAT11(cVar1,cVar2);
    *(uint *)(iVar6 + 0x20) = (uint)CONCAT11(cVar4,cVar5);
    *(uint *)(iVar6 + 0x24) = (uint)bVar3;
    *(undefined4 *)(*unaff_ESI + 0x14) = 0x4c;
    (**(code **)(*unaff_ESI + 4))();
    *(byte *)((int)unaff_ESI + 0x111) = bVar3;
    *(undefined1 *)(unaff_ESI + 0x44) = 1;
    return;
  }
  *(undefined4 *)(*unaff_ESI + 0x14) = 0x4e;
  *(uint *)(*unaff_ESI + 0x18) = in_ECX + param_1;
  (**(code **)(*unaff_ESI + 4))();
  return;
}


