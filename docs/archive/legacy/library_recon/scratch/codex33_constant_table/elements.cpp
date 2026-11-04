#include "constants.h"
namespace D3DXShader
{
CConstant *CConstant::GetConstantElement(unsigned index)
{
    if (index >= type->Elements)
    {
        return 0;
    }
    if (type->Elements == 1)
    {
        return this;
    }
    if (!elements)
    {
        elements = static_cast<CConstant **>(::operator new(type->Elements * sizeof(*elements)));
        if (!elements)
        {
            return 0;
        }
        memset(elements, 0, type->Elements * sizeof(*elements));
    }
    if (!elements[index])
    {
        if (!elementType)
        {
            elementType = static_cast<D3DXSHADER_TYPEINFO *>(::operator new(sizeof(*elementType)));
            if (!elementType)
            {
                return 0;
            }
            memcpy(elementType, type, sizeof(*elementType));
            elementType->Elements = 1;
        }
        D3DXSHADER_CONSTANTINFO info;
        WORD registerOffset = static_cast<WORD>(elementRegisters * index);
        unsigned parentIndex = registerIndex;
        memcpy(&info, &name, sizeof(info));
        info.RegisterIndex = static_cast<WORD>(registerOffset + registerIndex);
        info.RegisterCount = static_cast<WORD>(elementRegisters);
        int available = static_cast<int>(registerCount) - info.RegisterIndex + registerIndex;
        if (static_cast<int>(info.RegisterCount) > available)
        {
            info.RegisterCount = static_cast<WORD>(registerCount - info.RegisterIndex + parentIndex);
        }
        unsigned width = registerSet ? 4 : 1;
        if (defaultOffset)
        {
            info.DefaultValue = defaultOffset + elementRegisters * width * index * 4;
        }
        DWORD *value = scratch + elementRegisters * width * index;
        CConstant *element = new CConstant(table, &info, elementType, upload, value);
        elements[index] = element;
        if (!element)
        {
            return 0;
        }
        if (elements[index]->Initialize() < 0)
        {
            delete elements[index];
            elements[index] = 0;
            return 0;
        }
    }
    return elements[index];
}
}
