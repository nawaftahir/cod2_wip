#include <malloc.h>
#include <string.h>
#include "../universal/com_math.h"

// Patch mesh helpers (ancestor: Quake III q3map mesh.c, MAX_EXPANDED_AXIS 512).
#define MAX_EXPANDED_AXIS 512

struct drawVert_t
{
    float xyz[3];
    float st[2];
    float lightmap[2];
    float normal[3];
    unsigned char color[4];
};

struct mesh_t
{
    int width;
    int height;
    int field_08;
    drawVert_t *verts;
    int field_10;
};

void Error(const char *error, ...);
void ProjectPointOntoLine(const vec3_t point, const vec3_t start, const vec3_t end, vec3_t out);

drawVert_t expand[MAX_EXPANDED_AXIS][MAX_EXPANDED_AXIS];
int neighbors[8][2] = {
    { 0,  1 }, {  1,  1 }, {  1, 0 }, {  1, -1 },
    { 0, -1 }, { -1, -1 }, { -1, 0 }, { -1,  1 }
};

struct vec3_s
{
    float v[3];
};

static inline float I_sqrt_d(const double value)
{
    return sqrt(value);
}

static inline void CrossProduct(const vec3_t v1, const vec3_t v2, vec3_t cross)
{
    cross[0] = v1[1] * v2[2] - v1[2] * v2[1];
    cross[1] = v1[2] * v2[0] - v1[0] * v2[2];
    cross[2] = v2[1] * v1[0] - v1[1] * v2[0];
}

static inline float VectorLength(const vec3_s &p)
{
    float x = p.v[0];
    float y = p.v[1];
    float z = p.v[2];
    return I_sqrt_d(z * z + y * y + x * x);
}

float FUN_00420e90(const vec3_s &p)
{
    float z = p.v[2];
    float y = p.v[1];
    float x = p.v[0];
    return I_sqrt_d(x * x + y * y + z * z);
}

void LerpDrawVert(drawVert_t *a, drawVert_t *b, drawVert_t *out)
{
    out->xyz[0] = 0.5f * (a->xyz[0] + b->xyz[0]);
    out->xyz[1] = 0.5f * (a->xyz[1] + b->xyz[1]);
    out->xyz[2] = 0.5f * (a->xyz[2] + b->xyz[2]);

    out->st[0] = 0.5f * (a->st[0] + b->st[0]);
    out->st[1] = 0.5f * (a->st[1] + b->st[1]);

    out->lightmap[0] = 0.5f * (a->lightmap[0] + b->lightmap[0]);
    out->lightmap[1] = 0.5f * (a->lightmap[1] + b->lightmap[1]);

    out->color[0] = (a->color[0] + b->color[0]) >> 1;
    out->color[1] = (a->color[1] + b->color[1]) >> 1;
    out->color[2] = (a->color[2] + b->color[2]) >> 1;
    out->color[3] = (a->color[3] + b->color[3]) >> 1;
}

void FreeMesh(mesh_t *m)
{
    free(m);
}

mesh_t *CopyMesh(mesh_t *mesh)
{
    mesh_t *out;
    int size;

    size = mesh->width * mesh->height * sizeof(drawVert_t);
    out = (mesh_t *)malloc(sizeof(mesh_t) + size);
    out->width = mesh->width;
    out->height = mesh->height;
    out->verts = (drawVert_t *)(out + 1);
    memcpy(out->verts, mesh->verts, size);

    return out;
}

mesh_t *TransposeMesh(mesh_t *in)
{
    int w, h;
    mesh_t *out;

    out = (mesh_t *)malloc(sizeof(mesh_t));
    out->width = in->height;
    out->height = in->width;
    out->verts = (drawVert_t *)malloc(out->width * out->height * sizeof(drawVert_t));

    for (h = 0; h < in->height; h++)
    {
        for (w = 0; w < in->width; w++)
            out->verts[w * in->height + h] = in->verts[h * in->width + w];
    }

    free(in);
    return out;
}

void InvertMesh(mesh_t *in)
{
    int w, h;
    drawVert_t temp;

    for (h = 0; h < in->height; h++)
    {
        for (w = 0; w < in->width / 2; w++)
        {
            temp = in->verts[h * in->width + w];
            in->verts[h * in->width + w] = in->verts[h * in->width + in->width - 1 - w];
            in->verts[h * in->width + in->width - 1 - w] = temp;
        }
    }
}

