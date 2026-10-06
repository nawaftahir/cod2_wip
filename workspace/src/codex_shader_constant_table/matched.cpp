#include "constants_inline.h"

namespace D3DXShader
{
void __stdcall TypeSize(CConstantTable *table, D3DXSHADER_CONSTANTINFO *info,
    D3DXSHADER_TYPEINFO *type, unsigned count, unsigned *registers, unsigned *values)
{
    if (type->StructMembers)
    {
        D3DXSHADER_STRUCTMEMBERINFO *members =
            reinterpret_cast<D3DXSHADER_STRUCTMEMBERINFO *>(table->buffer + type->StructMemberInfo);
        for (unsigned i = 0; i < type->StructMembers; ++i)
        {
            if (members[i].TypeInfo)
            {
                D3DXSHADER_TYPEINFO *child =
                    reinterpret_cast<D3DXSHADER_TYPEINFO *>(table->buffer + members[i].TypeInfo);
                TypeSize(table, info, child, child->Elements * count, registers, values);
            }
        }
    }
    else
    {
        if (!info->RegisterSet)
        {
            *registers += type->Columns * type->Rows * count;
        }
        else
        {
            if (type->Class != D3DXPC_MATRIX_COLUMNS)
            {
                *registers += ((static_cast<int>(type->Columns) + 3) >> 2) * type->Rows * count;
            }
            else
            {
                *registers += ((static_cast<int>(type->Rows) + 3) >> 2) * type->Columns * count;
            }
        }
        *values += type->Columns * type->Rows * count;
    }
}

CConstant::CConstant(CConstantTable *owner, D3DXSHADER_CONSTANTINFO *info,
    D3DXSHADER_TYPEINFO *description, ConstantUpload setter, DWORD *value)
{
    table = owner;
    memcpy(&name, info, sizeof(*info));
    type = description;
    upload = setter;
    scratch = value;
    next = 0;
    elementRegisters = 0;
    inputValues = 0;
    TypeSize(owner, info, description, 1, &elementRegisters, &inputValues);
    memberRegisters = description->Elements * elementRegisters;
    elementValues = description->Elements * inputValues;
    members = 0;
    elements = 0;
    elementType = 0;
}

CConstant::~CConstant()
{
    if (members)
    {
        for (unsigned i = 0; i < type->StructMembers; ++i)
        {
            delete members[i];
        }
        ::operator delete(members);
    }
    if (elements)
    {
        for (unsigned i = 0; i < type->Elements; ++i)
        {
            delete elements[i];
        }
        ::operator delete(elements);
    }
    ::operator delete(elementType);
}


HRESULT CConstant::SetScratch(DWORD *value)
{
    scratch = value;
    for (unsigned i = 0; i < type->StructMembers; ++i)
    {
        members[i]->SetScratch(value);
        CConstant *child = members[i];
        value += (child->registerSet ? 4 : 1) * child->type->Elements * child->elementRegisters;
    }
    return S_OK;
}

HRESULT CConstant::GetDesc(D3DXCONSTANT_DESC *desc)
{
    memset(desc, 0, sizeof(D3DXCONSTANTTABLE_DESC));
    desc->Name = name ? reinterpret_cast<const char *>(table->buffer + name) : 0;
    desc->RegisterSet = static_cast<D3DXREGISTER_SET>(registerSet);
    desc->RegisterIndex = registerIndex;
    desc->RegisterCount = registerCount;
    desc->Class = static_cast<D3DXPARAMETER_CLASS>(type->Class);
    desc->Type = static_cast<D3DXPARAMETER_TYPE>(type->Type);
    desc->Rows = type->Rows;
    desc->Columns = type->Columns;
    desc->Elements = type->Elements;
    desc->StructMembers = type->StructMembers;
    desc->Bytes = desc->Elements * desc->Rows * desc->Columns * 4;
    desc->DefaultValue = defaultOffset ? table->buffer + defaultOffset : 0;
    return S_OK;
}

CConstant *CConstant::GetConstantMember(unsigned index)
{
    if (index >= type->StructMembers)
    {
        return 0;
    }
    return members[index];
}



__forceinline HRESULT CConstantTable::FindConstant(D3DXHANDLE handle, CConstant **out)
{
    if (reinterpret_cast<int>(handle) < 0)
    {
        *out = reinterpret_cast<CConstant *>(-reinterpret_cast<int>(handle));
        return S_OK;
    }
    return FindConstantByName(handle, out);
}



HRESULT __stdcall CConstantTable::SetDefaults(IDirect3DDevice9 *device)
{
    for (unsigned i = 0; i < constantCount; ++i)
    {
        HRESULT result = constants[i]->SetDefaults(device, 0);
        if (result < 0)
        {
            return result;
        }
    }
    return S_OK;
}

HRESULT __stdcall CConstantTable::GetConstantDesc(D3DXHANDLE handle,
    D3DXCONSTANT_DESC *desc, unsigned *count)
{
    if (!desc && !count)
    {
        return D3DERR_INVALIDCALL;
    }
    D3DXCONSTANT_DESC *destination = desc;
    CConstant *constant = reinterpret_cast<CConstant *>(const_cast<char *>(handle));
    HRESULT result;
    if (reinterpret_cast<int>(constant) < 0)
    {
        constant = reinterpret_cast<CConstant *>(-reinterpret_cast<int>(constant));
    }
    else
    {
        result = FindConstantByName(handle, reinterpret_cast<CConstant **>(static_cast<void *>(&desc)));
        if (result < 0)
        {
            return result;
        }
        constant = reinterpret_cast<CConstant *>(desc);
    }
    unsigned total = 0;
    unsigned limit = 1;
    for (CConstant *current = constant; current; current = current->next)
    {
        ++total;
    }
    if (count)
    {
        if (*count)
        {
            limit = *count;
        }
        if (limit > total)
        {
            limit = total;
        }
        *count = total;
    }
    if (destination)
    {
        for (; constant && limit; --limit)
        {
            result = constant->GetDesc(destination);
            if (result < 0)
            {
                return result;
            }
            constant = constant->next;
            ++destination;
        }
    }
    return S_OK;
}

unsigned __stdcall CConstantTable::GetSamplerIndex(D3DXHANDLE handle)
{
    CConstant *constant = reinterpret_cast<CConstant *>(const_cast<char *>(handle));
    if (reinterpret_cast<int>(constant) < 0)
    {
        constant = reinterpret_cast<CConstant *>(-reinterpret_cast<int>(constant));
    }
    else
    {
        if (FindConstantByName(handle, reinterpret_cast<CConstant **>(static_cast<void *>(&handle))) < 0)
        {
            return ~0u;
        }
        constant = reinterpret_cast<CConstant *>(const_cast<char *>(handle));
    }
    if (constant->registerSet != D3DXRS_SAMPLER)
    {
        return ~0u;
    }
    return constant->registerIndex;
}

D3DXHANDLE __stdcall CConstantTable::GetConstant(D3DXHANDLE handle, unsigned index)
{
    CConstant *constant;
    if (!handle)
    {
        if (index >= constantCount)
        {
            return 0;
        }
        constant = constants[index];
    }
    else
    {
        if (FindConstant(handle, &constant) < 0)
        {
            return 0;
        }
        constant = constant->GetConstantMember(index);
        if (!constant)
        {
            return 0;
        }
    }
    return reinterpret_cast<D3DXHANDLE>(-reinterpret_cast<int>(constant));
}

D3DXHANDLE __stdcall CConstantTable::GetConstantByName(D3DXHANDLE handle, const char *name)
{
    CConstant *constant;
    if (!handle)
    {
        if (FindConstant(name, &constant) < 0)
        {
            return 0;
        }
    }
    else
    {
        if (FindConstant(handle, &constant) < 0)
        {
            return 0;
        }
        constant = constant->GetConstantByName(name, 1);
        if (!constant)
        {
            return 0;
        }
    }
    return reinterpret_cast<D3DXHANDLE>(-reinterpret_cast<int>(constant));
}

D3DXHANDLE __stdcall CConstantTable::GetConstantElement(D3DXHANDLE handle, unsigned index)
{
    CConstant *constant;
    if (FindConstant(handle, &constant) < 0)
    {
        return 0;
    }
    constant = constant->GetConstantElement(index);
    if (!constant)
    {
        return 0;
    }
    return reinterpret_cast<D3DXHANDLE>(-reinterpret_cast<int>(constant));
}

#define SET_BODY(Class, Type, Rows, Columns, PointerArray, Data, Count) \
    CConstant *constant = reinterpret_cast<CConstant *>(const_cast<char *>(handle)); \
    HRESULT result; \
    if (reinterpret_cast<int>(constant) < 0) \
        constant = reinterpret_cast<CConstant *>(-reinterpret_cast<int>(constant)); \
    else \
    { \
        result = FindConstantByName(handle, reinterpret_cast<CConstant **>(static_cast<void *>(&handle))); \
        if (result < 0) return result; \
        constant = reinterpret_cast<CConstant *>(const_cast<char *>(handle)); \
    } \
    for (;;) \
    { \
        result = SetTyped<Class, Type, Rows, Columns, PointerArray>::Set( \
            constant, device, Data, Count, 0); \
        if (result < 0) return result; \
        constant = constant->next; \
        if (!constant) return S_OK; \
    }

HRESULT __stdcall CConstantTable::SetValue(IDirect3DDevice9 *device,
    D3DXHANDLE handle, const void *data, unsigned bytes)
{
    SET_BODY(0, 0, 1, 1, 0, data, bytes / 4)
}

#define SCALAR_SET(Name, Type, CType) \
HRESULT __stdcall CConstantTable::Name(IDirect3DDevice9 *device, D3DXHANDLE handle, CType value) \
{ \
    SET_BODY(0, Type, 1, 1, 0, &value, 1) \
}

#define ARRAY_SET(Name, Class, Type, Rows, Columns, PointerArray, CType) \
HRESULT __stdcall CConstantTable::Name(IDirect3DDevice9 *device, D3DXHANDLE handle, \
    const CType *data, unsigned count) \
{ \
    SET_BODY(Class, Type, Rows, Columns, PointerArray, data, count) \
}

#define OBJECT_SET(Name, Class, Rows, Columns, CType) \
HRESULT __stdcall CConstantTable::Name(IDirect3DDevice9 *device, D3DXHANDLE handle, const CType *data) \
{ \
    SET_BODY(Class, 3, Rows, Columns, 0, data, 1) \
}

SCALAR_SET(SetBool, 1, BOOL)
SCALAR_SET(SetInt, 2, int)
SCALAR_SET(SetFloat, 3, float)
ARRAY_SET(SetBoolArray, 0, 1, 1, 1, 0, BOOL)
ARRAY_SET(SetIntArray, 0, 2, 1, 1, 0, int)
ARRAY_SET(SetFloatArray, 0, 3, 1, 1, 0, float)
ARRAY_SET(SetVectorArray, 1, 3, 1, 4, 0, D3DXVECTOR4)
ARRAY_SET(SetMatrixArray, 2, 3, 4, 4, 0, D3DXMATRIX)
ARRAY_SET(SetMatrixPointerArray, 2, 3, 4, 4, 1, D3DXMATRIX *)
ARRAY_SET(SetMatrixTransposeArray, 3, 3, 4, 4, 0, D3DXMATRIX)
ARRAY_SET(SetMatrixTransposePointerArray, 3, 3, 4, 4, 1, D3DXMATRIX *)
OBJECT_SET(SetVector, 1, 1, 4, D3DXVECTOR4)
OBJECT_SET(SetMatrix, 2, 4, 4, D3DXMATRIX)
OBJECT_SET(SetMatrixTranspose, 3, 4, 4, D3DXMATRIX)

#undef OBJECT_SET
#undef ARRAY_SET
#undef SCALAR_SET
#undef SET_BODY
}

#include "create.cpp"
#include "initialization.cpp"
#include "elements.cpp"
