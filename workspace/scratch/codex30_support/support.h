#ifndef CODEX_SHADER_SUPPORT_H
#define CODEX_SHADER_SUPPORT_H
#include <d3dx9.h>

namespace D3DXCore
{
class CBuffer
{
public:
    static long __stdcall Create(unsigned long bytes, CBuffer **buffer);
};
}
namespace D3DXShader
{
struct D3DXTOKEN;
struct ErrorChunk
{
    ErrorChunk *next;
    char text[1];
};
class CTErrors
{
    // PINNED: eight-word layout, ctor plus all diagnostic access sites.
    ErrorChunk *head;
    unsigned bytes, errorCount, warningCount, warningLevel, specifierCount;
    unsigned *codes, *flags;
protected:
    long Push(unsigned code, unsigned *index);
public:
    CTErrors();
    ~CTErrors();
    long Clear();
    long PreformattedError(const char *text);
    long GetErrorBuffer(ID3DXBuffer **out);
    long SetWarningLevel(unsigned level);
    long SetWarningSpecifier(unsigned code, unsigned value);
    unsigned GetErrorCount();
    unsigned GetWarningCount();
    long __cdecl Error(D3DXTOKEN *token, unsigned code, const char *format, ...);
    long __cdecl Warning(D3DXTOKEN *token, unsigned code, const char *format, ...);
};
}
#endif
