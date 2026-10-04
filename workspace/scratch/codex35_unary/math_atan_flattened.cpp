#include "math.h"
#pragma intrinsic(fabs)

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
        TRY(EmitInst(node, token | 0x20500000, temporary[0], temporary[26], temporary[16], 0));
        TRY(EmitInst(node, token | 0x20400000, temporary[1], temporary[0], temporary[17], 0));
        TRY(EmitInst(node, token | 0x10400000, temporary[2], temporary[1], 0, 0x14));
        TRY(EmitInst(node, token | 0x20500000, temporary[3], temporary[2], temporary[18], 4));
        TRY(EmitInst(node, token | 0x20400000, temporary[4], temporary[3], temporary[19], 0));
        TRY(EmitInst(node, token | 0x20500000, temporary[5], temporary[4], temporary[4], 4));
        TRY(EmitInst(node, token | 0x20500000, temporary[6], temporary[5], temporary[20], 0));
        TRY(EmitInst(node, token | 0x20400000, temporary[7], temporary[6], temporary[21], 0));
        TRY(EmitInst(node, token | 0x20500000, temporary[8], temporary[5], temporary[7], 0));
        TRY(EmitInst(node, token | 0x20400000, temporary[9], temporary[8], temporary[22], 0));
        TRY(EmitInst(node, token | 0x20500000, temporary[10], temporary[5], temporary[9], 0));
        TRY(EmitInst(node, token | 0x20400000, temporary[11], temporary[10], temporary[23], 0));
        TRY(EmitInst(node, token | 0x20500000, temporary[12], temporary[5], temporary[11], 0));
        TRY(EmitInst(node, token | 0x20400000, temporary[13], temporary[12], temporary[24], 0));
        TRY(EmitInst(node, token | 0x20500000, temporary[14], temporary[5], temporary[13], 0));
        TRY(EmitInst(node, token | 0x20400000, temporary[15], temporary[14], temporary[25], 0x10));
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

