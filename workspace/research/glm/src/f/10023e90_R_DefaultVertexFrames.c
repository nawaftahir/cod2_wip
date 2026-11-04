void R_DefaultVertexFrames(int vertCount, unsigned int *verts)
{
    unsigned int *p;

    if (vertCount > 0)
    {
        p = (unsigned int *)((char *)verts + 0x14);
        do
        {
            p[-2] = 0;
            p[-1] = 0;
            p[0] = 0x3F800000;
            p[6] = 0;
            p[7] = 0x3F800000;
            p[8] = 0;
            p[9] = 0x3F800000;
            p[10] = 0;
            p[11] = 0;
            p += 17;
        } while (--vertCount != 0);
    }
}
