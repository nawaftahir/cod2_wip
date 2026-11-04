
void FUN_0048acc0(void *param_1)

{
  int iVar1;
  
  if (DAT_01233514 == 0) {
    _free(param_1);
    return;
  }
  if (*(int *)((int)param_1 + -0x10) != -0x76ac876e) {
    FUN_0047ae50(0,"Hunk_FreeTempMemory: bad magic");
  }
  iVar1 = DAT_01233514;
  *(undefined4 *)((int)param_1 + -0x10) = 0x89537893;
  if (((undefined4 *)((int)param_1 + -0x10) !=
       (undefined4 *)(((DAT_01147dd4 - *(int *)((int)param_1 + -0xc)) + 0xfU & 0xfffffff0) + iVar1))
     && (DAT_0124a41a == '\0')) {
    iVar1 = FUN_0047d980("hdr == (void *)( s_hunkData + ((hunk_low.temp - hdr->size + 15) & ~15) )",
                         "\\trees\\cod2src\\src\\universal\\com_memory.cpp",0x6b5,0,1);
    if (iVar1 == 0) {
      DebugBreak();
    }
    else if (iVar1 == 2) {
      DAT_0124a41a = 1;
      DAT_01147dd4 = DAT_01147dd4 - *(int *)((int)param_1 + -0xc);
      return;
    }
  }
  DAT_01147dd4 = DAT_01147dd4 - *(int *)((int)param_1 + -0xc);
  return;
}

