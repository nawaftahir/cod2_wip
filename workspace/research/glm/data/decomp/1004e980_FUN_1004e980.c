// 1004e980 size=587 FUN_1004e980

void FUN_1004e980(void)

{
  int iVar1;
  char cVar2;
  int iVar3;
  uint in_EAX;
  int in_ECX;
  int *unaff_ESI;
  char *unaff_EDI;
  
  iVar1 = in_EAX + in_ECX;
  if ((((in_EAX < 0xe) || (*unaff_EDI != 'J')) || (unaff_EDI[1] != 'F')) ||
     (((unaff_EDI[2] != 'I' || (unaff_EDI[3] != 'F')) || (unaff_EDI[4] != '\0')))) {
    if (((5 < in_EAX) && (*unaff_EDI == 'J')) &&
       ((unaff_EDI[1] == 'F' &&
        (((unaff_EDI[2] == 'X' && (unaff_EDI[3] == 'X')) && (unaff_EDI[4] == '\0')))))) {
      cVar2 = unaff_EDI[5];
      if (cVar2 == '\x10') {
        *(undefined4 *)(*unaff_ESI + 0x14) = 0x6c;
        *(int *)(*unaff_ESI + 0x18) = iVar1;
        (**(code **)(*unaff_ESI + 4))();
        return;
      }
      if (cVar2 != '\x11') {
        if (cVar2 != '\x13') {
          *(undefined4 *)(*unaff_ESI + 0x14) = 0x59;
          *(uint *)(*unaff_ESI + 0x18) = (uint)(byte)unaff_EDI[5];
          *(int *)(*unaff_ESI + 0x1c) = iVar1;
          (**(code **)(*unaff_ESI + 4))();
          return;
        }
        *(undefined4 *)(*unaff_ESI + 0x14) = 0x6e;
        *(int *)(*unaff_ESI + 0x18) = iVar1;
        (**(code **)(*unaff_ESI + 4))();
        return;
      }
      *(undefined4 *)(*unaff_ESI + 0x14) = 0x6d;
      *(int *)(*unaff_ESI + 0x18) = iVar1;
      (**(code **)(*unaff_ESI + 4))();
      return;
    }
    *(undefined4 *)(*unaff_ESI + 0x14) = 0x4d;
    *(int *)(*unaff_ESI + 0x18) = iVar1;
    (**(code **)(*unaff_ESI + 4))();
  }
  else {
    *(undefined1 *)(unaff_ESI + 0x42) = 1;
    *(char *)((int)unaff_ESI + 0x109) = unaff_EDI[5];
    *(char *)((int)unaff_ESI + 0x10a) = unaff_EDI[6];
    *(char *)((int)unaff_ESI + 0x10b) = unaff_EDI[7];
    *(ushort *)(unaff_ESI + 0x43) = (ushort)(byte)unaff_EDI[8] * 0x100 + (ushort)(byte)unaff_EDI[9];
    *(ushort *)((int)unaff_ESI + 0x10e) =
         (ushort)(byte)unaff_EDI[10] * 0x100 + (ushort)(byte)unaff_EDI[0xb];
    if (*(char *)((int)unaff_ESI + 0x109) != '\x01') {
      *(undefined4 *)(*unaff_ESI + 0x14) = 0x77;
      *(uint *)(*unaff_ESI + 0x18) = (uint)*(byte *)((int)unaff_ESI + 0x109);
      *(uint *)(*unaff_ESI + 0x1c) = (uint)*(byte *)((int)unaff_ESI + 0x10a);
      (**(code **)(*unaff_ESI + 4))();
    }
    iVar3 = *unaff_ESI;
    *(uint *)(iVar3 + 0x18) = (uint)*(byte *)((int)unaff_ESI + 0x109);
    *(uint *)(iVar3 + 0x1c) = (uint)*(byte *)((int)unaff_ESI + 0x10a);
    *(uint *)(iVar3 + 0x20) = (uint)*(ushort *)(unaff_ESI + 0x43);
    *(uint *)(iVar3 + 0x24) = (uint)*(ushort *)((int)unaff_ESI + 0x10e);
    *(uint *)(iVar3 + 0x28) = (uint)*(byte *)((int)unaff_ESI + 0x10b);
    *(undefined4 *)(*unaff_ESI + 0x14) = 0x57;
    (**(code **)(*unaff_ESI + 4))();
    if (unaff_EDI[0xc] != '\0' || unaff_EDI[0xd] != '\0') {
      *(undefined4 *)(*unaff_ESI + 0x14) = 0x5a;
      *(uint *)(*unaff_ESI + 0x18) = (uint)(byte)unaff_EDI[0xc];
      *(uint *)(*unaff_ESI + 0x1c) = (uint)(byte)unaff_EDI[0xd];
      (**(code **)(*unaff_ESI + 4))();
    }
    if (iVar1 + -0xe != (uint)(byte)unaff_EDI[0xc] * (uint)(byte)unaff_EDI[0xd] * 3) {
      *(undefined4 *)(*unaff_ESI + 0x14) = 0x58;
      *(int *)(*unaff_ESI + 0x18) = iVar1 + -0xe;
      (**(code **)(*unaff_ESI + 4))();
      return;
    }
  }
  return;
}


