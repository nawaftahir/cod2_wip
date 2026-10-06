#include <d3dx9shader.h>
#include <stdio.h>
#include <string.h>

struct Device
{
    void **vtable;
    unsigned calls, hash;
    HRESULT result;
};

static unsigned Hash(unsigned value, const void *data, unsigned bytes)
{
    const BYTE *p = static_cast<const BYTE *>(data);
    for (unsigned i = 0; i < bytes; ++i)
    {
        value = (value ^ p[i]) * 16777619u;
    }
    return value;
}

static HRESULT Capture(Device *device, unsigned slot, unsigned start, const void *data, unsigned count, unsigned width)
{
    ++device->calls;
    device->hash = Hash(device->hash, &slot, sizeof(slot));
    device->hash = Hash(device->hash, &start, sizeof(start));
    device->hash = Hash(device->hash, &count, sizeof(count));
    device->hash = Hash(device->hash, data, count * width * 4);
    return device->result;
}

#define METHOD(SLOT, WIDTH) \
static HRESULT __stdcall Set##SLOT(Device *device, unsigned start, const void *data, unsigned count) \
{ return Capture(device, SLOT, start, data, count, WIDTH); }
METHOD(94, 4)
METHOD(96, 4)
METHOD(98, 1)
METHOD(109, 4)
METHOD(111, 4)
METHOD(113, 1)
#undef METHOD

static unsigned cases;

static void Describe(ID3DXConstantTable *table, D3DXHANDLE handle, unsigned capacity)
{
    if (!handle)
    {
        printf("ABSENT %u %u\n", cases++, capacity);
        return;
    }
    D3DXCONSTANT_DESC desc[8];
    memset(desc, 0x5a, sizeof(desc));
    unsigned count = capacity;
    HRESULT result = table->GetConstantDesc(handle, desc, &count);
    printf("DESC %u %d %u %08lx %u %u", cases++, handle != 0, capacity,
        static_cast<unsigned long>(result), count, table->GetSamplerIndex(handle));
    if (SUCCEEDED(result))
    {
        for (unsigned i = 0; i < count; ++i)
        {
            D3DXCONSTANT_DESC *d = desc + i;
            printf(" %s %u %u %u %u %u %u %u %u %u %u %08x", d->Name ? d->Name : "<null>",
                d->RegisterSet, d->RegisterIndex, d->RegisterCount, d->Class, d->Type,
                d->Rows, d->Columns, d->Elements, d->StructMembers, d->Bytes,
                d->DefaultValue != 0, d->DefaultValue ? Hash(0, d->DefaultValue, d->Bytes) : 0);
        }
    }
    printf("\n");
}

static void Upload(ID3DXConstantTable *table, D3DXHANDLE handle, unsigned operation, unsigned count, HRESULT failure)
{
    if (!handle)
    {
        handle = "missing";
    }
    void *vtable[128];
    memset(vtable, 0, sizeof(vtable));
    vtable[94] = reinterpret_cast<void *>(&Set94);
    vtable[96] = reinterpret_cast<void *>(&Set96);
    vtable[98] = reinterpret_cast<void *>(&Set98);
    vtable[109] = reinterpret_cast<void *>(&Set109);
    vtable[111] = reinterpret_cast<void *>(&Set111);
    vtable[113] = reinterpret_cast<void *>(&Set113);
    Device device = {vtable, 0, 0, failure};
    IDirect3DDevice9 *deviceInterface = reinterpret_cast<IDirect3DDevice9 *>(&device);
    float data[256];
    for (unsigned i = 0; i < 256; ++i)
    {
        data[i] = static_cast<float>(static_cast<int>(i % 13) - 6) * 0.25f;
    }
    const D3DXMATRIX *pointers[16];
    for (unsigned i = 0; i < 16; ++i)
    {
        pointers[i] = reinterpret_cast<D3DXMATRIX *>(data + i * 16);
    }
    HRESULT result;
    switch (operation)
    {
    case 0: result = table->SetValue(deviceInterface, handle, data, count * 4); break;
    case 1: result = table->SetBool(deviceInterface, handle, TRUE); break;
    case 2: result = table->SetBoolArray(deviceInterface, handle, reinterpret_cast<BOOL *>(data), count); break;
    case 3: result = table->SetInt(deviceInterface, handle, -7); break;
    case 4: result = table->SetIntArray(deviceInterface, handle, reinterpret_cast<int *>(data), count); break;
    case 5: result = table->SetFloat(deviceInterface, handle, 1.25f); break;
    case 6: result = table->SetFloatArray(deviceInterface, handle, data, count); break;
    case 7: result = table->SetVector(deviceInterface, handle, reinterpret_cast<D3DXVECTOR4 *>(data)); break;
    case 8: result = table->SetVectorArray(deviceInterface, handle, reinterpret_cast<D3DXVECTOR4 *>(data), count); break;
    case 9: result = table->SetMatrix(deviceInterface, handle, reinterpret_cast<D3DXMATRIX *>(data)); break;
    case 10: result = table->SetMatrixArray(deviceInterface, handle, reinterpret_cast<D3DXMATRIX *>(data), count); break;
    case 11: result = table->SetMatrixPointerArray(deviceInterface, handle, pointers, count); break;
    case 12: result = table->SetMatrixTranspose(deviceInterface, handle, reinterpret_cast<D3DXMATRIX *>(data)); break;
    case 13: result = table->SetMatrixTransposeArray(deviceInterface, handle, reinterpret_cast<D3DXMATRIX *>(data), count); break;
    case 14: result = table->SetMatrixTransposePointerArray(deviceInterface, handle, pointers, count); break;
    default: result = table->SetDefaults(deviceInterface); break;
    }
    printf("SET %u %u %u %08lx %08lx %u %08x\n", cases++, operation, count,
        static_cast<unsigned long>(failure), static_cast<unsigned long>(result), device.calls, device.hash);
}

