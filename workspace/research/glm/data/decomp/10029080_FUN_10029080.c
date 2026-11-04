// 10029080 size=101 FUN_10029080

/* WARNING: Function: __chkstk replaced with injection: alloca_probe */

void FUN_10029080(undefined4 param_1)

{
  char cVar1;
  int iVar2;
  char *pcVar3;
  undefined4 uVar4;
  char local_2000 [8188];
  undefined4 uStack_4;
  
  uStack_4 = 0x1002908a;
  iVar2 = (*(code *)RI_Cbuf_ExecuteText)(&PTR_s_r_sunsprite_shader_101a5a38,0x15,local_2000,0x2000);
  pcVar3 = local_2000;
  if (iVar2 != 0) {
    do {
      cVar1 = *pcVar3;
      pcVar3 = pcVar3 + 1;
    } while (cVar1 != '\0');
    uVar4 = FUN_10060c70("sun/%s.sun",param_1,local_2000,(int)pcVar3 - (int)(local_2000 + 1));
    (*(code *)RI_FS_FileExists)(uVar4);
  }
  return;
}


