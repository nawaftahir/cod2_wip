// Draws the part of each ring segment inside triangle a,b,c, lifted onto its plane.
int FUN_0042bf50(const float *a, const float *b, const float *c, vec3_t *ring, int ringCount, const unsigned int *color,
                 int vertCount, int maxVerts, GfxPointVertex *verts)
{
    float edge[3][3];
    float dist[2][3];
    float offset[3];
    float plane[3];
    float pts[2][3];
    bool first;
    float t;
    float d1;
    float d2;
    int i;
    int j;
    int k;

    edge[0][0] = b[1] - a[1];
    edge[0][1] = a[0] - b[0];
    edge[0][2] = edge[0][0] * a[0] + edge[0][1] * a[1];
    edge[1][0] = c[1] - b[1];
    edge[1][1] = b[0] - c[0];
    edge[1][2] = edge[1][0] * b[0] + edge[1][1] * b[1];
    edge[2][0] = a[1] - c[1];
    edge[2][1] = c[0] - a[0];
    edge[2][2] = edge[2][1] * c[1] + edge[2][0] * c[0];
    plane[0] = 0;
    plane[1] = 0;
    plane[2] = 0;
    first = true;
    for (k = 0; k < 3; k++)
        dist[1][k] = edge[k][1] * ring[ringCount - 1][1] + edge[k][0] * ring[ringCount - 1][0] - edge[k][2];
    for (i = 0, j = ringCount - 1; i < ringCount; j = i++)
    {
        for (k = 0; k < 3; k++)
            dist[i & 1][k] = edge[k][0] * ring[i][0] + edge[k][1] * ring[i][1] - edge[k][2];
        if (dist[0][0] > 0 && dist[1][0] > 0)
            continue;
        if (dist[0][1] > 0 && dist[1][1] > 0)
            continue;
        if (dist[0][2] > 0 && dist[1][2] > 0)
            continue;
        pts[0][0] = ring[j][0];
        pts[0][1] = ring[j][1];
        pts[0][2] = ring[j][2];
        pts[1][0] = ring[i][0];
        pts[1][1] = ring[i][1];
        pts[1][2] = ring[i][2];
        for (k = 0; k < 3; k++)
        {
            d1 = edge[k][1] * pts[0][1] + edge[k][0] * pts[0][0] - edge[k][2];
            d2 = edge[k][1] * pts[1][1] + edge[k][0] * pts[1][0] - edge[k][2];
            if (d1 > 0 && d2 > 0)
                goto next;
            if (d1 <= 0)
            {
                if (d2 > 0)
                {
                    t = d2 - d1;
                    pts[1][0] = (d2 * pts[0][0] - pts[1][0] * d1) / t;
                    pts[1][1] = (d2 * pts[0][1] - pts[1][1] * d1) / t;
                    pts[1][2] = (pts[0][2] * d2 - pts[1][2] * d1) / t;
                }
            }
            else
            {
                t = d2 - d1;
                pts[0][0] = (d2 * pts[0][0] - pts[1][0] * d1) / t;
                pts[0][1] = (d2 * pts[0][1] - pts[1][1] * d1) / t;
                pts[0][2] = (pts[0][2] * d2 - pts[1][2] * d1) / t;
            }
        }
        if (first)
        {
            first = false;
            float dx = c[0] - b[0];
            float denom = (b[1] - c[1]) * a[0] + dx * a[1] + c[1] * b[0] - c[0] * b[1];
            if (denom == 0)
                continue;
            const float *vpn = reinterpret_cast<CMainFrameCamView *>(dword_01233488)->m_pCamWnd->vpn;
            float nx = (c[2] - b[2]) * a[1] + (b[1] - c[1]) * a[2] + c[1] * b[2] - c[2] * b[1];
            float ny = (b[2] - c[2]) * a[0] + dx * a[2] + b[0] * c[2] - c[0] * b[2];
            plane[0] = nx / denom;
            plane[1] = ny / denom;
            plane[2] = a[2] - plane[0] * a[0] - plane[1] * a[1];
            offset[0] = vpn[0] * -0.125f;
            offset[1] = vpn[1] * -0.125f;
            offset[2] = vpn[2] * -0.125f;
        }
        pts[0][2] = plane[0] * pts[0][0] + plane[1] * pts[0][1] + plane[2];
        pts[1][2] = plane[0] * pts[1][0] + plane[1] * pts[1][1] + plane[2];
        pts[0][0] += offset[0];
        pts[0][1] += offset[1];
        pts[0][2] += offset[2];
        pts[1][0] += offset[0];
        pts[1][1] += offset[1];
        pts[1][2] += offset[2];
        vertCount = R_Add3DLine(verts, pts[0], pts[1], color, 1, vertCount, maxVerts);
next:;
    }
    return vertCount;
}