namespace D3DXShader
{
#define TRY(expression) do { result = (expression); if (result < 0) goto cleanup; } while (0)

long CCompiler::EmitPow(CNode *node, unsigned *out, unsigned *base,
    unsigned *exponent, unsigned count)
{
    unsigned *allocation = 0;
    unsigned allZero = 1, allOne = 1;
    unsigned i;
    long result;
    double value;
    for (i = 0; i < count; ++i)
    {
        if (EvalValue(base[i], &value) < 0)
        {
            break;
        }
        if (value != 0.0)
        {
            allZero = 0;
        }
        if (value != 1.0)
        {
            allOne = 0;
        }
    }
    if (i == count && (allZero || allOne))
    {
        allocation = static_cast<unsigned *>(::operator new(count * sizeof(unsigned)));
        if (!allocation)
        {
            goto memory;
        }
        for (i = 0; i < count; ++i)
        {
            allocation[i] = allZero ? opaqueC[6] : opaqueC[5];
        }
        TRY(EmitTemp(out, count));
        TRY(EmitInst(node, (count & 0xfffff) | 0x10000000, out, allocation, 0, 0));
        goto success;
    }
    for (i = 1; i < count; ++i)
    {
        if (exponent[i] != exponent[0])
        {
            break;
        }
    }
    if (i == count && EvalValue(exponent[0], &value) >= 0)
    {
        int power = static_cast<int>(value);
        if (fabs(value - static_cast<double>(power)) < 1e-6)
        {
            unsigned sign = static_cast<unsigned>(power >> 31);
            unsigned magnitude = (static_cast<unsigned>(power) ^ sign) - sign;
            unsigned bitCount = 0, setBits = 0;
            for (unsigned bits = magnitude; bits; bits >>= 1)
            {
                ++bitCount;
                setBits += bits & 1;
            }
            unsigned cost = (setBits ? setBits - 1 : 0) +
                (bitCount ? bitCount - 1 : 0);
            if (power < 0)
            {
                cost += count;
            }
            unsigned limit;
            if ((program->opaque1c[20] & 0x40) && (opaqueC[2] & 0x20))
            {
                limit = count;
            }
            else
            {
                unsigned factor = program->opaque1c[18];
                if (!factor)
                {
                    factor = 1;
                }
                limit = factor * count * 2;
            }
            if (cost <= limit + 1)
            {
                allocation = static_cast<unsigned *>(::operator new(count * sizeof(unsigned)));
                if (!allocation)
                {
                    goto memory;
                }
                for (i = 0; i < count; ++i)
                {
                    allocation[i] = opaqueC[5];
                }
                TRY(EmitTemp(out, count));
                unsigned token = count & 0xfffff;
                TRY(EmitInst(node, token | 0x10000000, out, allocation, 0, 0));
                if (magnitude)
                {
                    TRY(EmitTemp(allocation, count));
                    TRY(EmitInst(node, token | 0x10000000, allocation, base, 0, 0));
                    for (;;)
                    {
                        if (magnitude & 1)
                        {
                            TRY(EmitInst(node, token | 0x20500000, out, out, allocation, 0));
                        }
                        magnitude >>= 1;
                        if (!magnitude)
                        {
                            break;
                        }
                        TRY(EmitInst(node, token | 0x20500000, allocation, allocation, allocation, 4));
                    }
                }
                if (power < 0)
                {
                    TRY(EmitInst(node, token | 0x10300000, out, out, 0, 0));
                }
                goto success;
            }
        }
        else if (fabs(fabs(value) - 0.5) < 1e-6)
        {
            TRY(EmitTemp(out, count));
            TRY(EmitInst(node, (count & 0xfffff) | 0x10700000, out, base, 0, 4));
            if (value >= 0.0)
            {
                TRY(EmitInst(node, (count & 0xfffff) | 0x10300000, out, out, 0, 4));
            }
            goto success;
        }
    }
    {
        allocation = static_cast<unsigned *>(::operator new(count * 8));
        if (!allocation)
        {
            goto memory;
        }
        unsigned *temporary[2], *cursor = allocation;
        for (i = 0; i < 2;)
        {
            temporary[i++] = cursor;
            cursor += count;
        }
        TRY(EmitTemp(temporary[0], count));
        TRY(EmitTemp(temporary[1], count));
        TRY(EmitTemp(out, count));
        unsigned token = count & 0xfffff;
        TRY(EmitInst(node, token | 0x10600000, temporary[0], base, 0, 0));
        TRY(EmitInst(node, token | 0x20500000, temporary[1], exponent, temporary[0], 0));
        TRY(EmitInst(node, token | 0x10500000, out, temporary[1], 0, 4));
    }
success:
    result = 0;
    goto cleanup;
memory:
    result = static_cast<long>(0x8007000eu);
cleanup:
    ::operator delete(allocation);
    return result;
}

long CCompiler::EmitATan2(CNode *node, unsigned *y, unsigned *x,
    unsigned *out, unsigned count)
{
    unsigned *allocation = 0;
    unsigned *temporary[48];
    long result;
    if (program->opaque1c[20] & 0x200)
    {
        if (x)
        {
            TRY(EmitInst(node, (count & 0xfffff) | 0x20600000, out, y, x, 0));
        }
        else
        {
            TRY(EmitInst(node, (count & 0xfffff) | 0x10c00000, out, y, 0, 0));
        }
        result = 0;
        goto cleanup;
    }
    else
    {
        unsigned coefficient0 = program->AddArgument(program->opaque78, 0, 0, 0.0208351);
        unsigned coefficient1 = program->AddArgument(program->opaque78, 0, 0, -0.085133);
        unsigned coefficient2 = program->AddArgument(program->opaque78, 0, 0, 0.180141);
        unsigned coefficient3 = program->AddArgument(program->opaque78, 0, 0, -0.3302995);
        unsigned coefficient4 = program->AddArgument(program->opaque78, 0, 0, 0.999866);
        unsigned minusTwo = program->AddArgument(program->opaque78, 0, 0, -2.0);
        unsigned halfPi = program->AddArgument(program->opaque78, 0, 0, 1.5707963705062866);
        unsigned minusPi = program->AddArgument(program->opaque78, 0, 0, -3.1415927410125732);
        allocation = static_cast<unsigned *>(::operator new(count * 192));
        if (!allocation)
        {
            result = static_cast<long>(0x8007000eu);
            goto cleanup;
        }
        unsigned *cursor = allocation;
        unsigned i;
        for (i = 0; i < 48;)
        {
            temporary[i++] = cursor;
            cursor += count;
        }
        for (i = 0; i < 39; ++i)
        {
            TRY(EmitTemp(temporary[i], count));
        }
        for (i = 0; i < count; ++i)
        {
            temporary[39][i] = coefficient0;
            temporary[40][i] = coefficient1;
            temporary[41][i] = coefficient2;
            temporary[42][i] = coefficient3;
            temporary[43][i] = coefficient4;
            temporary[44][i] = minusTwo;
            temporary[45][i] = halfPi;
            temporary[46][i] = minusPi;
            temporary[47][i] = opaqueC[5];
        }
        if (!x)
        {
            x = temporary[47];
        }
        unsigned width = count & 0xfffff;
        unsigned negate = width | 0x10100000;
        TRY(EmitInst(node, negate, temporary[0], y, 0, 0));
        unsigned maximum = width | 0x20100000;
        TRY(EmitInst(node, maximum, temporary[1], y, temporary[0], 4));
        TRY(EmitInst(node, negate, temporary[2], x, 0, 0));
        TRY(EmitInst(node, maximum, temporary[3], x, temporary[2], 4));
        unsigned minimum = width | 0x20000000;
        TRY(EmitInst(node, minimum, temporary[4], temporary[1], temporary[3], 4));
        TRY(EmitInst(node, maximum, temporary[5], temporary[1], temporary[3], 4));
        TRY(EmitInst(node, width | 0x10300000, temporary[6], temporary[5], 0, 4));
        unsigned multiply = width | 0x20500000;
        TRY(EmitInst(node, multiply, temporary[7], temporary[4], temporary[6], 0x14));
        TRY(EmitInst(node, multiply, temporary[8], temporary[7], temporary[7], 0x14));
        TRY(EmitInst(node, multiply, temporary[9], temporary[8], temporary[39], 0));
        unsigned add = width | 0x20400000;
        TRY(EmitInst(node, add, temporary[10], temporary[9], temporary[40], 0));
        TRY(EmitInst(node, multiply, temporary[11], temporary[8], temporary[10], 0));
        TRY(EmitInst(node, add, temporary[12], temporary[11], temporary[41], 0));
        TRY(EmitInst(node, multiply, temporary[13], temporary[8], temporary[12], 0));
        TRY(EmitInst(node, add, temporary[14], temporary[13], temporary[42], 0));
        TRY(EmitInst(node, multiply, temporary[15], temporary[8], temporary[14], 0));
        TRY(EmitInst(node, add, temporary[16], temporary[15], temporary[43], 0));
        TRY(EmitInst(node, multiply, temporary[17], temporary[7], temporary[16], 0));
        unsigned less = width | 0x20200000;
        TRY(EmitInst(node, less, temporary[18], temporary[3], temporary[1], 0x17));
        TRY(EmitInst(node, multiply, temporary[19], temporary[17], temporary[44], 0));
        TRY(EmitInst(node, add, temporary[20], temporary[19], temporary[45], 0));
        TRY(EmitInst(node, multiply, temporary[21], temporary[20], temporary[18], 0));
        TRY(EmitInst(node, add, temporary[22], temporary[21], temporary[17], 0));
        TRY(EmitInst(node, less, temporary[26], x, temporary[2], 0x17));
        TRY(EmitInst(node, multiply, temporary[27], temporary[26], temporary[46], 0));
        TRY(EmitInst(node, add, temporary[28], temporary[22], temporary[27], 0));
        TRY(EmitInst(node, minimum, temporary[29], y, x, 0));
        TRY(EmitInst(node, maximum, temporary[30], y, x, 0));
        TRY(EmitInst(node, negate, temporary[31], temporary[29], 0, 0));
        TRY(EmitInst(node, less, temporary[32], temporary[29], temporary[31], 0x17));
        TRY(EmitInst(node, negate, temporary[33], temporary[30], 0, 0));
        TRY(EmitInst(node, width | 0x20300000, temporary[34], temporary[30], temporary[33], 0x17));
        TRY(EmitInst(node, multiply, temporary[35], temporary[32], temporary[34], 0x17));
        TRY(EmitInst(node, add, temporary[36], temporary[28], temporary[28], 0));
        TRY(EmitInst(node, negate, temporary[37], temporary[36], 0, 0));
        TRY(EmitInst(node, multiply, temporary[38], temporary[35], temporary[37], 0));
        TRY(EmitInst(node, add, out, temporary[28], temporary[38], 0));
    }
    result = 0;
cleanup:
    ::operator delete(allocation);
    return result;
}

#undef TRY
}
