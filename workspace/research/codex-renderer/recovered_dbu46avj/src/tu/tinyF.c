/* 0x100f7939: error-handler dispatch table init (6 slots, slot0 reused
 * for slot5). Code addresses go through declared symbols for relocs. */
extern unsigned int tbl_101a4fb0[];
extern unsigned char h_100fe7cc[];
extern unsigned char h_100fe45a[];
extern unsigned char h_100fe4bf[];
extern unsigned char h_100fe41e[];
extern unsigned char h_100fe4a5[];

void FUN_100f7939(void)
{
    unsigned int e;

    e = (unsigned int)h_100fe7cc;
    tbl_101a4fb0[0] = e;
    tbl_101a4fb0[1] = (unsigned int)h_100fe45a;
    tbl_101a4fb0[2] = (unsigned int)h_100fe4bf;
    tbl_101a4fb0[3] = (unsigned int)h_100fe41e;
    tbl_101a4fb0[4] = (unsigned int)h_100fe4a5;
    tbl_101a4fb0[5] = e;
}