void FUN_00421150(mesh_t *in)
{
    int i, j, k, dist;
    vec3_t normal;
    vec3_t sum;
    vec3_t base;
    vec3_t delta;
    int x, y;
    drawVert_t *dv;
    vec3_t around[8], temp;
    int good[8];
    int wrapWidth, wrapHeight;
    float len;

    wrapWidth = 0;
    for (i = 0; i < in->height; i++)
    {
        VectorSubtract(in->verts[i * in->width].xyz, in->verts[i * in->width + in->width - 1].xyz, delta);
        len = VectorLength(*(vec3_s *)delta);
        if (len > 1.0)
            break;
    }
    if (i == in->height)
        wrapWidth = 1;

    wrapHeight = 0;
    for (i = 0; i < in->width; i++)
    {
        VectorSubtract(in->verts[i].xyz, in->verts[i + (in->height - 1) * in->width].xyz, delta);
        len = VectorLength(*(vec3_s *)delta);
        if (len > 1.0)
            break;
    }
    if (i == in->width)
        wrapHeight = 1;

    for (i = 0; i < in->width; i++)
    {
        for (j = 0; j < in->height; j++)
        {
            dv = &in->verts[j * in->width + i];
            VectorCopy(dv->xyz, base);
            for (k = 0; k < 8; k++)
            {
                VectorClear(around[k]);
                good[k] = 0;

                for (dist = 1; dist <= 3; dist++)
                {
                    x = i + neighbors[k][0] * dist;
                    y = j + neighbors[k][1] * dist;
                    if (wrapWidth)
                    {
                        if (x < 0)
                            x = in->width - 1 + x;
                        else if (x >= in->width)
                            x = 1 + x - in->width;
                    }
                    if (wrapHeight)
                    {
                        if (y < 0)
                            y = in->height - 1 + y;
                        else if (y >= in->height)
                            y = 1 + y - in->height;
                    }

                    if (x < 0 || x >= in->width || y < 0 || y >= in->height)
                        break;

                    VectorSubtract(in->verts[y * in->width + x].xyz, base, temp);
                    if (Vec3Normalize(temp) == 0.0f)
                        continue;
                    else
                    {
                        good[k] = 1;
                        VectorCopy(temp, around[k]);
                        break;
                    }
                }
            }

            VectorClear(sum);
            for (k = 0; k < 8; k++)
            {
                if (!good[k] || !good[(k + 1) & 7])
                    continue;
                CrossProduct(around[(k + 1) & 7], around[k], normal);
                if (Vec3Normalize(normal) == 0.0f)
                    continue;
                VectorAdd(normal, sum, sum);
            }
            Vec3NormalizeTo(sum, dv->normal);
        }
    }
}

int FUN_00421500(mesh_t *m, vec4_t plane)
{
    int i, j, count;
    vec3_t d1, d2, normal, sum, pt;
    float dist, d;

    count = 0;
    VectorClear(sum);
    VectorClear(pt);
    for (i = 0; i < m->height - 1; i++)
    {
        for (j = 0; j < m->width - 1; j++)
        {
            VectorSubtract(m->verts[i * m->width + j + 1].xyz, m->verts[i * m->width + j].xyz, d1);
            VectorSubtract(m->verts[(i + 1) * m->width + j].xyz, m->verts[i * m->width + j].xyz, d2);
            CrossProduct(d1, d2, normal);
            if (Vec3Normalize(normal) > 0.001f)
            {
                VectorAdd(normal, sum, sum);
                VectorAdd(pt, m->verts[i * m->width + j].xyz, pt);
                count++;
            }

            VectorSubtract(m->verts[(i + 1) * m->width + j].xyz, m->verts[(i + 1) * m->width + j + 1].xyz, d1);
            VectorSubtract(m->verts[i * m->width + j + 1].xyz, m->verts[(i + 1) * m->width + j + 1].xyz, d2);
            CrossProduct(d1, d2, normal);
            if (Vec3Normalize(normal) > 0.001f)
            {
                VectorAdd(normal, sum, sum);
                VectorAdd(pt, m->verts[(i + 1) * m->width + j + 1].xyz, pt);
                count++;
            }
        }
    }

    if (Vec3Normalize(sum) < 0.001f)
        return 0;

    dist = (pt[2] * sum[2] + pt[1] * sum[1] + pt[0] * sum[0]) / (float)count;

    for (i = 0; i < m->width - 1; i++)
    {
        for (j = 0; j < m->height - 1; j++)
        {
            d = sum[0] * m->verts[j * m->width + i].xyz[0] + sum[1] * m->verts[j * m->width + i].xyz[1]
                + sum[2] * m->verts[j * m->width + i].xyz[2] - dist;
            if (d > 1.0f || d < -1.0f)
                return 0;
        }
    }

    if (plane)
    {
        plane[0] = sum[0];
        plane[1] = sum[1];
        plane[2] = sum[2];
        plane[3] = dist;
    }
    return 1;
}

