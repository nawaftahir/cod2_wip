#include "constants.h"

namespace D3DXShader
{
void __stdcall TypeSize(CConstantTable *, D3DXSHADER_CONSTANTINFO *,
    D3DXSHADER_TYPEINFO *, unsigned, unsigned *, unsigned *);

HRESULT CConstant::Initialize()
{
    if (type->StructMembers)
    {
        members = static_cast<CConstant **>(::operator new(type->StructMembers * sizeof(*members)));
        if (!members)
        {
            return E_OUTOFMEMORY;
        }
        memset(members, 0, type->StructMembers * sizeof(*members));
        DWORD *value = scratch;
        D3DXSHADER_CONSTANTINFO info;
        memcpy(&info, &name, sizeof(info));
        if (type->StructMemberInfo + type->StructMembers * sizeof(D3DXSHADER_STRUCTMEMBERINFO) > table->bytes)
        {
            return E_FAIL;
        }
        D3DXSHADER_STRUCTMEMBERINFO *descriptions =
            reinterpret_cast<D3DXSHADER_STRUCTMEMBERINFO *>(table->buffer + type->StructMemberInfo);
        for (unsigned i = 0; i < type->StructMembers; ++i)
        {
            if (descriptions->TypeInfo + sizeof(D3DXSHADER_TYPEINFO) > table->bytes)
            {
                return E_FAIL;
            }
            D3DXSHADER_TYPEINFO *child =
                reinterpret_cast<D3DXSHADER_TYPEINFO *>(table->buffer + descriptions->TypeInfo);
            unsigned registers = 0, values = 0;
            TypeSize(table, &info, child, 1, &registers, &values);
            info.Name = descriptions->Name;
            info.TypeInfo = descriptions->TypeInfo;
            WORD parentIndex = registerIndex;
            WORD parentCount = registerCount;
            info.RegisterCount = static_cast<WORD>(child->Elements * registers);
            if (info.RegisterIndex + info.RegisterCount > registerCount + registerIndex)
            {
                info.RegisterCount = static_cast<WORD>(parentIndex - info.RegisterIndex + registerCount);
            }
            members[i] = Create(table, &info, child, value);
            if (!members[i])
            {
                return E_OUTOFMEMORY;
            }
            info.RegisterIndex += info.RegisterCount;
            value += (info.RegisterSet ? 4 : 1) * members[i]->elementRegisters * child->Elements;
            ++descriptions;
        }
    }
    return S_OK;
}

}
