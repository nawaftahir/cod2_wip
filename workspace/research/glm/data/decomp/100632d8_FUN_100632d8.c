// 100632d8 size=806 FUN_100632d8

undefined4 FUN_100632d8(uint *param_1,undefined4 *param_2,int *param_3)

{
  byte bVar1;
  undefined4 uVar2;
  uint uVar3;
  uint *puVar4;
  uint uVar5;
  char local_30 [32];
  uint local_10;
  int local_c;
  char local_8 [4];
  
  local_c = 0;
  if (param_1 == (uint *)0x0) {
    uVar2 = 0x8876086c;
  }
  else {
    if (param_3 != (int *)0x0) {
      *param_3 = 0;
    }
    bVar1 = *(byte *)((int)param_1 + 1);
    local_10 = (uint)(bVar1 < 2);
    uVar3 = *param_1 & 0xffff0000;
    if (uVar3 != 0x46580000) {
      if (uVar3 == 0xfffe0000) {
        if (bVar1 == 3) {
          while( true ) {
            puVar4 = param_1 + 1;
            if (((*puVar4 & 0xffff) == 0x1f) &&
               ((param_1[3] >> 0x14 & 0x700 | param_1[3] & 0x1800) == 0x600)) {
              if (param_2 != (undefined4 *)0x0) {
                param_2[local_c * 2] = param_1[2] & 0xffff;
                param_2[local_c * 2 + 1] = *(ushort *)((int)param_1 + 10) & 0x7fff;
              }
              local_c = local_c + 1;
            }
            uVar3 = *puVar4;
            if ((uVar3 & 0xffff) == 0xffff) break;
            if ((uVar3 & 0xffff) == 0xfffe) {
              uVar3 = uVar3 >> 0x10 & 0x7fff;
            }
            else {
              uVar3 = uVar3 >> 0x18 & 0xf;
            }
            param_1 = puVar4 + uVar3;
          }
        }
        else {
          local_8[0] = '\0';
          local_8[1] = '\0';
          local_8[2] = 0;
          local_30[0x18] = '\0';
          local_30[0x19] = '\0';
          local_30[0x1a] = '\0';
          local_30[0x1b] = '\0';
          local_30[0x1c] = '\0';
          local_30[0x1d] = '\0';
          local_30[0x1e] = '\0';
          local_30[0x1f] = '\0';
          while( true ) {
            while( true ) {
              puVar4 = param_1;
              param_1 = puVar4 + 1;
              uVar3 = *param_1;
              if (-1 < (int)uVar3) break;
              uVar5 = uVar3 & 0xf0001800;
              uVar3 = uVar3 & 0x7ff;
              if (uVar5 == 0xc0000000) {
                local_8[uVar3] = '\x01';
              }
              else if (uVar5 == 0xd0000000) {
                *(undefined1 *)((int)&param_1 + uVar3 + 2) = 1;
              }
              else if (uVar5 == 0xe0000000) {
                local_30[uVar3 + 0x18] = '\x01';
              }
            }
            uVar5 = uVar3 & 0xffff;
            if (uVar5 == 0xffff) break;
            if (uVar5 == 0xfffe) {
              uVar3 = uVar3 >> 0x10 & 0x7fff;
LAB_10063574:
              param_1 = param_1 + uVar3;
            }
            else if (((uVar5 == 0x51) || (uVar5 == 0x30)) || (uVar5 == 0x2f)) {
              if (local_10 == 0) {
                uVar3 = uVar3 >> 0x18 & 0xf;
                goto LAB_10063574;
              }
              param_1 = puVar4 + 6;
            }
            else if (uVar5 == 0x1f) {
              param_1 = puVar4 + 2;
            }
          }
          uVar3 = 0;
          do {
            if (local_30[uVar3 + 0x18] != '\0') {
              if (param_2 != (undefined4 *)0x0) {
                param_2[local_c * 2] = 5;
                param_2[local_c * 2 + 1] = uVar3;
              }
              local_c = local_c + 1;
            }
            uVar3 = uVar3 + 1;
          } while (uVar3 < 8);
          uVar3 = 0;
          do {
            if (*(char *)((int)&param_1 + uVar3 + 2) != '\0') {
              if (param_2 != (undefined4 *)0x0) {
                param_2[local_c * 2] = 10;
                param_2[local_c * 2 + 1] = uVar3;
              }
              local_c = local_c + 1;
            }
            uVar3 = uVar3 + 1;
          } while (uVar3 < 2);
          uVar3 = 0;
          do {
            if (local_8[uVar3] != '\0') {
              if (param_2 != (undefined4 *)0x0) {
                if (uVar3 == 0) {
                  param_2[local_c * 2] = 0;
                }
                else if (uVar3 == 2) {
                  param_2[local_c * 2] = 4;
                }
                else {
                  param_2[local_c * 2] = 0xb;
                }
                param_2[local_c * 2 + 1] = 0;
              }
              local_c = local_c + 1;
            }
            uVar3 = uVar3 + 1;
          } while (uVar3 < 3);
        }
      }
      else {
        if (uVar3 != 0xffff0000) {
          return 0x88760b59;
        }
        if (bVar1 < 2) {
          if (param_2 != (undefined4 *)0x0) {
            param_2[1] = 0;
            *param_2 = 10;
          }
          local_c = 1;
        }
        else {
          local_30[0x10] = '\0';
          local_30[0x11] = '\0';
          local_30[0x12] = '\0';
          local_30[0x13] = '\0';
          local_30[0x14] = '\0';
          local_30[0x15] = '\0';
          local_30[0x16] = '\0';
          local_30[0x17] = '\0';
          local_30[0x18] = '\0';
          local_30[0x19] = '\0';
          local_30[0x1a] = '\0';
          local_30[0x1b] = '\0';
          local_30[0x1c] = '\0';
          local_30[0x1d] = '\0';
          local_30[0x1e] = '\0';
          local_30[0x1f] = '\0';
          local_30[0] = '\0';
          local_30[1] = '\0';
          local_30[2] = '\0';
          local_30[3] = '\0';
          local_30[4] = '\0';
          local_30[5] = '\0';
          local_30[6] = '\0';
          local_30[7] = '\0';
          local_30[8] = '\0';
          local_30[9] = '\0';
          local_30[10] = '\0';
          local_30[0xb] = '\0';
          local_30[0xc] = '\0';
          local_30[0xd] = '\0';
          local_30[0xe] = '\0';
          local_30[0xf] = '\0';
          while( true ) {
            while( true ) {
              puVar4 = param_1;
              param_1 = puVar4 + 1;
              uVar3 = *param_1;
              if (-1 < (int)uVar3) break;
              if ((uVar3 & 0xf0001800) == 0x80000800) {
                local_30[(uVar3 & 0x7ff) + 0x10] = '\x01';
              }
              else if ((uVar3 & 0xf0001800) == 0x90000800) {
                local_30[uVar3 & 0x7ff] = '\x01';
              }
            }
            uVar5 = uVar3 & 0xffff;
            if (uVar5 == 0xffff) break;
            if (uVar5 == 0xfffe) {
              uVar3 = uVar3 >> 0x10 & 0x7fff;
LAB_100633eb:
              param_1 = param_1 + uVar3;
            }
            else if (((uVar5 == 0x51) || (uVar5 == 0x30)) || (uVar5 == 0x2f)) {
              if (local_10 == 0) {
                uVar3 = uVar3 >> 0x18 & 0xf;
                goto LAB_100633eb;
              }
              param_1 = puVar4 + 6;
            }
            else if (uVar5 == 0x1f) {
              param_1 = puVar4 + 2;
            }
          }
          uVar3 = 0;
          do {
            if (local_30[uVar3 + 0x10] != '\0') {
              if (param_2 != (undefined4 *)0x0) {
                param_2[local_c * 2] = 10;
                param_2[local_c * 2 + 1] = uVar3;
              }
              local_c = local_c + 1;
            }
            uVar3 = uVar3 + 1;
          } while (uVar3 < 0x10);
          uVar3 = 0;
          do {
            if (local_30[uVar3] != '\0') {
              if (param_2 != (undefined4 *)0x0) {
                param_2[local_c * 2] = 0xc;
                param_2[local_c * 2 + 1] = uVar3;
              }
              local_c = local_c + 1;
            }
            uVar3 = uVar3 + 1;
          } while (uVar3 < 0x10);
        }
      }
      *param_3 = local_c;
    }
    uVar2 = 0;
  }
  return uVar2;
}


