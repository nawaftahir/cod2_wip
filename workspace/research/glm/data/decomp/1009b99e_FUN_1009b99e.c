// 1009b99e size=817 FUN_1009b99e

void FUN_1009b99e(undefined4 param_1,int param_2,undefined1 *param_3,undefined1 *param_4,int param_5
                 )

{
  int iVar1;
  int iVar2;
  undefined4 in_ECX;
  uint uVar3;
  undefined1 *puVar4;
  uint uVar5;
  undefined1 *puVar6;
  char *pcVar7;
  bool bVar8;
  undefined1 local_250 [256];
  undefined1 local_150 [256];
  undefined1 local_50 [16];
  undefined4 local_40;
  undefined4 local_38;
  undefined4 local_34;
  undefined1 local_2c [16];
  undefined4 local_1c;
  undefined4 local_14;
  undefined4 local_10;
  undefined4 local_8;
  
  local_8 = in_ECX;
  if ((param_5 != 0) || (param_3 == (undefined1 *)0x0)) goto LAB_1009bca5;
  if (param_4 != (undefined1 *)0x0) {
    FUN_10082e0f();
    FUN_10082e0f();
    puVar4 = param_3;
    if (*(int *)(param_3 + 4) != 9) {
      puVar4 = local_2c;
      local_1c = 4;
      local_14 = 1;
      local_10 = FUN_10099b4f(param_3);
      iVar2 = FUN_10099ad8(param_3);
      if (iVar2 != 0) {
        local_1c = 1;
      }
    }
    puVar6 = param_4;
    if (*(int *)(param_4 + 4) != 9) {
      puVar6 = local_50;
      local_40 = 4;
      local_38 = 1;
      local_34 = FUN_10099b4f(param_4);
      iVar2 = FUN_10099ad8(param_4);
      if (iVar2 != 0) {
        local_40 = 1;
      }
    }
    iVar2 = *(int *)(puVar4 + 0x10);
    if ((iVar2 == 4) || (iVar1 = *(int *)(puVar6 + 0x10), iVar1 == 4)) {
      uVar3 = *(int *)(puVar4 + 0x1c) * *(int *)(puVar4 + 0x18);
      if (uVar3 < (uint)(*(int *)(puVar6 + 0x1c) * *(int *)(puVar6 + 0x18)) ||
          uVar3 - *(int *)(puVar6 + 0x1c) * *(int *)(puVar6 + 0x18) == 0) {
        uVar5 = 0;
        if (uVar3 != 0) {
          do {
            iVar2 = FUN_10099f62(param_3,uVar5,local_2c);
            if (((iVar2 < 0) || (iVar2 = FUN_10099f62(param_4,uVar5,local_50), iVar2 < 0)) ||
               (iVar2 = FUN_1009b666(local_2c,local_50,1), iVar2 == 0)) goto LAB_1009ba8f;
            uVar5 = uVar5 + 1;
          } while (uVar5 < uVar3);
        }
        goto LAB_1009bca5;
      }
    }
    else {
      if (iVar2 != 0) {
        if (iVar2 == 1) {
          if (iVar1 != 0) {
            if (iVar1 == 1) {
              if (*(uint *)(puVar4 + 0x1c) <= *(uint *)(puVar6 + 0x1c)) goto LAB_1009bca5;
            }
            else {
              if (iVar1 != 2) goto LAB_1009bba8;
              uVar3 = *(uint *)(puVar6 + 0x18);
              if (((uVar3 != 1) || (*(uint *)(puVar4 + 0x1c) <= *(uint *)(puVar6 + 0x1c))) &&
                 ((iVar2 = *(int *)(puVar6 + 0x1c), iVar2 != 1 ||
                  (*(uint *)(puVar4 + 0x1c) <= uVar3)))) {
                if ((uVar3 != 1) && (iVar2 != 1)) {
                  bVar8 = uVar3 * iVar2 - *(int *)(puVar4 + 0x1c) == 0;
                  goto LAB_1009bc2d;
                }
                goto LAB_1009bca5;
              }
            }
            goto LAB_1009ba8f;
          }
        }
        else if (iVar2 == 2) {
          if (iVar1 != 0) {
            if (iVar1 == 1) {
              uVar3 = *(uint *)(puVar4 + 0x18);
              if (((uVar3 != 1) || (*(uint *)(puVar4 + 0x1c) <= *(uint *)(puVar6 + 0x1c))) &&
                 ((iVar2 = *(int *)(puVar4 + 0x1c), iVar2 != 1 ||
                  (uVar3 <= *(uint *)(puVar6 + 0x1c))))) {
                if ((uVar3 != 1) && (iVar2 != 1)) {
                  bVar8 = uVar3 * iVar2 - *(int *)(puVar6 + 0x1c) == 0;
                  goto LAB_1009bc2d;
                }
                goto LAB_1009bca5;
              }
            }
            else {
              if (iVar1 != 2) goto LAB_1009bba8;
              if ((*(uint *)(puVar4 + 0x18) <= *(uint *)(puVar6 + 0x18)) &&
                 (*(uint *)(puVar4 + 0x1c) <= *(uint *)(puVar6 + 0x1c))) goto LAB_1009bca5;
            }
            goto LAB_1009ba8f;
          }
        }
        else if (iVar2 == 3) {
          if (iVar1 != 3) goto LAB_1009ba8f;
          iVar2 = *(int *)(puVar6 + 0x14);
          if (iVar2 != 0xd) {
            if (iVar2 == 0xf) {
              iVar2 = *(int *)(puVar4 + 0x14);
              if (((iVar2 == 0xf) || (iVar2 == 0x10)) || ((iVar2 == 0x11 || (iVar2 == 0x12))))
              goto LAB_1009bca5;
              bVar8 = iVar2 == 0x13;
            }
            else if (iVar2 == 0x14) {
              iVar2 = *(int *)(puVar4 + 0x14);
              if (((iVar2 == 0x14) || (iVar2 == 0x15)) || ((iVar2 == 0x16 || (iVar2 == 0x17))))
              goto LAB_1009bca5;
              bVar8 = iVar2 == 0x18;
            }
            else {
              bVar8 = *(int *)(puVar4 + 0x14) == iVar2;
            }
LAB_1009bc2d:
            if (!bVar8) goto LAB_1009ba8f;
          }
        }
LAB_1009bca5:
        pcVar7 = "";
        goto LAB_1009ba94;
      }
LAB_1009bba8:
      if (iVar1 != 3) goto LAB_1009bca5;
    }
  }
LAB_1009ba8f:
  pcVar7 = "implicitly ";
LAB_1009ba94:
  FUN_10099c8f(local_150,0xff,param_3);
  FUN_10099c8f(local_250,0xff,param_4);
  if (param_2 == 0) {
    FUN_100994dd(local_8,param_1,0xbc9,"cannot %sconvert from \'%s\' to \'%s\'");
  }
  else {
    FUN_100994dd(local_8,param_1,0xbc9,"\'%s\': cannot %sconvert from \'%s\' to \'%s\'",param_2,
                 pcVar7,local_250,local_150);
  }
  return;
}


