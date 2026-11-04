// 10060540 size=255 FUN_10060540

longlong FUN_10060540(uint param_1,uint param_2)

{
  longlong lVar1;
  
  lVar1 = __allmul(param_1 & 0xff,0,0x100,0);
  lVar1 = __allmul(lVar1 + (ulonglong)(param_1 >> 8 & 0xff),0x100,0);
  lVar1 = __allmul(lVar1 + (ulonglong)(param_1 >> 0x10 & 0xff),0x100,0);
  lVar1 = __allmul(lVar1 + (ulonglong)(param_1 >> 0x18),0x100,0);
  lVar1 = __allmul(lVar1 + (ulonglong)(param_2 & 0xff),0x100,0);
  lVar1 = __allmul(lVar1 + (ulonglong)(param_2 >> 8 & 0xff),0x100,0);
  lVar1 = __allmul(lVar1 + (ulonglong)(param_2 >> 0x10 & 0xff),0x100,0);
  return lVar1 + (ulonglong)(param_2 >> 0x18);
}


