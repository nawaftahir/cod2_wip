int R_TextHeight(const void *font)
{
    return *(const int *)((const unsigned char *)font + 4);
}
