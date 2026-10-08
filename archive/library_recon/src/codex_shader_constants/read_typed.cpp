#include <windows.h>

namespace D3DXShader
{
template<unsigned Class, unsigned Type, unsigned Rows, unsigned Columns, unsigned PointerArray>
class SetTyped
{
    friend class ReadCheck;
    static DWORD __stdcall Read(const void *data, unsigned element, unsigned row, unsigned column)
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
    static DWORD __stdcall Read(const void *data, unsigned element, unsigned column)
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
    static DWORD __stdcall Read(const void *data, unsigned element)
    {
        unsigned column = element % Columns;
        element /= Columns;
        unsigned row = element % Rows;
        element /= Rows;
        if (PointerArray)
        {
            unsigned offset = Class == 3 ? row + column * Rows : column + row * Columns;
            return static_cast<const DWORD *const *>(data)[element][offset];
        }
        if (Class == 3)
        {
            return static_cast<const DWORD *>(data)[row + (column + element * Columns) * Rows];
        }
        return static_cast<const DWORD *>(data)[column + (row + element * Rows) * Columns];
    }
};

#define READ_MATRIX(Class, PointerArray) \
template DWORD __stdcall SetTyped<Class, 3, 4, 4, PointerArray>::Read(const void *, unsigned, unsigned, unsigned); \
template DWORD __stdcall SetTyped<Class, 3, 4, 4, PointerArray>::Read(const void *, unsigned, unsigned);
READ_MATRIX(2, 0)
READ_MATRIX(2, 1)
READ_MATRIX(3, 0)
READ_MATRIX(3, 1)
#undef READ_MATRIX
template DWORD __stdcall SetTyped<1, 3, 1, 4, 0>::Read(const void *, unsigned, unsigned, unsigned);
template DWORD __stdcall SetTyped<1, 3, 1, 4, 0>::Read(const void *, unsigned, unsigned);
template DWORD __stdcall SetTyped<1, 3, 1, 4, 0>::Read(const void *, unsigned);
}
