extern unsigned int DAT_101d4d28;
extern int FUN_10017050();


unsigned int FUN_10017250(void)

{
  char local_5;
  unsigned short local_4 [2];
  
  FUN_10017050(local_4,&local_5);
  if (local_5 == '\0') {
    return 0;
  }
  return (&DAT_101d4d28)[local_4[0]];
}


