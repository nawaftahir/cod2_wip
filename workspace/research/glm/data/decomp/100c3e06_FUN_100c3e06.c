// 100c3e06 size=645 FUN_100c3e06

int FUN_100c3e06(undefined4 param_1,int param_2,uint param_3,uint param_4,int param_5)

{
  ushort uVar1;
  undefined2 uVar2;
  int iVar3;
  void *_Memory;
  int iVar4;
  void *pvVar5;
  undefined4 local_14;
  undefined4 local_10;
  undefined4 local_c;
  undefined4 local_8;
  
  if (param_5 == 0) {
    iVar3 = 0;
  }
  else {
    for (; iVar3 = *(int *)(param_2 + 4), iVar3 != 1; param_2 = *(int *)(param_2 + 0x10)) {
      if (iVar3 != 8) {
        if (iVar3 != 9) {
          return -0x7fffbffb;
        }
        uVar1 = 0;
        local_8 = 0;
        iVar3 = *(int *)(param_2 + 0x10);
        if (iVar3 == 0) {
          uVar1 = 0;
        }
        else if (iVar3 == 1) {
          uVar1 = 1;
        }
        else if (iVar3 == 2) {
          uVar1 = (byte)~(byte)(*(uint *)(param_2 + 0x20) >> 10) & 1 | 2;
        }
        else if (iVar3 == 3) {
          uVar1 = 4;
        }
        switch(*(undefined4 *)(param_2 + 0x14)) {
        case 0:
          local_14 = CONCAT22(1,uVar1);
          break;
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:
        case 6:
        case 7:
        case 8:
        case 0xd:
          local_14 = CONCAT22(2,uVar1);
          break;
        case 9:
        case 10:
        case 0xb:
        case 0xc:
          local_14 = CONCAT22(3,uVar1);
          break;
        case 0xe:
          local_14 = CONCAT22(4,uVar1);
          break;
        case 0xf:
          local_14 = CONCAT22(5,uVar1);
          break;
        case 0x10:
          local_14 = CONCAT22(6,uVar1);
          break;
        case 0x11:
          local_14 = CONCAT22(7,uVar1);
          break;
        case 0x12:
          local_14 = CONCAT22(8,uVar1);
          break;
        case 0x13:
          local_14 = CONCAT22(9,uVar1);
          break;
        case 0x14:
          if ((param_4 & 0x200000) != 0) goto switchD_100c3e9b_caseD_16;
          if ((param_4 & 0x400000) != 0) goto switchD_100c3e9b_caseD_17;
          local_14 = CONCAT22((ushort)(param_4 >> 0x16),uVar1) & 0x2ffff | 0xc0000;
          break;
        case 0x15:
          local_14 = CONCAT22(0xb,uVar1);
          break;
        case 0x16:
switchD_100c3e9b_caseD_16:
          local_14 = CONCAT22(0xc,uVar1);
          break;
        case 0x17:
switchD_100c3e9b_caseD_17:
          local_14 = CONCAT22(0xd,uVar1);
          break;
        case 0x18:
          local_14 = CONCAT22(0xe,uVar1);
          break;
        case 0x19:
          local_14 = CONCAT22(0xf,uVar1);
          break;
        case 0x1a:
          local_14 = CONCAT22(0x10,uVar1);
          break;
        case 0x1b:
          local_14 = CONCAT22(0x11,uVar1);
          break;
        case 0x1c:
          local_14 = CONCAT22(0x12,uVar1);
          break;
        default:
          local_14 = (uint)uVar1;
        }
        local_10 = CONCAT22(*(undefined2 *)(param_2 + 0x1c),*(undefined2 *)(param_2 + 0x18));
        local_c = param_3 & 0xffff;
        iVar3 = FUN_100840db(&local_14,0x10,2,param_5);
        goto LAB_100c4080;
      }
      param_3 = param_3 * *(int *)(param_2 + 0x14);
    }
    local_c = 0;
    local_8 = 0;
    local_14 = 5;
    local_10 = 1;
    uVar2 = FUN_100c3da3(param_2);
    local_10 = CONCAT22(uVar2,(undefined2)local_10);
    iVar3 = param_2;
    do {
      local_c._2_2_ = local_c._2_2_ + 1;
      iVar3 = *(int *)(iVar3 + 0xc);
    } while (iVar3 != 0);
    _Memory = operator_new((uint)local_c._2_2_ << 3);
    pvVar5 = _Memory;
    if (_Memory == (void *)0x0) {
      iVar3 = -0x7ff8fff2;
    }
    else {
      do {
        iVar3 = *(int *)(*(int *)(param_2 + 8) + 0x18);
        iVar4 = FUN_100840db(*(undefined4 *)(*(int *)(*(int *)(param_2 + 8) + 0x14) + 0x18),
                             0xffffffff,7,pvVar5);
        if (iVar4 < 0) {
          _free(_Memory);
          return iVar4;
        }
        iVar3 = FUN_100c3e06(param_1,*(undefined4 *)(iVar3 + 0x20),1,param_4,(int)pvVar5 + 4);
        if (iVar3 < 0) {
          _free(_Memory);
          return iVar3;
        }
        param_2 = *(int *)(param_2 + 0xc);
        pvVar5 = (void *)((int)pvVar5 + 8);
      } while (param_2 != 0);
      iVar3 = FUN_100840db(_Memory,(uint)local_c._2_2_ << 3,2,&local_8);
      _free(_Memory);
      if (-1 < iVar3) {
        iVar3 = FUN_100840db(&local_14,0x10,2,param_5);
LAB_100c4080:
        if (-1 < iVar3) {
          iVar3 = 0;
        }
      }
    }
  }
  return iVar3;
}


