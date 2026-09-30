#include <d3dx9shader.h>

namespace D3DXShader
{
// Observed field prefix only; not a construction/allocation declaration.
class CConstant
{
public:
    unsigned char unknown0[8];
    unsigned short registerSet, registerIndex, registerCount, unknown14;
    unsigned unknown16, unknown20;
    D3DXSHADER_TYPEINFO *type;
    HRESULT (__stdcall *upload)(const void *, unsigned, const void *, DWORD *, unsigned);
    DWORD *buffer;
    unsigned unknown36, memberRegisters, elementRegisters, elementValues, inputValues;
    CConstant **members;
};

template<unsigned Class, unsigned Type, unsigned Rows, unsigned Columns, unsigned Transpose>
class SetTyped
{
    static DWORD __stdcall Read(const void *data, unsigned element, unsigned row, unsigned column)
    {
        if (row > Rows || column > Columns)
        {
            return 0;
        }
        if ((Class == 2 && !Transpose) || (Class == 3 && Transpose))
        {
            return static_cast<const DWORD *>(data)[column + (row + element * Rows) * Columns];
        }
        return static_cast<const DWORD *>(data)[row + (column + element * Columns) * Rows];
    }
    static DWORD __stdcall Read(const void *data, unsigned element, unsigned column)
    {
        if (column > Columns)
        {
            return 0;
        }
        if ((Class == 2 && !Transpose) || (Class == 3 && Transpose))
        {
            return static_cast<const DWORD *>(data)[column +
                (element % Rows + (element / Rows) * Rows) * Columns];
        }
        return static_cast<const DWORD *>(data)[element % Rows +
            (column + (element / Rows) * Columns) * Rows];
    }
    static DWORD __stdcall Read(const void *data, unsigned element)
    {
        if ((Class == 2 && !Transpose) || (Class == 3 && Transpose))
        {
            return static_cast<const DWORD *>(data)[element % Columns +
                ((element / Columns) % Rows + (element / (Rows * Columns)) * Rows) * Columns];
        }
        return static_cast<const DWORD *>(data)[(element / Columns) % Rows +
            (element % Columns + (element / (Rows * Columns)) * Columns) * Rows];
    }
public:
    static HRESULT __stdcall Set(CConstant *constant, const void *device, const void *data,
                                  unsigned count, unsigned index)
    {
        DWORD *buffer = constant->buffer;
        D3DXSHADER_TYPEINFO *type = constant->type;
        const DWORD *input = static_cast<const DWORD *>(data);
        switch (type->Class)
        {
            case D3DXPC_SCALAR:
                count *= Rows * Columns;
                count = count <= type->Elements ? count : type->Elements;
                if ((Class == 3 && !Transpose) || (Class == 2 && Transpose))
                {
                    DWORD *output = buffer;
                    for (unsigned element = 0; element < count; ++element)
                    {
                        *output++ = Read(data, element);
                    }
                    input = buffer;
                }
                break;
            case D3DXPC_VECTOR:
                if (Class == 0)
                {
                    count /= type->Columns;
                }
                else if (Class == 2 || Class == 3)
                {
                    count *= Rows;
                }
                count = count <= type->Elements ? count : type->Elements;
                if (Class != 0 && (Columns != type->Columns || (Class == 3 && !Transpose) || (Class == 2 && Transpose)))
                {
                    DWORD *output = buffer;
                    for (unsigned element = 0; element < count; ++element)
                    {
                        for (unsigned column = 0; column < type->Columns; ++column)
                        {
                            *output++ = Read(data, element, column);
                        }
                    }
                    input = buffer;
                }
                break;
            case D3DXPC_MATRIX_ROWS:
                if (Class == 0)
                {
                    count /= type->Rows * type->Columns;
                }
                else if (Class == 1)
                {
                    count /= type->Rows;
                }
                count = count <= type->Elements ? count : type->Elements;
                if (Class != 0 && ((Class != 1 && Rows != type->Rows) || Columns != type->Columns || (Class == 3 && !Transpose) || (Class == 2 && Transpose)))
                {
                    DWORD *output = buffer;
                    for (unsigned element = 0; element < count; ++element)
                    {
                        for (unsigned row = 0; row < type->Rows; ++row)
                        {
                            for (unsigned column = 0; column < type->Columns; ++column)
                            {
                                if (Class == 1)
                                {
                                    *output++ = Read(data, type->Rows * element + row, column);
                                }
                                else
                                {
                                    *output++ = Read(data, element, row, column);
                                }
                            }
                        }
                    }
                    input = buffer;
                }
                break;
            case D3DXPC_MATRIX_COLUMNS:
                if (Class == 0)
                {
                    count /= type->Rows * type->Columns;
                }
                else if (Class == 1)
                {
                    count /= type->Columns;
                }
                count = count <= type->Elements ? count : type->Elements;
                if (Class < 2 || Rows != type->Rows || Columns != type->Columns || (Class == 2 && !Transpose) || (Class == 3 && Transpose))
                {
                    DWORD *output = buffer;
                    for (unsigned element = 0; element < count; ++element)
                    {
                        for (unsigned column = 0; column < type->Columns; ++column)
                        {
                            for (unsigned row = 0; row < type->Rows; ++row)
                            {
                                if (Class == 0)
                                {
                                    *output++ = Read(data, (type->Rows * element + row) * type->Columns + column);
                                }
                                else if (Class == 1)
                                {
                                    *output++ = Read(data, type->Rows * element + row, column);
                                }
                                else
                                {
                                    *output++ = Read(data, element, row, column);
                                }
                            }
                        }
                    }
                    input = buffer;
                }
                break;
            case D3DXPC_STRUCT:
                count = count * (Rows * Columns) / constant->inputValues;
                count = count <= type->Elements ? count : type->Elements;
                if ((Class == 3 && !Transpose) || (Class == 2 && Transpose))
                {
                    DWORD *output = buffer;
                    unsigned values = constant->inputValues * count;
                    for (unsigned element = 0; element < values; ++element)
                    {
                        *output++ = Read(data, element);
                    }
                    input = buffer;
                }
                for (unsigned element = 0; element < count; ++element)
                {
                    for (unsigned member = 0; member < type->StructMembers; ++member)
                    {
                        CConstant *child = constant->members[member];
                        HRESULT result = SetTyped<0, Type, 1, 1, 0>::Set(constant, device, input,
                                                                        child->elementValues, index);
                        if (result < 0)
                        {
                            return result;
                        }
                        input += child->elementValues;
                        index += child->memberRegisters;
                    }
                }
                return 0;
            default:
                return E_NOTIMPL;
        }

        if (Type != 0 && type->Type != Type)
        {
            unsigned values = constant->inputValues * count;
            DWORD *output = buffer;
            while (values != 0)
            {
                DWORD value = *input++;
                if (type->Type == D3DXPT_BOOL)
                {
                    if (Type == D3DXPT_FLOAT)
                    {
                        value = *reinterpret_cast<float *>(&value) != 0.0f;
                    }
                    else
                    {
                        value = static_cast<int>(value) != 0;
                    }
                }
                else if (type->Type == D3DXPT_INT)
                {
                    if (Type == D3DXPT_FLOAT)
                    {
                        value = static_cast<int>(*reinterpret_cast<float *>(&value));
                    }
                }
                else if (type->Type == D3DXPT_FLOAT)
                {
                    float converted = static_cast<float>(static_cast<int>(value));
                    *reinterpret_cast<float *>(&value) = converted;
                }
                *output++ = value;
                --values;
            }
            input = buffer;
        }

        if (constant->registerSet != D3DXRS_BOOL)
        {
            unsigned width, height;
            if (type->Class == D3DXPC_MATRIX_COLUMNS)
            {
                width = type->Rows;
                height = type->Columns;
            }
            else
            {
                width = type->Columns;
                height = type->Rows;
            }
            if (width & 3)
            {
                static const DWORD paddingInteger[4] = {0, 0, 0, 1};
                static const DWORD paddingFloat[4] = {0, 0, 0, 0x3f800000};
                const DWORD *padding = constant->registerSet == D3DXRS_INT4 ? paddingInteger : paddingFloat;
                unsigned padded = (width + 3) & ~3;
                unsigned groups = count * height;
                if (groups != 0)
                {
                    DWORD *destination = buffer + (groups + 1) * padded;
                    DWORD *rawDestination = buffer + groups * padded + width;
                    const DWORD *source = input + (groups + 1) * width;
                    do
                    {
                        destination -= padded;
                        rawDestination -= padded;
                        source -= width;
                        DWORD *padDestination = destination;
                        unsigned column = padded;
                        while (column > width)
                        {
                            --column;
                            *--padDestination = padding[column & 3];
                        }
                        DWORD *copyDestination = rawDestination;
                        const DWORD *copySource = source;
                        for (column = width; column != 0; --column)
                        {
                            *--copyDestination = *--copySource;
                        }
                    } while (--groups != 0);
                }
                input = buffer;
            }
        }
        count *= constant->elementRegisters;
        if (count > constant->registerCount)
        {
            count = constant->registerCount;
        }
        HRESULT result = constant->upload(device, constant->registerIndex + index, input, buffer, count);
        if (result < 0)
        {
            return result;
        }
        return S_OK;
    }
};

template class SetTyped<0, 0, 1, 1, 0>;
template class SetTyped<0, 1, 1, 1, 0>;
template class SetTyped<0, 2, 1, 1, 0>;
template class SetTyped<0, 3, 1, 1, 0>;
template class SetTyped<1, 3, 1, 4, 0>;
template class SetTyped<2, 3, 4, 4, 0>;
template class SetTyped<2, 3, 4, 4, 1>;
template class SetTyped<3, 3, 4, 4, 0>;
template class SetTyped<3, 3, 4, 4, 1>;
}
