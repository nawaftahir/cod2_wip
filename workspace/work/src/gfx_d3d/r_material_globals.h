// Shared material table ownership.
#pragma once

struct MaterialGlobals
{
    int vertexDeclCount;
    MaterialVertexDeclaration vertexDecls[32];
    int pad304;
    MaterialTechniqueSet *techSetTable[1024];
    int techniqueCount;
    MaterialTechnique *techniqueTable[1024];
    int literalCount;
    float literals[16][4];
    int stateMapCount;
    MaterialStateMap *stateMapTable[32];
    int stringIdentCount;
    const char *stringIdentTable[64];
    int shaderCount;
    MaterialShader *shaderTable[256];
};

extern MaterialGlobals materialGlobals;
