// 100479a0 size=312 FUN_100479a0

void FUN_100479a0(uint param_1)

{
  undefined4 *puVar1;
  char cVar2;
  char cVar3;
  int in_EAX;
  int iVar4;
  uint uVar5;
  int unaff_ESI;
  uint uVar6;
  uint uStack_4;
  
  iVar4 = *(int *)(unaff_ESI + 0x1c);
  if (in_EAX == 0) {
    *(undefined4 *)(**(int **)(unaff_ESI + 0x20) + 0x14) = 0x28;
    (**(code **)**(undefined4 **)(unaff_ESI + 0x20))(*(undefined4 **)(unaff_ESI + 0x20));
  }
  if (*(char *)(unaff_ESI + 0xc) == '\0') {
    uVar5 = iVar4 + in_EAX;
    uVar6 = ((1 << ((byte)in_EAX & 0x1f)) - 1U & param_1) << (0x18U - (char)uVar5 & 0x1f) |
            *(uint *)(unaff_ESI + 0x18);
    if (7 < (int)uVar5) {
      uStack_4 = uVar5 >> 3;
      uVar5 = uVar5 + uStack_4 * -8;
      do {
        cVar3 = (char)(uVar6 >> 0x10);
        **(char **)(unaff_ESI + 0x10) = cVar3;
        iVar4 = *(int *)(unaff_ESI + 0x14) + -1;
        *(int *)(unaff_ESI + 0x10) = *(int *)(unaff_ESI + 0x10) + 1;
        *(int *)(unaff_ESI + 0x14) = iVar4;
        if (iVar4 == 0) {
          puVar1 = *(undefined4 **)(*(int *)(unaff_ESI + 0x20) + 0x20);
          cVar2 = (*(code *)puVar1[3])(*(int *)(unaff_ESI + 0x20));
          if (cVar2 == '\0') {
            *(undefined4 *)(**(int **)(unaff_ESI + 0x20) + 0x14) = 0x18;
            (**(code **)**(undefined4 **)(unaff_ESI + 0x20))(*(undefined4 **)(unaff_ESI + 0x20));
          }
          *(undefined4 *)(unaff_ESI + 0x10) = *puVar1;
          *(undefined4 *)(unaff_ESI + 0x14) = puVar1[1];
        }
        if (cVar3 == -1) {
          **(undefined1 **)(unaff_ESI + 0x10) = 0;
          iVar4 = *(int *)(unaff_ESI + 0x14) + -1;
          *(int *)(unaff_ESI + 0x10) = *(int *)(unaff_ESI + 0x10) + 1;
          *(int *)(unaff_ESI + 0x14) = iVar4;
          if (iVar4 == 0) {
            puVar1 = *(undefined4 **)(*(int *)(unaff_ESI + 0x20) + 0x20);
            cVar3 = (*(code *)puVar1[3])(*(int *)(unaff_ESI + 0x20));
            if (cVar3 == '\0') {
              *(undefined4 *)(**(int **)(unaff_ESI + 0x20) + 0x14) = 0x18;
              (**(code **)**(undefined4 **)(unaff_ESI + 0x20))(*(undefined4 **)(unaff_ESI + 0x20));
            }
            *(undefined4 *)(unaff_ESI + 0x10) = *puVar1;
            *(undefined4 *)(unaff_ESI + 0x14) = puVar1[1];
          }
        }
        uVar6 = uVar6 << 8;
        uStack_4 = uStack_4 - 1;
      } while (uStack_4 != 0);
    }
    *(uint *)(unaff_ESI + 0x18) = uVar6;
    *(uint *)(unaff_ESI + 0x1c) = uVar5;
  }
  return;
}


