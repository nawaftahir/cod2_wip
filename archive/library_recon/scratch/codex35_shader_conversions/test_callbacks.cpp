#include <d3d9.h>
#include <stdio.h>
#include <string.h>

namespace D3DXShader
{
template<unsigned Stage, unsigned RegisterSet, unsigned SourceType>
class SetShaderConstant
{
public:
    static HRESULT __stdcall Set(const void *, unsigned, const void *, DWORD *, unsigned);
};
}

typedef HRESULT (__stdcall *Callback)(const void *, unsigned, const void *, DWORD *, unsigned);
struct Device
{
    void **vtable;
    unsigned calls, slot, start, count;
    const void *data;
};

static HRESULT Capture(Device *device, unsigned slot, unsigned start, const void *data, unsigned count)
{
    ++device->calls;
    device->slot = slot;
    device->start = start;
    device->data = data;
    device->count = count;
    return static_cast<HRESULT>(0x88765432u);
}

#define METHOD(SLOT) \
static HRESULT __stdcall Set##SLOT(Device *device, unsigned start, const void *data, unsigned count) \
{ return Capture(device, SLOT, start, data, count); }
METHOD(94)
METHOD(96)
METHOD(98)
METHOD(109)
METHOD(111)
METHOD(113)
#undef METHOD

#define CONVERSION_CALLBACK(S, R, T) &D3DXShader::SetShaderConstant<S, R, T>::Set
static Callback callbacks[] =
{
    CONVERSION_CALLBACK(0, 0, 2), CONVERSION_CALLBACK(0, 0, 3), CONVERSION_CALLBACK(0, 1, 1),
    CONVERSION_CALLBACK(0, 2, 1), CONVERSION_CALLBACK(0, 2, 2),
    CONVERSION_CALLBACK(1, 0, 2), CONVERSION_CALLBACK(1, 0, 3), CONVERSION_CALLBACK(1, 1, 1),
    CONVERSION_CALLBACK(1, 2, 1), CONVERSION_CALLBACK(1, 2, 2)
};
#undef CONVERSION_CALLBACK

int main()
{
    void *vtable[128];
    memset(vtable, 0, sizeof(vtable));
    vtable[94] = reinterpret_cast<void *>(&Set94);
    vtable[96] = reinterpret_cast<void *>(&Set96);
    vtable[98] = reinterpret_cast<void *>(&Set98);
    vtable[109] = reinterpret_cast<void *>(&Set109);
    vtable[111] = reinterpret_cast<void *>(&Set111);
    vtable[113] = reinterpret_cast<void *>(&Set113);
    const unsigned counts[] = {0, 1, 2, 3, 4, 7, 15, 31};
    const unsigned slots[] = {98, 98, 96, 94, 94, 113, 113, 111, 109, 109};
    const DWORD patterns[] =
    {
        0, 0x80000000u, 1, 0xffffffffu, 0x7fffffffu, 0x12345678u,
        0x3f800000u, 0xbf800000u, 0x7f800000u, 0xff800000u,
        0x7fc12345u, 0x7f812345u, 0x00800000u, 0x00000001u,
        0x4f000000u, 0xcf000000u
    };
    unsigned cases = 0;
    for (unsigned fn = 0; fn < 10; ++fn)
    {
        for (unsigned n = 0; n < 8; ++n)
        {
            for (unsigned alias = 0; alias < 2; ++alias)
            {
                for (unsigned phase = 0; phase < 4; ++phase)
                {
                    DWORD input[128], scratch[128];
                    for (unsigned i = 0; i < 128; ++i)
                    {
                        input[i] = patterns[(i + phase * 3) % 16];
                        scratch[i] = 0xdeadbeefu;
                    }
                    Device device = {vtable, 0, 0, 0, 0, 0};
                    DWORD *destination = alias ? input : scratch;
                    HRESULT result = callbacks[fn](&device, 3, input, destination, counts[n]);
                    if (result != static_cast<HRESULT>(0x88765432u) || device.calls != 1 ||
                        device.slot != slots[fn] || device.start != 3 ||
                        device.count != counts[n] || device.data != input)
                    {
                        return 1;
                    }
                    printf("CASE %u %u %u %u %08lx %u %u %u %u", fn, counts[n], alias,
                        phase, static_cast<unsigned long>(result), device.calls, device.slot,
                        device.start, device.count);
                    for (unsigned i = 0; i < 128; ++i)
                    {
                        printf(" %08lx", static_cast<unsigned long>(input[i]));
                    }
                    for (unsigned i = 0; i < 128; ++i)
                    {
                        printf(" %08lx", static_cast<unsigned long>(scratch[i]));
                    }
                    putchar('\n');
                    ++cases;
                }
            }
        }
    }
    printf("CASES %u\n", cases);
    return cases == 640 ? 0 : 1;
}
