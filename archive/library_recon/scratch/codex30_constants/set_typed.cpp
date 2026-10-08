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

template<unsigned Class, unsigned Type, unsigned Rows, unsigned Columns, unsigned PointerArray>
class SetTyped
{
    static __forceinline DWORD __stdcall Read(const void *data, unsigned element, unsigned row, unsigned column)
    {
        if (row > Rows || column > Columns)
        {
            return 0;
        }
        if (PointerArray)
        {
            data = static_cast<const DWORD *const *>(data)[element];
            element = 0;
        }
        if (Class != 3)
        {
            return static_cast<const DWORD *>(data)[column + (row + element * Rows) * Columns];
        }
        return static_cast<const DWORD *>(data)[row + (column + element * Columns) * Rows];
    }
    static __forceinline DWORD __stdcall Read(const void *data, unsigned element, unsigned column)
    {
        if (column > Columns)
        {
            return 0;
        }
        unsigned matrix = element / Rows;
        unsigned row = element % Rows;
        unsigned offset = Class == 3 ? row + column * Rows : column + row * Columns;
        if (PointerArray)
        {
            return static_cast<const DWORD *const *>(data)[matrix][offset];
        }
        return static_cast<const DWORD *>(data)[offset + matrix * Rows * Columns];
    }
    static __forceinline DWORD __stdcall Read(const void *data, unsigned element)
    {
        unsigned column = element % Columns;
        element /= Columns;
        unsigned row = element % Rows;
        element /= Rows;
        unsigned matrix = element;
        unsigned offset = Class == 3 ? row + column * Rows : column + row * Columns;
        if (PointerArray)
        {
            return static_cast<const DWORD *const *>(data)[matrix][offset];
        }
        if (Class == 3)
        {
            return static_cast<const DWORD *>(data)[row + (column + matrix * Columns) * Rows];
        }
        return static_cast<const DWORD *>(data)[column + (row + matrix * Rows) * Columns];
    }
public:
    static HRESULT __stdcall Set(CConstant *constant, const void *device, const void *data,
                                  unsigned count, unsigned index)
    {
        DWORD *buffer = constant->buffer;
        D3DXSHADER_TYPEINFO *type = constant->type;
        const DWORD *input = static_cast<const DWORD *>(data);
        unsigned element = 0;
        switch (type->Class)
        {
            case D3DXPC_SCALAR:
                count *= Rows * Columns;
                count = count <= type->Elements ? count : type->Elements;
                if (Class == 3 || PointerArray)
                {
                    DWORD *output = buffer;
                    for (; element < count; ++element)
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
                if (Class != 0 && (Columns != type->Columns || Class == 3 || PointerArray))
                {
                    DWORD *output = buffer;
                    for (; element < count; ++element)
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
                if (Class != 0 && ((Class != 1 && Rows != type->Rows) || Columns != type->Columns || Class == 3 || PointerArray))
                {
                    DWORD *output = buffer;
                    if (Class == 3 && !PointerArray &&
                        Rows == 4 && Columns == 4 && type->Rows == 4 && type->Columns == 4)
                    {
                        const DWORD *source = input;
                        for (unsigned matrices = count; matrices != 0; --matrices)
                        {
                            output[0] = source[0]; output[1] = source[4];
                            output[2] = source[8]; output[3] = source[12];
                            output[4] = source[1]; output[5] = source[5];
                            output[6] = source[9]; output[7] = source[13];
                            output[8] = source[2]; output[9] = source[6];
                            output[10] = source[10]; output[11] = source[14];
                            output[12] = source[3]; output[13] = source[7];
                            output[14] = source[11]; output[15] = source[15];
                            source += 16;
                            output += 16;
                        }
                    }
                    else
                    {
                    for (; element < count; ++element)
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
                if (Class < 2 || Rows != type->Rows || Columns != type->Columns || Class == 2 || PointerArray)
                {
                    DWORD *output = buffer;
                    if (Class == 2 && !PointerArray &&
                        Rows == 4 && Columns == 4 && type->Rows == 4 && type->Columns == 4)
                    {
                        const DWORD *source = input;
                        for (unsigned matrices = count; matrices != 0; --matrices)
                        {
                            output[0] = source[0]; output[1] = source[4];
                            output[2] = source[8]; output[3] = source[12];
                            output[4] = source[1]; output[5] = source[5];
                            output[6] = source[9]; output[7] = source[13];
                            output[8] = source[2]; output[9] = source[6];
                            output[10] = source[10]; output[11] = source[14];
                            output[12] = source[3]; output[13] = source[7];
                            output[14] = source[11]; output[15] = source[15];
                            source += 16;
                            output += 16;
                        }
                    }
                    else
                    {
                    for (; element < count; ++element)
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
                    }
                    input = buffer;
                }
                break;
            case D3DXPC_STRUCT:
                count = count * (Rows * Columns) / constant->inputValues;
                count = count <= type->Elements ? count : type->Elements;
                if (Class == 3 || PointerArray)
                {
                    DWORD *output = buffer;
                    unsigned values = constant->inputValues * count;
                    for (; element < values; ++element)
                    {
                        *output++ = Read(data, element);
                    }
                    input = buffer;
                    element = 0;
                }
                for (; element < count; ++element)
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
            if (type->Type == D3DXPT_BOOL)
            {
                while (values != 0)
                {
                    if (Type == D3DXPT_FLOAT)
                    {
                        *output++ = *reinterpret_cast<const float *>(input++) != 0.0f;
                    }
                    else
                    {
                        *output++ = static_cast<int>(*input++) != 0;
                    }
                    --values;
                }
            }
            else if (type->Type == D3DXPT_INT)
            {
                while (values != 0)
                {
                    if (Type == D3DXPT_FLOAT)
                    {
                        *output++ = static_cast<int>(*reinterpret_cast<const float *>(input++));
                    }
                    else
                    {
                        *output++ = *input++ != 0;
                    }
                    --values;
                }
            }
            else if (type->Type == D3DXPT_FLOAT)
            {
                while (values != 0)
                {
                    if (Type == D3DXPT_BOOL)
                    {
                        *reinterpret_cast<float *>(output++) = *input++ ? 1.0f : 0.0f;
                    }
                    else
                    {
                        *reinterpret_cast<float *>(output++) = static_cast<float>(static_cast<int>(*input++));
                    }
                    --values;
                }
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
