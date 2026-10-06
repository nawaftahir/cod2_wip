#include "constants.h"

namespace D3DXShader
{
template<unsigned Shader, unsigned Register, unsigned Type>
class SetShaderConstant
{
public:
    static HRESULT __stdcall Set(const void *, unsigned, const void *, DWORD *, unsigned);
};

CConstant *__stdcall CConstant::Create(CConstantTable *table, D3DXSHADER_CONSTANTINFO *info,
    D3DXSHADER_TYPEINFO *type, DWORD *scratch)
{
    ConstantUpload upload = 0;
    if (!type->StructMembers)
    {
        switch (table->header->Version & 0xffff0000)
        {
        case 0xffff0000:
            switch (info->RegisterSet)
            {
#define REGISTER_CASE(Shader, Register) \
            case Register: \
                switch (type->Type) \
                { \
                case 0: upload = SetShaderConstant<Shader, Register, 0>::Set; break; \
                case 1: upload = SetShaderConstant<Shader, Register, 1>::Set; break; \
                case 2: upload = SetShaderConstant<Shader, Register, 2>::Set; break; \
                case 3: upload = SetShaderConstant<Shader, Register, 3>::Set; break; \
                } \
                break;
                REGISTER_CASE(1, 0)
                REGISTER_CASE(1, 1)
                REGISTER_CASE(1, 2)
            }
            break;
        case 0xfffe0000:
            switch (info->RegisterSet)
            {
                REGISTER_CASE(0, 0)
                REGISTER_CASE(0, 1)
                REGISTER_CASE(0, 2)
            }
            break;
        case 0x54580000:
            switch (info->RegisterSet)
            {
                REGISTER_CASE(2, 2)
            }
            break;
        }
#undef REGISTER_CASE
    }
    else
    {
        switch (table->header->Version & 0xffff0000)
        {
        case 0xffff0000:
            switch (info->RegisterSet)
            {
            case 0: upload = SetShaderConstant<1, 0, 1>::Set; break;
            case 1: upload = SetShaderConstant<1, 1, 2>::Set; break;
            case 2: upload = SetShaderConstant<1, 2, 3>::Set; break;
            }
            break;
        case 0xfffe0000:
            switch (info->RegisterSet)
            {
            case 0: upload = SetShaderConstant<0, 0, 1>::Set; break;
            case 1: upload = SetShaderConstant<0, 1, 2>::Set; break;
            case 2: upload = SetShaderConstant<0, 2, 3>::Set; break;
            }
            break;
        }
    }
    CConstant *constant = new CConstant(table, info, type, upload, scratch);
    if (!constant)
    {
        return 0;
    }
    if (constant->Initialize() < 0)
    {
        delete constant;
        return 0;
    }
    return constant;
}
}
