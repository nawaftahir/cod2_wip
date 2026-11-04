// 10067e62 size=269 FUN_10067e62

void FUN_10067e62(undefined4 param_1,undefined4 *param_2)

{
  char *pcVar1;
  undefined8 uVar2;
  char local_104 [256];
  
  switch(*param_2) {
  case 0:
    pcVar1 = "version token";
    break;
  case 1:
    goto LAB_10067f07;
  case 2:
    pcVar1 = "integer \'%u\'";
    goto LAB_10067f0c;
  case 3:
    pcVar1 = "integer \'%dl\'";
    goto LAB_10067f0c;
  case 4:
    pcVar1 = "integer \'%uul\'";
    goto LAB_10067f0c;
  case 5:
    uVar2 = *(undefined8 *)(param_2 + 2);
    pcVar1 = "float \'%g\'";
    goto LAB_10067eee;
  case 6:
    uVar2 = *(undefined8 *)(param_2 + 2);
    pcVar1 = "float \'%gh\'";
    goto LAB_10067eee;
  case 7:
    uVar2 = *(undefined8 *)(param_2 + 2);
    pcVar1 = "float \'%gf\'";
    goto LAB_10067eee;
  case 8:
    uVar2 = *(undefined8 *)(param_2 + 2);
    pcVar1 = "float \'%gl\'";
LAB_10067eee:
    __snprintf(local_104,0x100,pcVar1,uVar2);
    goto LAB_10067f50;
  case 9:
LAB_10067f07:
    pcVar1 = "token \'%s\'";
LAB_10067f0c:
    __snprintf(local_104,0x100,pcVar1);
    goto LAB_10067f50;
  case 10:
    pcVar1 = "string constant";
    break;
  default:
    pcVar1 = "token";
    break;
  case 0xc:
    pcVar1 = "end of line";
    break;
  case 0xd:
    pcVar1 = "end of file";
  }
  __snprintf(local_104,0x100,pcVar1);
LAB_10067f50:
  FUN_10067c3e();
  return;
}


