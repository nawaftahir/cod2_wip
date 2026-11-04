// 100247f0 size=296 FUN_100247f0

void FUN_100247f0(void)

{
  int iVar1;
  undefined2 *puVar2;
  undefined4 uVar3;
  int iVar4;
  undefined4 uVar5;
  int iVar6;
  int in_EAX;
  int in_ECX;
  undefined4 *puVar7;
  int local_c;
  
  iVar6 = DAT_1042e778;
  if (0 < in_EAX) {
    puVar7 = (undefined4 *)(in_ECX + 8);
    local_c = in_EAX;
    do {
      uVar5 = DAT_101d1b48;
      iVar1 = DAT_10678abc + puVar7[-1] * 8;
      uVar3 = *puVar7;
      iVar4 = *(int *)(iVar6 + 0x30000);
      if ((0x2e000 - iVar4) + *(int *)(iVar6 + 0x30004) < 0x1c) {
        *(undefined4 *)(iVar6 + 0x30008) = 0;
      }
      else {
        puVar2 = (undefined2 *)(iVar4 + iVar6);
        *(undefined2 **)(iVar6 + 0x30008) = puVar2;
        *(int *)(iVar6 + 0x30000) = iVar4 + 0x1c;
        *puVar2 = 0x14;
        puVar2[1] = 0x1c;
        *(undefined4 *)(puVar2 + 8) = 0x3f800000;
        *(undefined4 *)(puVar2 + 10) = 0x3f800000;
        *(undefined4 *)(puVar2 + 2) = uVar5;
        *(undefined4 *)(puVar2 + 4) = 0;
        *(undefined4 *)(puVar2 + 6) = 0;
        *(undefined1 *)(puVar2 + 0xc) = 0xff;
        *(undefined1 *)((int)puVar2 + 0x19) = 0xff;
        *(undefined1 *)(puVar2 + 0xd) = 0xff;
        *(undefined1 *)((int)puVar2 + 0x1b) = 0xff;
      }
      FUN_10021770(0);
      iVar4 = *(int *)(iVar6 + 0x30000);
      if ((0x2e000 - iVar4) + *(int *)(iVar6 + 0x30004) < 0x14) {
        *(undefined4 *)(iVar6 + 0x30008) = 0;
      }
      else {
        puVar2 = (undefined2 *)(iVar4 + iVar6);
        *(undefined2 **)(iVar6 + 0x30008) = puVar2;
        *(int *)(iVar6 + 0x30000) = iVar4 + 0x14;
        *puVar2 = 0x17;
        puVar2[1] = 0x14;
        *(undefined4 *)(puVar2 + 2) = 0;
        *(int *)(puVar2 + 4) = iVar1;
        *(undefined4 *)(puVar2 + 6) = uVar3;
        *(undefined4 *)(puVar2 + 8) = 0x12;
      }
      puVar7 = puVar7 + 3;
      local_c = local_c + -1;
    } while (local_c != 0);
  }
  return;
}


