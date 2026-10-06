#ifndef CODEX_SHADER_HELPER_VIEWS_H
#define CODEX_SHADER_HELPER_VIEWS_H
namespace D3DXShader
{
// Binary-confirmed access records, not SDK allocation-size declarations.
class CPool
{
public:
    const char *name;
    unsigned long flags;
    unsigned word8, wordC, word10, word14, word18, word1C;
    unsigned word20, word24, word28, word2C, word30;
    long Initialize(const char *, unsigned long, unsigned, unsigned);
    long Initialize(CPool *);
};
class CArgument
{
public:
    unsigned flags, pool, relative, index;
    unsigned opaque10[8];
    unsigned remap;
};
class CInstruction
{
public:
    unsigned long token;
    unsigned inputCount;
    unsigned *inputs;
    unsigned outputCount;
    unsigned *outputs;
};
class CShaderProgram
{
public:
    unsigned opaque0, poolCount, argumentCount, instructionCount;
    CPool **pools;
    CArgument **arguments;
protected:
    long SwapRegisters(unsigned, unsigned, unsigned);
};
class CTReorderInstructions
{
public:
    unsigned opaque0[15];
    unsigned *instructions;
protected:
    void ReverseInsts(unsigned, unsigned);
};
class CPSLegacyProgram
{
public:
    unsigned opaque4[9];
    union
    {
        unsigned caps[19];
        struct
        {
            unsigned words[17];
            unsigned low : 17;
            unsigned version101 : 1;
            unsigned high : 14;
            unsigned last;
        } capFields;
    };
    unsigned opaque74[21];
    unsigned version, flags;
    unsigned opaqueD0[14];
    unsigned originalVersion;
protected:
    virtual long InitCaps();
};
int __stdcall IsValidWriteMask(unsigned *, unsigned long);
int __stdcall IsValidDotWriteMask(unsigned *, unsigned long);
void __stdcall ExchangeRow(CInstruction *, unsigned);
}
#endif
