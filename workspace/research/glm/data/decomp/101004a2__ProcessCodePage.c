// 101004a2 size=118 _ProcessCodePage

/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */
/* Library Function - Single Match
    _ProcessCodePage
   
   Library: Visual Studio 2003 Release */

void _ProcessCodePage(void)

{
  int iVar1;
  char *in_ECX;
  undefined4 uVar2;
  char local_10 [8];
  undefined4 local_8;
  
  local_8 = DAT_101a50d0;
  if (((in_ECX == (char *)0x0) || (*in_ECX == '\0')) || (iVar1 = _strcmp(in_ECX,"ACP"), iVar1 == 0))
  {
    uVar2 = 0x1004;
  }
  else {
    iVar1 = _strcmp(in_ECX,"OCP");
    if (iVar1 != 0) goto LAB_10100506;
    uVar2 = 0xb;
  }
  iVar1 = (*DAT_101ae18c)(DAT_101ae174,uVar2,local_10,8);
  if (iVar1 == 0) {
    return;
  }
  in_ECX = local_10;
LAB_10100506:
  _atol(in_ECX);
  return;
}


