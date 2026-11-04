
void __thiscall FUN_0041f610(int param_1,int param_2)

{
  HMENU pHVar1;
  
  pHVar1 = GetSubMenu(*(HMENU *)(param_1 + 4),param_2);
  CMenu::FromHandle(pHVar1);
  return;
}