void PutMeshOnCurve(mesh_t in)
{
    int i, j;
    drawVert_t prev, next;

    for (i = 0; i < in.width; i++)
    {
        for (j = 1; j < in.height; j += 2)
        {
            LerpDrawVert(&in.verts[j * in.width + i], &in.verts[(j + 1) * in.width + i], &prev);
            LerpDrawVert(&in.verts[j * in.width + i], &in.verts[(j - 1) * in.width + i], &next);
            LerpDrawVert(&prev, &next, &in.verts[j * in.width + i]);
        }
    }

    for (j = 0; j < in.height; j++)
    {
        for (i = 1; i < in.width; i += 2)
        {
            LerpDrawVert(&in.verts[j * in.width + i], &in.verts[j * in.width + i + 1], &prev);
            LerpDrawVert(&in.verts[j * in.width + i], &in.verts[j * in.width + i - 1], &next);
            LerpDrawVert(&prev, &next, &in.verts[j * in.width + i]);
        }
    }
}

mesh_t *SubdivideMesh(mesh_t in, float maxError, float minLength, int *originalWidths, int *originalHeights)
{
    int i, j, k, l;
    drawVert_t prev, next, mid;
    vec3_t prevxyz, nextxyz, midxyz;
    vec3_t delta;
    float len;
    mesh_t out;

    out.width = in.width;
    out.height = in.height;

    for (i = 0; i < in.width; i++)
    {
        for (j = 0; j < in.height; j++)
            expand[j][i] = in.verts[j * in.width + i];
    }

    if (originalHeights)
    {
        for (i = 0; i < in.height; i++)
            originalHeights[i] = i;
    }
    if (originalWidths)
    {
        for (i = 0; i < in.width; i++)
            originalWidths[i] = i;
    }

    // horizontal subdivisions
    for (j = 0; j + 2 < out.width; j += 2)
    {
        for (i = 0; i < out.height; i++)
        {
            for (l = 0; l < 3; l++)
            {
                prevxyz[l] = expand[i][j + 1].xyz[l] - expand[i][j].xyz[l];
                nextxyz[l] = expand[i][j + 2].xyz[l] - expand[i][j + 1].xyz[l];
                midxyz[l] = (expand[i][j].xyz[l] + expand[i][j + 1].xyz[l] * 2 + expand[i][j + 2].xyz[l]) * 0.25f;
            }

            if (VectorLength(*(vec3_s *)prevxyz) > minLength
                || VectorLength(*(vec3_s *)nextxyz) > minLength)
                break;

            VectorSubtract(expand[i][j + 1].xyz, midxyz, delta);
            len = VectorLength(*(vec3_s *)delta);
            if (len > maxError)
                break;
        }

        if (out.width + 2 >= MAX_EXPANDED_AXIS)
            break;

        if (i == out.height)
            continue;

        out.width += 2;

        if (originalWidths)
        {
            for (k = out.width - 1; k > j + 3; k--)
                originalWidths[k] = originalWidths[k - 2];
            originalWidths[j + 3] = originalWidths[j + 1];
            originalWidths[j + 2] = originalWidths[j + 1];
            originalWidths[j + 1] = originalWidths[j];
        }

        for (i = 0; i < out.height; i++)
        {
            LerpDrawVert(&expand[i][j], &expand[i][j + 1], &prev);
            LerpDrawVert(&expand[i][j + 1], &expand[i][j + 2], &next);
            LerpDrawVert(&prev, &next, &mid);

            for (k = out.width - 1; k > j + 3; k--)
                expand[i][k] = expand[i][k - 2];
            expand[i][j + 1] = prev;
            expand[i][j + 2] = mid;
            expand[i][j + 3] = next;
        }

        j -= 2;
    }

    // vertical subdivisions
    for (j = 0; j + 2 < out.height; j += 2)
    {
        for (i = 0; i < out.width; i++)
        {
            for (l = 0; l < 3; l++)
            {
                prevxyz[l] = expand[j + 1][i].xyz[l] - expand[j][i].xyz[l];
                nextxyz[l] = expand[j + 2][i].xyz[l] - expand[j + 1][i].xyz[l];
                midxyz[l] = (expand[j][i].xyz[l] + expand[j + 1][i].xyz[l] * 2 + expand[j + 2][i].xyz[l]) * 0.25f;
            }

            if (VectorLength(*(vec3_s *)prevxyz) > minLength
                || VectorLength(*(vec3_s *)nextxyz) > minLength)
                break;

            VectorSubtract(expand[j + 1][i].xyz, midxyz, delta);
            len = VectorLength(*(vec3_s *)delta);
            if (len > maxError)
                break;
        }

        if (out.height + 2 >= MAX_EXPANDED_AXIS)
            break;

        if (i == out.width)
            continue;

        out.height += 2;

        if (originalHeights)
        {
            for (k = out.height - 1; k > j + 3; k--)
                originalHeights[k] = originalHeights[k - 2];
            originalHeights[j + 3] = originalHeights[j + 1];
            originalHeights[j + 2] = originalHeights[j + 1];
            originalHeights[j + 1] = originalHeights[j];
        }

        for (i = 0; i < out.width; i++)
        {
            LerpDrawVert(&expand[j][i], &expand[j + 1][i], &prev);
            LerpDrawVert(&expand[j + 1][i], &expand[j + 2][i], &next);
            LerpDrawVert(&prev, &next, &mid);

            for (k = out.height - 1; k > j + 3; k--)
                expand[k][i] = expand[k - 2][i];
            expand[j + 1][i] = prev;
            expand[j + 2][i] = mid;
            expand[j + 3][i] = next;
        }

        j -= 2;
    }

    out.verts = &expand[0][0];
    for (i = 1; i < out.height; i++)
        memmove(&out.verts[i * out.width], expand[i], out.width * sizeof(drawVert_t));

    return CopyMesh(&out);
}

