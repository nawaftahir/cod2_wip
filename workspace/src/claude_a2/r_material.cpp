// Material globals and vertex declarations.
#include "a2_d3d.h"

struct stream_source_info_t
{
    byte Stream;
    byte Offset;
    byte Type;
};

struct stream_dest_info_t
{
    byte Usage;
    byte UsageIndex;
};

struct MaterialStreamRouting
{
    byte source;
    byte dest;
};

struct MaterialVertexDeclaration
{
    MaterialStreamRouting *routingData;
    int streamCount;
    IDirect3DVertexDeclaration9 *decl[4];
};

// Only the leading fields are reconstructed.
struct MaterialGlobals
{
    int vertexDeclCount;
    MaterialVertexDeclaration vertexDecls[32];
};

MaterialGlobals materialGlobals;

static const stream_source_info_t s_streamSourceInfo[4][7] =
{
    {
        { 0, 0, D3DDECLTYPE_FLOAT4 },
        { 0, 16, D3DDECLTYPE_FLOAT3 },
        { 0, 28, D3DDECLTYPE_D3DCOLOR },
        { 0, 32, D3DDECLTYPE_FLOAT2 },
        { 255, 0, 0 },
        { 0, 40, D3DDECLTYPE_FLOAT3 },
        { 0, 52, D3DDECLTYPE_FLOAT3 },
    },
    {
        { 0, 0, D3DDECLTYPE_FLOAT3 },
        { 0, 12, D3DDECLTYPE_FLOAT3 },
        { 0, 24, D3DDECLTYPE_D3DCOLOR },
        { 0, 28, D3DDECLTYPE_FLOAT2 },
        { 0, 36, D3DDECLTYPE_FLOAT2 },
        { 0, 44, D3DDECLTYPE_FLOAT3 },
        { 0, 56, D3DDECLTYPE_FLOAT3 },
    },
    {
        { 0, 0, D3DDECLTYPE_FLOAT3 },
        { 255, 0, 0 },
        { 255, 0, 0 },
        { 0, 12, D3DDECLTYPE_FLOAT2 },
        { 255, 0, 0 },
        { 255, 0, 0 },
        { 255, 0, 0 },
    },
    {
        { 0, 0, D3DDECLTYPE_FLOAT3 },
        { 0, 12, D3DDECLTYPE_FLOAT3 },
        { 0, 24, D3DDECLTYPE_D3DCOLOR },
        { 0, 28, D3DDECLTYPE_FLOAT2 },
        { 0, 36, D3DDECLTYPE_SHORT2 },
        { 0, 40, D3DDECLTYPE_FLOAT3 },
        { 0, 52, D3DDECLTYPE_FLOAT3 },
    },
};

static const stream_dest_info_t s_streamDestInfo[12] =
{
    { D3DDECLUSAGE_POSITION, 0 },
    { D3DDECLUSAGE_NORMAL, 0 },
    { D3DDECLUSAGE_COLOR, 0 },
    { D3DDECLUSAGE_COLOR, 1 },
    { D3DDECLUSAGE_TEXCOORD, 0 },
    { D3DDECLUSAGE_TEXCOORD, 1 },
    { D3DDECLUSAGE_TEXCOORD, 2 },
    { D3DDECLUSAGE_TEXCOORD, 3 },
    { D3DDECLUSAGE_TEXCOORD, 4 },
    { D3DDECLUSAGE_TEXCOORD, 5 },
    { D3DDECLUSAGE_TEXCOORD, 6 },
    { D3DDECLUSAGE_TEXCOORD, 7 },
};

static IDirect3DVertexDeclaration9 *Material_BuildVertexDecl(const MaterialStreamRouting *routingData, int streamCount, const stream_source_info_t *sourceTable)
{
    D3DVERTEXELEMENT9 declEnd;
    D3DVERTEXELEMENT9 elemTable[256];
    IDirect3DVertexDeclaration9 *decl;
    const stream_source_info_t *sourceInfo;
    const stream_dest_info_t *destInfo;
    int elemIndex;
    int elemIndexInsert;

    decl = 0;
    declEnd.Stream = 255;
    declEnd.Offset = 0;
    declEnd.Type = D3DDECLTYPE_UNUSED;
    declEnd.Method = 0;
    declEnd.Usage = 0;
    declEnd.UsageIndex = 0;
    elemIndex = 0;
    while (streamCount)
    {
        sourceInfo = &sourceTable[routingData->source];
        if (sourceInfo->Stream == 255)
            return 0;
        destInfo = &s_streamDestInfo[routingData->dest];
        for (elemIndexInsert = elemIndex; elemIndexInsert > 0 && elemTable[elemIndexInsert - 1].Stream > sourceInfo->Stream; --elemIndexInsert)
            elemTable[elemIndexInsert] = elemTable[elemIndexInsert - 1];
        elemTable[elemIndexInsert].Stream = sourceInfo->Stream;
        elemTable[elemIndexInsert].Offset = sourceInfo->Offset;
        elemTable[elemIndexInsert].Type = sourceInfo->Type;
        elemTable[elemIndexInsert].Method = 0;
        elemTable[elemIndexInsert].Usage = destInfo->Usage;
        elemTable[elemIndexInsert].UsageIndex = destInfo->UsageIndex;
        ++elemIndex;
        ++routingData;
        --streamCount;
    }
    elemTable[elemIndex] = declEnd;
    do
    {
        RB_LogPrint("dx.device->CreateVertexDeclaration( elemTable, &decl )\n");
        dx.device->CreateVertexDeclaration(elemTable, &decl);
    } while (alwaysfails);
    return decl;
}

void Material_ReloadAll()
{
    int vertDeclIndex;
    int vertDeclType;

    for (vertDeclIndex = 0; vertDeclIndex < 32; ++vertDeclIndex)
    {
        if (materialGlobals.vertexDecls[vertDeclIndex].routingData)
        {
            for (vertDeclType = 0; vertDeclType < 4; ++vertDeclType)
                materialGlobals.vertexDecls[vertDeclIndex].decl[vertDeclType] = Material_BuildVertexDecl(materialGlobals.vertexDecls[vertDeclIndex].routingData, materialGlobals.vertexDecls[vertDeclIndex].streamCount, s_streamSourceInfo[vertDeclType]);
        }
    }
}
