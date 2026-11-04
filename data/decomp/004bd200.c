
void __thiscall FUN_004bd200(int param_1,undefined4 param_2,int param_3)

{
  int iVar1;
  
  *(undefined4 *)(param_1 + 0x24) = 0;
  if (4 < DAT_00598cc8) {
    _printf("NetTcpTransport send %d bytes\n",param_3);
  }
  iVar1 = Ordinal_19(*(undefined4 *)(param_1 + 4),param_2,param_3,0);
  if (iVar1 != param_3) {
    FUN_004c8870("write","socket");
    FUN_004becd0(&DAT_00563348);
  }
  return;
}