mesh_t *RemoveLinearMeshColumnsRows(mesh_t *in, int *originalWidths, int *originalHeights)
{
    int i, j, k;
    float len, maxLength;
    vec3_t proj;
    vec3_s dir;
    mesh_t out;

    out.width = in->width;
    out.height = in->height;

    for (i = 0; i < in->width; i++)
    {
        for (j = 0; j < in->height; j++)
            expand[j][i] = in->verts[j * in->width + i];
    }

    for (j = 1; j < out.width - 1; j++)
    {
        maxLength = 0;
        for (i = 0; i < out.height; i++)
        {
            ProjectPointOntoLine(expand[i][j].xyz, expand[i][j - 1].xyz, expand[i][j + 1].xyz, proj);
            VectorSubtract(expand[i][j].xyz, proj, dir.v);
            len = VectorLength(dir);
            if (len > maxLength)
                maxLength = len;
        }
        if (maxLength < 0.1)
        {
            out.width--;
            for (i = 0; i < out.height; i++)
            {
                for (k = j; k < out.width; k++)
                    expand[i][k] = expand[i][k + 1];
            }
            if (originalWidths)
            {
                for (k = j; k < out.width; k++)
                    originalWidths[k] = originalWidths[k + 1];
            }
            j--;
        }
    }
    for (j = 1; j < out.height - 1; j++)
    {
        maxLength = 0;
        for (i = 0; i < out.width; i++)
        {
            ProjectPointOntoLine(expand[j][i].xyz, expand[j - 1][i].xyz, expand[j + 1][i].xyz, proj);
            VectorSubtract(expand[j][i].xyz, proj, dir.v);
            len = VectorLength(dir);
            if (len > maxLength)
                maxLength = len;
        }
        if (maxLength < 0.1)
        {
            out.height--;
            for (i = 0; i < out.width; i++)
            {
                for (k = j; k < out.height; k++)
                    expand[k][i] = expand[k + 1][i];
            }
            if (originalHeights)
            {
                for (k = j; k < out.height; k++)
                    originalHeights[k] = originalHeights[k + 1];
            }
            j--;
        }
    }

    out.verts = &expand[0][0];
    for (i = 1; i < out.height; i++)
        memmove(&out.verts[i * out.width], expand[i], out.width * sizeof(drawVert_t));

    return CopyMesh(&out);
}

