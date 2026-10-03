#include <new>
#include <string.h>
#include <math.h>
#pragma intrinsic(memset)
#pragma intrinsic(memcpy)
#pragma intrinsic(fabs)

namespace D3DXShader
{
// Full 128-byte storage: SDK89/19 CopyArgument pushes80h at10086240.
class CArgument
{
public:
    unsigned flags, pool, relative, index, component, relative2;
    int link;
    unsigned opaque1c;
    double value;
    double sequenceScale;
    unsigned remap, origin, relative3, opaque3c, opaque40, opaque44;
    unsigned instruction, previousWrite, nextWrite, firstRead, lastRead, readCount;
    unsigned opaque60[8];
    CArgument();
    ~CArgument();
    long Initialize(CArgument *);
    static void *__stdcall operator new(unsigned);
    static void __stdcall operator delete(void *);
};
typedef char CArgumentSize[(sizeof(CArgument) == 0x80) ? 1 : -1];
class CPool
{
public:
    unsigned name, flags;
    unsigned opaque8[6];
};
class CInstruction;
class CBaseProgram
{
public:
    virtual ~CBaseProgram();
    unsigned poolCount, argumentCount, instructionCount;
    CPool **pools;
    CArgument **arguments;
    CInstruction **instructions;
    unsigned poolCapacity, argumentCapacity, instructionCapacity;
    unsigned AddArgument(CArgument *);
    unsigned CopyArgument(CArgument *);
};

unsigned CBaseProgram::AddArgument(CArgument *argument)
{
    if (argumentCount == argumentCapacity)
    {
        unsigned capacity = argumentCapacity ? 2 * argumentCapacity : 0x400;
        CArgument **copy = static_cast<CArgument **>(::operator new(capacity * sizeof(CArgument *)));
        if (!copy)
        {
            delete argument;
            return ~0u;
        }
        memcpy(copy, arguments, argumentCount * sizeof(CArgument *));
        memset(copy + argumentCount, 0, (capacity - argumentCount) * sizeof(CArgument *));
        ::operator delete(arguments);
        arguments = copy;
        argumentCapacity = capacity;
    }
    if (argument && (pools[argument->pool]->flags & 0x100) && argument->relative == ~0u)
    {
        argument->flags |= 0x80;
        if (0.0 == argument->value || 1.0 == argument->value)
        {
            argument->flags |= 1;
        }
        if (fabs(argument->value - static_cast<int>(argument->value)) < 1e-6)
        {
            argument->flags |= 2;
        }
        if (argument->value >= 0.0)
        {
            argument->flags |= 4;
        }
        if (argument->value <= 0.0)
        {
            argument->flags |= 8;
        }
        if (fabs(argument->value) <= 1.0)
        {
            argument->flags |= 0x10;
        }
    }
    arguments[argumentCount] = argument;
    return argumentCount++;
}

unsigned CBaseProgram::CopyArgument(CArgument *argument)
{
    CArgument *copy = new CArgument;
    if (!copy)
    {
        return ~0u;
    }
    if (copy->Initialize(argument) < 0)
    {
        delete copy;
        return ~0u;
    }
    return AddArgument(copy);
}

}

