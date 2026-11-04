// 10028490 size=75 FUN_10028490

void FUN_10028490(void)

{
  undefined4 uVar1;
  undefined4 uVar2;
  undefined4 *in_EAX;
  int in_ECX;
  int iVar3;
  
  for (iVar3 = in_ECX - (int)in_EAX; 1 < iVar3 >> 3; iVar3 = iVar3 + -8) {
    uVar1 = *(undefined4 *)((int)in_EAX + iVar3 + -4);
    uVar2 = *(undefined4 *)((int)in_EAX + iVar3 + -8);
    *(undefined4 *)((int)in_EAX + iVar3 + -8) = *in_EAX;
    *(undefined4 *)((int)in_EAX + iVar3 + -4) = in_EAX[1];
    FUN_100287b0(iVar3 + -8 >> 3,uVar2,uVar1);
  }
  return;
}