void LerpDrawVertAmount(drawVert_t *a, drawVert_t *b, float amount, drawVert_t *out)
{
    out->xyz[0] = a->xyz[0] + amount * (b->xyz[0] - a->xyz[0]);
    out->xyz[1] = a->xyz[1] + amount * (b->xyz[1] - a->xyz[1]);
    out->xyz[2] = a->xyz[2] + amount * (b->xyz[2] - a->xyz[2]);

    out->st[0] = a->st[0] + amount * (b->st[0] - a->st[0]);
    out->st[1] = a->st[1] + amount * (b->st[1] - a->st[1]);

    out->lightmap[0] = a->lightmap[0] + amount * (b->lightmap[0] - a->lightmap[0]);
    out->lightmap[1] = a->lightmap[1] + amount * (b->lightmap[1] - a->lightmap[1]);

    out->color[0] = a->color[0] + amount * (b->color[0] - a->color[0]);
    out->color[1] = a->color[1] + amount * (b->color[1] - a->color[1]);
    out->color[2] = a->color[2] + amount * (b->color[2] - a->color[2]);
    out->color[3] = a->color[3] + amount * (b->color[3] - a->color[3]);

    out->normal[0] = a->normal[0] + amount * (b->normal[0] - a->normal[0]);
    out->normal[1] = a->normal[1] + amount * (b->normal[1] - a->normal[1]);
    out->normal[2] = a->normal[2] + amount * (b->normal[2] - a->normal[2]);
    Vec3Normalize(out->normal);
}

mesh_t *SubdivideMeshQuads(mesh_t *in, float minLength, int maxsize, int widthtable[], int heighttable[], int originalWidths[], int originalHeights[])
{
    int i, j, k, w, h, maxsubdivisions, subdivisions;
    vec3_s dir;
    float length, maxLength, amount;
    mesh_t out;

    out.width = in->width;
    out.height = in->height;

    for (i = 0; i < in->width; i++)
    {
        for (j = 0; j < in->height; j++)
            expand[j][i] = in->verts[j * in->width + i];
    }

    if (maxsize > MAX_EXPANDED_AXIS)
        Error("SubdivideMeshQuads: maxsize > MAX_EXPANDED_AXIS");

    maxsubdivisions = (maxsize - in->width) / (in->width - 1);

    for (w = 0, j = 0; w < in->width - 1; w++, j += subdivisions + 1)
    {
        maxLength = 0;
        for (i = 0; i < out.height; i++)
        {
            VectorSubtract(expand[i][j + 1].xyz, expand[i][j].xyz, dir.v);
            length = VectorLength(dir);
            if (length > maxLength)
                maxLength = length;
        }

        subdivisions = (int)(maxLength / minLength);
        if (subdivisions > maxsubdivisions)
            subdivisions = maxsubdivisions;

        widthtable[w] = subdivisions + 1;
        if (subdivisions <= 0)
            continue;

        out.width += subdivisions;

        if (originalWidths)
        {
            for (k = out.width - 1; k >= j + subdivisions; k--)
                originalWidths[k] = originalWidths[k - subdivisions];
            for (k = 1; k <= subdivisions; k++)
                originalWidths[j + k] = originalWidths[j];
        }

        for (i = 0; i < out.height; i++)
        {
            for (k = out.width - 1; k > j + subdivisions; k--)
                expand[i][k] = expand[i][k - subdivisions];
            for (k = 1; k <= subdivisions; k++)
            {
                amount = (float)k / (subdivisions + 1);
                LerpDrawVertAmount(&expand[i][j], &expand[i][j + subdivisions + 1], amount, &expand[i][j + k]);
            }
        }
    }

    maxsubdivisions = (maxsize - in->height) / (in->height - 1);

    for (h = 0, j = 0; h < in->height - 1; h++, j += subdivisions + 1)
    {
        maxLength = 0;
        for (i = 0; i < out.width; i++)
        {
            VectorSubtract(expand[j + 1][i].xyz, expand[j][i].xyz, dir.v);
            length = VectorLength(dir);
            if (length > maxLength)
                maxLength = length;
        }

        subdivisions = (int)(maxLength / minLength);
        if (subdivisions > maxsubdivisions)
            subdivisions = maxsubdivisions;

        heighttable[h] = subdivisions + 1;
        if (subdivisions <= 0)
            continue;

        out.height += subdivisions;

        if (originalHeights)
        {
            for (k = out.height - 1; k >= j + subdivisions; k--)
                originalHeights[k] = originalHeights[k - subdivisions];
            for (k = 1; k <= subdivisions; k++)
                originalHeights[j + k] = originalHeights[j];
        }

        for (i = 0; i < out.width; i++)
        {
            for (k = out.height - 1; k > j + subdivisions; k--)
                expand[k][i] = expand[k - subdivisions][i];
            for (k = 1; k <= subdivisions; k++)
            {
                amount = (float)k / (subdivisions + 1);
                LerpDrawVertAmount(&expand[j][i], &expand[j + subdivisions + 1][i], amount, &expand[j + k][i]);
            }
        }
    }

    out.verts = &expand[0][0];
    for (i = 1; i < out.height; i++)
        memmove(&out.verts[i * out.width], expand[i], out.width * sizeof(drawVert_t));

    return CopyMesh(&out);
}
