// 100665f9 size=868 FUN_100665f9

void FUN_100665f9(undefined4 param_1,int param_2)

{
  undefined4 uVar1;
  uint uVar2;
  int iVar3;
  int in_ECX;
  int iVar4;
  bool bVar5;
  char *pcVar6;
  int local_44 [16];
  
  iVar4 = 0;
  if (*(int *)(in_ECX + 0x44) != 0) {
    return;
  }
  while (param_2 != 0) {
    iVar3 = *(int *)(in_ECX + 0x5c);
    param_2 = param_2 + -1;
    if (iVar3 == 0) {
      pcVar6 = "internal error: stack underflow";
      goto LAB_10066940;
    }
    local_44[param_2] = *(int *)(iVar3 + 8);
    *(undefined4 *)(in_ECX + 0x5c) = *(undefined4 *)(iVar3 + 0xc);
    *(undefined4 *)(iVar3 + 8) = 0;
    *(undefined4 *)(iVar3 + 0xc) = *(undefined4 *)(in_ECX + 0x60);
    *(int *)(in_ECX + 0x60) = iVar3;
  }
  switch(param_1) {
  case 0:
    FUN_1006611b(*(undefined4 *)(local_44[0] + 0x18),1);
    break;
  case 1:
    FUN_100651a5(*(undefined4 *)(local_44[0] + 0x18));
    break;
  case 2:
    uVar1 = 0;
    goto LAB_10066681;
  case 3:
    uVar1 = *(undefined4 *)(local_44[1] + 0x18);
LAB_10066681:
    FUN_10063f9f(*(undefined4 *)(local_44[0] + 0x18),uVar1);
    break;
  case 4:
    FUN_10063fd8();
    break;
  case 5:
    FUN_100641d1();
    break;
  case 6:
    uVar2 = *(uint *)(local_44[0] + 0x18);
    goto LAB_100666b9;
  case 7:
    uVar2 = FUN_10064fd0(*(undefined4 *)(local_44[0] + 0x18),0,0);
    goto LAB_100666b9;
  case 8:
    iVar3 = FUN_10064fd0(*(undefined4 *)(local_44[0] + 0x18),0,0);
    uVar2 = (uint)(iVar3 == 0);
LAB_100666b9:
    FUN_100642b5(uVar2);
    break;
  case 9:
    FUN_10064315(*(undefined4 *)(local_44[0] + 0x18));
    break;
  case 10:
    FUN_10064392();
    break;
  case 0xb:
    FUN_100643fc();
    break;
  case 0xc:
    FUN_100642b5(1);
    goto LAB_10066720;
  case 0xd:
    FUN_10064315(1);
LAB_10066720:
    FUN_10067789();
    break;
  case 0xe:
    FUN_10065219();
    break;
  case 0xf:
  case 0x10:
  case 0x13:
  case 0x16:
  case 0x17:
  case 0x1a:
  case 0x1d:
  case 0x22:
  case 0x25:
  case 0x27:
  case 0x29:
  case 0x2b:
    iVar4 = local_44[0];
    break;
  case 0x11:
    *(undefined4 *)(local_44[0] + 0x10) = 2;
    uVar2 = FUN_10065377(*(undefined4 *)(local_44[0] + 0x18));
    goto LAB_100667c8;
  case 0x12:
    *(undefined4 *)(local_44[0] + 0x10) = 2;
    uVar1 = FUN_10064fd0(*(undefined4 *)(local_44[0] + 0x18),0,0);
    *(undefined4 *)(local_44[0] + 0x18) = uVar1;
    *(undefined4 *)(in_ECX + 0x58) = 1;
    iVar4 = local_44[0];
    break;
  case 0x14:
    uVar2 = (uint)(*(int *)(local_44[0] + 0x18) == 0);
    goto LAB_10066792;
  case 0x15:
    *(int *)(local_44[0] + 0x18) = -*(int *)(local_44[0] + 0x18);
    iVar4 = local_44[0];
    break;
  case 0x18:
    uVar2 = *(int *)(local_44[1] + 0x18) * *(int *)(local_44[0] + 0x18);
    goto LAB_10066792;
  case 0x19:
    if (*(uint *)(local_44[1] + 0x18) == 0) {
      FUN_10067c3e(in_ECX + 0x18,in_ECX + 0x278,0x5df,"division by zero in preprocessor expression")
      ;
      *(undefined4 *)(in_ECX + 0x44) = 1;
      iVar4 = local_44[0];
      break;
    }
    uVar2 = *(uint *)(local_44[0] + 0x18) / *(uint *)(local_44[1] + 0x18);
LAB_100667c8:
    *(uint *)(local_44[0] + 0x18) = uVar2;
    iVar4 = local_44[0];
    break;
  case 0x1b:
    *(int *)(local_44[0] + 0x18) = *(int *)(local_44[0] + 0x18) + *(int *)(local_44[1] + 0x18);
    iVar4 = local_44[0];
    break;
  case 0x1c:
    *(int *)(local_44[0] + 0x18) = *(int *)(local_44[0] + 0x18) - *(int *)(local_44[1] + 0x18);
    iVar4 = local_44[0];
    break;
  case 0x1e:
    bVar5 = *(uint *)(local_44[0] + 0x18) < *(uint *)(local_44[1] + 0x18);
    goto LAB_10066837;
  case 0x1f:
    bVar5 = *(uint *)(local_44[1] + 0x18) < *(uint *)(local_44[0] + 0x18);
LAB_10066837:
    uVar2 = (uint)bVar5;
    goto LAB_10066792;
  case 0x20:
    bVar5 = *(uint *)(local_44[1] + 0x18) < *(uint *)(local_44[0] + 0x18);
    goto LAB_1006686e;
  case 0x21:
    bVar5 = *(uint *)(local_44[0] + 0x18) < *(uint *)(local_44[1] + 0x18);
    goto LAB_1006686e;
  case 0x23:
    bVar5 = *(int *)(local_44[0] + 0x18) != *(int *)(local_44[1] + 0x18);
LAB_1006686e:
    uVar2 = 1 - bVar5;
    goto LAB_10066792;
  case 0x24:
    *(uint *)(local_44[0] + 0x18) =
         (uint)(*(int *)(local_44[0] + 0x18) != *(int *)(local_44[1] + 0x18));
    iVar4 = local_44[0];
    break;
  case 0x26:
    if (*(int *)(local_44[0] + 0x18) != 0) {
LAB_10066895:
      if (*(int *)(local_44[1] + 0x18) != 0) goto LAB_1006689d;
    }
    uVar2 = 0;
    goto LAB_10066792;
  case 0x28:
    if (*(int *)(local_44[0] + 0x18) == 0) goto LAB_10066895;
LAB_1006689d:
    uVar2 = 1;
    goto LAB_10066792;
  case 0x2a:
    if (*(int *)(local_44[0] + 0x18) == 0) {
      local_44[1] = local_44[2];
    }
    uVar2 = *(uint *)(local_44[1] + 0x18);
LAB_10066792:
    *(uint *)(local_44[0] + 0x18) = uVar2;
    iVar4 = local_44[0];
    break;
  case 0x2c:
  case 0x2d:
  case 0x2e:
    iVar4 = FUN_1006506e(0x30);
    if (iVar4 == 0) {
      iVar4 = 0;
    }
    else {
      iVar4 = FUN_10082a7b(in_ECX + 0x278);
    }
    FUN_100650f1(iVar4);
  }
  if (*(int *)(in_ECX + 0x44) == 0) {
    iVar3 = *(int *)(in_ECX + 0x60);
    if (iVar3 == 0) {
      iVar3 = FUN_1006506e(0x14);
      if (iVar3 == 0) {
        iVar3 = 0;
      }
      else {
        iVar3 = FUN_10082872(iVar4,*(undefined4 *)(in_ECX + 0x5c),"Stack");
      }
      if (iVar3 == 0) {
        pcVar6 = "internal error: out of memory";
LAB_10066940:
        FUN_10067c3e(in_ECX + 0x18,in_ECX + 0x278,0,pcVar6);
        *(undefined4 *)(in_ECX + 0x44) = 1;
        return;
      }
    }
    else {
      *(undefined4 *)(in_ECX + 0x60) = *(undefined4 *)(iVar3 + 0xc);
      *(int *)(iVar3 + 8) = iVar4;
      *(undefined4 *)(iVar3 + 0xc) = *(undefined4 *)(in_ECX + 0x5c);
    }
    *(int *)(in_ECX + 0x5c) = iVar3;
  }
  return;
}


