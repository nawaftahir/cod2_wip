#include <stdarg.h>
#include <stdio.h>
#include "../../src/codex_shader_support/support.h"
#define COMPILER_DECLARATIONS_ONLY
#include "../codex35_compiler/compiler.cpp"

namespace D3DXShader
{
// PINNED access prefix: compiler input's diagnostic object is at +18h.
struct CompilerInputErrors
{
    unsigned opaque0[6];
    CTErrors errors;
};

long __cdecl CCompiler::Error(CNode *node, unsigned code, const char *format, ...)
{
    char text[256];
    va_list arguments;
    va_start(arguments, format);
    opaqueC[16] = 1;
    _vsnprintf(text, sizeof(text), format, arguments);
    text[255] = 0;
    ((CompilerInputErrors *)opaque0)->errors.Error(GetToken(node), code, "%s", text);
    va_end(arguments);
    return 0;
}

unsigned CCompiler::GetTypeFlags(CNode *node, unsigned long *flags)
{
    unsigned count, i;
    unsigned long value;
    if (!node) return 0;
    count = 0;
    switch (node->kind)
    {
    case 1:
        while (node && node->kind == 1)
        {
            count += GetTypeFlags(node->child, flags + count);
            node = node->next;
        }
        if (node) count += GetTypeFlags(node, flags + count);
        break;
    case 6:
        count = GetTypeFlags(((CNodeDecl *)node)->field18, flags);
        break;
    case 8:
        for (i = 0; i < ((CNodeArray *)node)->field14; ++i)
        {
            count += GetTypeFlags(((CNodeArray *)node)->field10, flags + count);
        }
        break;
    case 9:
        {
            CNodeType *type = (CNodeType *)node;
            count = type->rows * type->columns;
            value = 0;
            switch (type->component)
            {
            case 0: value = 0x17; break;
            case 1: case 5: value = 2; break;
            case 2: case 6: value = 0x02000002; break;
            case 3: case 7: value = 0x04000002; break;
            case 4: case 8: value = 0x08000002; break;
            case 10: value = 0x02000000; break;
            case 11: value = 0x04000000; break;
            case 12: value = 0x08000000; break;
            }
            if (opaqueC[2] & 0x20)
            {
                value &= 0xf3ffffff;
                value |= 0x02000000;
            }
            for (i = 0; i < count; ++i) flags[i] = value;
        }
        break;
    case 11:
        count = GetTypeFlags(((CNodeVariable *)node)->field20, flags);
        break;
    default:
        Error(0, 0, "internal error: unknown node");
        break;
    }
    return count;
}
}