int main()
{
    setvbuf(stdout, 0, _IONBF, 0);
    const char *base =
        "bool b[3] = {true,false,true}; int n[3] = {1,2,3}; float f[4] = {1,2,3,4}; "
        "float4 v[2]; float4x4 m[2]; struct Light { float4 color; float intensity; }; Light lights[2]; ";
    const char *body =
        "float4 main(float4 p:%s) : %s { return p + (b[0]?f[0]:f[1]) + (b[1]?f[2]:f[3]) "
        "+ (b[2]?n[0]:n[1]) + n[2] + v[0]+v[1] + mul(m[0],p)+mul(m[1],p) "
        "+ lights[0].color*lights[0].intensity + lights[1].color*lights[1].intensity %s; }";
    const char *names[] = {"b", "n", "f", "v", "m", "lights", "lights[0]", "lights[1].color",
        "lights[1].intensity", "m[1]", "f[2]", "missing", "lights.missing", "lights[999]", "s"};
    const unsigned counts[] = {0, 1, 2, 4, 8};
    for (unsigned stage = 0; stage < 2; ++stage)
    {
        for (unsigned mode = 0; mode < 4; ++mode)
        {
            char shader[4096], entry[3072];
            sprintf(entry, body, stage ? "TEXCOORD0" : "POSITION", stage ? "COLOR" : "POSITION", stage ? "+tex2D(s,p.xy)" : "");
            sprintf(shader, "%s%s%s", base, stage ? "sampler2D s; " : "", entry);
            ID3DXBuffer *code = 0, *errors = 0;
            ID3DXConstantTable *table = 0;
            DWORD flags = (mode & 1 ? D3DXSHADER_PACKMATRIX_ROWMAJOR : D3DXSHADER_PACKMATRIX_COLUMNMAJOR)
                | (mode & 2 ? D3DXSHADER_SKIPOPTIMIZATION : 0);
            HRESULT result = D3DXCompileShader(shader, strlen(shader), 0, 0, "main",
                stage ? "ps_3_0" : "vs_3_0", flags, &code, &errors, &table);
            printf("BUILD %u %u %08lx\n", stage, mode, static_cast<unsigned long>(result));
            if (FAILED(result) || !table)
            {
                if (errors) printf("%s\n", static_cast<char *>(errors->GetBufferPointer()));
                return 1;
            }
            D3DXCONSTANTTABLE_DESC desc;
            result = table->GetDesc(&desc);
            printf("TABLE %08lx %s %u %u %u %08x\n", static_cast<unsigned long>(result),
                desc.Creator, desc.Version, desc.Constants, table->GetBufferSize(),
                Hash(0, table->GetBufferPointer(), table->GetBufferSize()));
            for (unsigned i = 0; i <= desc.Constants; ++i)
            {
                D3DXHANDLE handle = table->GetConstant(0, i);
                Describe(table, handle, 8);
                if (!handle) continue;
                for (unsigned element = 0; element < 4; ++element)
                {
                    Describe(table, table->GetConstantElement(handle, element), 1);
                    Describe(table, table->GetConstant(handle, element), 1);
                }
            }
            for (unsigned name = 0; name < sizeof(names) / sizeof(names[0]); ++name)
            {
                D3DXHANDLE handle = table->GetConstantByName(0, names[name]);
                for (unsigned capacity = 0; capacity < 3; ++capacity)
                {
                    Describe(table, handle, capacity);
                    Describe(table, names[name], capacity);
                }
                for (unsigned operation = 0; operation < 16; ++operation)
                {
                    for (unsigned n = 0; n < 5; ++n)
                    {
                        Upload(table, handle, operation, counts[n], S_OK);
                        Upload(table, names[name], operation, counts[n], static_cast<HRESULT>(0x88765432u));
                    }
                }
            }
            table->Release();
            code->Release();
            if (errors) errors->Release();
        }
    }
    printf("CASES %u\n", cases);
    return 0;
}
