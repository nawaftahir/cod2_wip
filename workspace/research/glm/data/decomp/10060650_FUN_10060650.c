// 10060650 size=39 FUN_10060650

float10 FUN_10060650(undefined4 param_1)

{
  undefined4 local_4;
  
  local_4 = (float)CONCAT13((char)param_1,
                            CONCAT12((char)((uint)param_1 >> 8),
                                     CONCAT11((char)((uint)param_1 >> 0x10),
                                              (char)((uint)param_1 >> 0x18))));
  return (float10)local_4;
}


