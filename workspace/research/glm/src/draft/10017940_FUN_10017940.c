extern int FUN_10060c10();


void FUN_10017940(unsigned int param_1)

{
  unsigned char local_40 [64];
  
  FUN_10060c10("materials/%s");
  (*(void *)RI_FS_FreeFile)(local_40,param_1,1);
  return;
}


