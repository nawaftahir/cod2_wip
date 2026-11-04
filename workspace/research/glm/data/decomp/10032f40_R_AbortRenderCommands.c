// 10032f40 size=59 R_AbortRenderCommands

undefined4 R_AbortRenderCommands(void)

{
  int iVar1;
  
  if (DAT_101d4958 != '\0') {
    iVar1 = (**(code **)(*DAT_101d494c + 0x1c))(DAT_101d494c,0,0,1);
    if ((iVar1 != -0x7789f798) && (iVar1 == 1)) {
      return 0;
    }
    DAT_101d4958 = '\0';
  }
  return 1;
}


