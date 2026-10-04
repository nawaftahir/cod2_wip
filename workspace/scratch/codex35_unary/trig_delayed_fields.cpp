#include "trig.h"

namespace D3DXShader
{
#ifdef GROUP_TEMP
long CCompiler::EmitTemp(unsigned *out, unsigned count)
{
    for (unsigned i = 0; i < count; ++i)
    {
        out[i] = ~0u;
    }
    return 0;
}
#endif

#define TRY(expression) do { result = (expression); if (result < 0) goto cleanup; } while (0)

// PINNED SDK73/65 and retail1006edd4; access views are declared in trig.h.
long CCompiler::EmitSinCos(CNode *node, unsigned *input, unsigned *sine,
    unsigned *cosine, unsigned count)
{
    unsigned *allocation = 0;
    unsigned uniform = 1;
    unsigned i;
    long result;
    for (i = 1; i < count; ++i)
    {
        if (input[i] != input[0])
        {
            uniform = 0;
            break;
        }
    }
    unsigned long flags = program->opaque1c[20];
    if (flags & 0x200)
    {
        if (sine)
        {
            TRY(EmitInst(node, (count & 0xfffff) | 0x10800000,
                sine, input, 0, 0x10));
        }
        if (cosine)
        {
            TRY(EmitInst(node, (count & 0xfffff) | 0x10900000,
                cosine, input, 0, 0x10));
        }
    }
    else if ((flags & 0x100) && uniform)
    {
        unsigned inversePeriod = program->AddArgument(program->opaque78, 0, 0,
            0.15915493866300567);
        unsigned half = program->AddArgument(program->opaque78, 0, 0, 0.5);
        unsigned period = program->AddArgument(program->opaque78, 0, 0,
            6.2831854820251465);
        unsigned minusPi = program->AddArgument(program->opaque78, 0, 0,
            -3.1415927410125732);
        _D3DXRANGE range;
        TRY(EvalRange(input[0], &range));
        unsigned reduced[5];
        if (range.minimum < -3.1415927410125732 ||
            range.maximum > 3.1415927410125732)
        {
            for (i = 0; i < 5; ++i)
            {
                reduced[i] = ~0u;
            }
            TRY(EmitInst(node, 0x20500001, reduced, input, &inversePeriod, 0));
            TRY(EmitInst(node, 0x20400001, reduced + 1, reduced, &half, 0));
            TRY(EmitInst(node, 0x10400001, reduced + 2, reduced + 1, 0, 0x14));
            TRY(EmitInst(node, 0x20500001, reduced + 3, reduced + 2, &period, 4));
            TRY(EmitInst(node, 0x20400001, reduced + 4, reduced + 3, &minusPi, 0));
        }
        else
        {
            reduced[4] = input[0];
        }
        unsigned pair[4], angles[4];
        for (i = 0; i < 4; ++i)
        {
            pair[i] = ~0u;
        }
        for (i = 0; i < 4; ++i)
        {
            angles[i] = reduced[4];
        }
        TRY(EmitInst(node, 0x50300004, pair, angles, 0, 0x10));
        if (cosine)
        {
            for (i = 0; i < count; ++i)
            {
                cosine[i] = pair[0];
            }
        }
        if (sine)
        {
            for (i = 0; i < count; ++i)
            {
                sine[i] = pair[1];
            }
        }
    }
    else
    {
        unsigned sineCount = sine ? count : 0;
        unsigned cosineCount = cosine ? count : 0;
        unsigned total = sineCount + cosineCount;
        unsigned inversePeriod = program->AddArgument(program->opaque78, 0, 0,
            0.15915493866300567);
        unsigned quarter = program->AddArgument(program->opaque78, 0, 0, 0.25);
        unsigned half = program->AddArgument(program->opaque78, 0, 0, 0.5);
        unsigned period = program->AddArgument(program->opaque78, 0, 0,
            6.2831854820251465);
        unsigned minusPi = program->AddArgument(program->opaque78, 0, 0,
            -3.1415927410125732);
        unsigned coefficient5 = program->AddArgument(program->opaque78, 0, 0,
            -2.5239851768993087e-07);
        unsigned coefficient4 = program->AddArgument(program->opaque78, 0, 0,
            2.47609e-05);
        unsigned coefficient3 = program->AddArgument(program->opaque78, 0, 0,
            -0.0013888397);
        unsigned coefficient2 = program->AddArgument(program->opaque78, 0, 0,
            0.0416666418);
        unsigned coefficient1 = program->AddArgument(program->opaque78, 0, 0,
            -0.4999999963);
        allocation = static_cast<unsigned *>(::operator new(total * 108));
        if (!allocation)
        {
            result = static_cast<long>(0x8007000eu);
            goto cleanup;
        }
        unsigned *temporary[27];
        unsigned *cursor = allocation;
        for (unsigned k = 0; k < 27;)
        {
            temporary[k++] = cursor;
            cursor += total;
        }
        for (unsigned k = 0; k < 15; ++k)
        {
            TRY(EmitTemp(temporary[k], total));
        }
        for (i = 0; i < total; ++i)
        {
            temporary[15][i] = i < sineCount ? sine[i] : cosine[i - sineCount];
            temporary[16][i] = inversePeriod;
            temporary[17][i] = i < sineCount ? quarter : half;
            temporary[18][i] = period;
            temporary[19][i] = minusPi;
            temporary[20][i] = coefficient5;
            temporary[21][i] = coefficient4;
            temporary[22][i] = coefficient3;
            temporary[23][i] = coefficient2;
            temporary[24][i] = coefficient1;
            temporary[25][i] = opaqueC[5];
            temporary[26][i] = i < sineCount ? input[i] : input[i - sineCount];
        }
        unsigned token = total & 0xfffff;
        union InstructionToken
        {
            unsigned value;
            struct { unsigned count : 20; unsigned opcode : 12; } fields;
        };
        InstructionToken multiplyToken;
        multiplyToken.value = token;
        multiplyToken.fields.opcode = 0x205;
        TRY(EmitInst(node, multiplyToken.value, temporary[0], temporary[26], temporary[16], 0));
        unsigned add = token | 0x20400000;
        TRY(EmitInst(node, add, temporary[1], temporary[0], temporary[17], 0));
        TRY(EmitInst(node, token | 0x10400000, temporary[2], temporary[1], 0, 0x14));
        TRY(EmitInst(node, multiplyToken.value, temporary[3], temporary[2], temporary[18], 4));
        TRY(EmitInst(node, add, temporary[4], temporary[3], temporary[19], 0));
        TRY(EmitInst(node, multiplyToken.value, temporary[5], temporary[4], temporary[4], 4));
        TRY(EmitInst(node, multiplyToken.value, temporary[6], temporary[5], temporary[20], 0));
        TRY(EmitInst(node, add, temporary[7], temporary[6], temporary[21], 0));
        TRY(EmitInst(node, multiplyToken.value, temporary[8], temporary[5], temporary[7], 0));
        TRY(EmitInst(node, add, temporary[9], temporary[8], temporary[22], 0));
        TRY(EmitInst(node, multiplyToken.value, temporary[10], temporary[5], temporary[9], 0));
        TRY(EmitInst(node, add, temporary[11], temporary[10], temporary[23], 0));
        TRY(EmitInst(node, multiplyToken.value, temporary[12], temporary[5], temporary[11], 0));
        TRY(EmitInst(node, add, temporary[13], temporary[12], temporary[24], 0));
        TRY(EmitInst(node, multiplyToken.value, temporary[14], temporary[5], temporary[13], 0));
        TRY(EmitInst(node, add, temporary[15], temporary[14], temporary[25], 0x10));
        memcpy(sine, temporary[15], sineCount * sizeof(unsigned));
        memcpy(cosine, temporary[15] + sineCount, cosineCount * sizeof(unsigned));
    }
    result = 0;
cleanup:
    ::operator delete(allocation);
    return result;
}

#undef TRY
}
