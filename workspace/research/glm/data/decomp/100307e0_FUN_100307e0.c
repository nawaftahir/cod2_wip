// 100307e0 size=91 FUN_100307e0

void FUN_100307e0(void)

{
  undefined2 uVar1;
  int iVar2;
  undefined2 *in_EAX;
  int iVar3;
  int iVar4;
  undefined2 local_600 [256];
  undefined2 local_400 [256];
  undefined2 local_200 [256];
  
  iVar2 = -(int)in_EAX;
  iVar3 = (int)local_200 - (int)in_EAX;
  iVar4 = 0x100;
  do {
    uVar1 = *in_EAX;
    *(undefined2 *)((int)local_600 + iVar2 + (int)in_EAX) = uVar1;
    *(undefined2 *)((int)local_400 + iVar2 + (int)in_EAX) = uVar1;
    *(undefined2 *)(iVar3 + (int)in_EAX) = uVar1;
    in_EAX = in_EAX + 1;
    iVar4 = iVar4 + -1;
  } while (iVar4 != 0);
  (**(code **)(*DAT_101d1bf8 + 0x54))(DAT_101d1bf8,DAT_101d4934,0,local_600);
  return;
}


