// 10100488 size=26 _GetLcidFromDefault

/* Library Function - Single Match
    _GetLcidFromDefault
   
   Library: Visual Studio 2003 Release */

void _GetLcidFromDefault(void)

{
  DAT_101ae16c._0_2_ = (ushort)DAT_101ae16c | 0x104;
  DAT_101ae174 = GetUserDefaultLCID();
  DAT_101ae170 = DAT_101ae174;
  return;
}


