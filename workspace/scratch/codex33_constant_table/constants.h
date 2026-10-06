#ifndef CODEX_CONSTANT_TABLE_VIEWS_H
#define CODEX_CONSTANT_TABLE_VIEWS_H
#include <d3dx9shader.h>
#include <string.h>
#include <new>
#include <ctype.h>
#pragma intrinsic(memcpy, memset)

namespace D3DXShader
{
class CConstantTable;
typedef HRESULT (__stdcall *ConstantUpload)(const void *, unsigned,
    const void *, DWORD *, unsigned);

// SDK63/retail access views. Do not allocate a table using this prefix.
class CConstant
{
public:
    CConstantTable *table;
    DWORD name;
    WORD registerSet, registerIndex, registerCount, reserved;
    DWORD typeOffset, defaultOffset;
    D3DXSHADER_TYPEINFO *type;
    ConstantUpload upload;
    DWORD *scratch;
    CConstant *next;
    unsigned memberRegisters, elementRegisters, elementValues, inputValues;
    CConstant **members, **elements;
    D3DXSHADER_TYPEINFO *elementType;
    CConstant(CConstantTable *, D3DXSHADER_CONSTANTINFO *,
        D3DXSHADER_TYPEINFO *, ConstantUpload, DWORD *);
    ~CConstant();
    HRESULT SetScratch(DWORD *);
    HRESULT GetDesc(D3DXCONSTANT_DESC *);
    CConstant *GetConstantMember(unsigned);
    CConstant *GetConstantElement(unsigned);
    CConstant *GetConstantByName(const char *, int);
    HRESULT SetDefaults(const void *, unsigned);
    HRESULT Initialize();
    static CConstant *__stdcall Create(CConstantTable *, D3DXSHADER_CONSTANTINFO *,
        D3DXSHADER_TYPEINFO *, DWORD *);
};

template<unsigned Class, unsigned Type, unsigned Rows, unsigned Columns, unsigned PointerArray>
class SetTyped
{
public:
    static HRESULT __stdcall Set(CConstant *, const void *, const void *, unsigned, unsigned);
};

class CConstantTable : public ID3DXConstantTable
{
public:
    ULONG references;
    BYTE *buffer;
    unsigned bytes;
    D3DXSHADER_CONSTANTTABLE *header;
    CConstant **constants;
    unsigned constantCount;
    DWORD *scratch;
    HRESULT FindConstant(D3DXHANDLE, CConstant **);
    HRESULT FindConstantByName(const char *, CConstant **);
    HRESULT Initialize(const DWORD *, ID3DXBuffer **);
    HRESULT __stdcall QueryInterface(REFIID, void **);
    ULONG __stdcall AddRef();
    ULONG __stdcall Release();
    void *__stdcall GetBufferPointer();
    DWORD __stdcall GetBufferSize();
    HRESULT __stdcall GetDesc(D3DXCONSTANTTABLE_DESC *);
    HRESULT __stdcall GetConstantDesc(D3DXHANDLE, D3DXCONSTANT_DESC *, unsigned *);
    unsigned __stdcall GetSamplerIndex(D3DXHANDLE);
    D3DXHANDLE __stdcall GetConstant(D3DXHANDLE, unsigned);
    D3DXHANDLE __stdcall GetConstantByName(D3DXHANDLE, const char *);
    D3DXHANDLE __stdcall GetConstantElement(D3DXHANDLE, unsigned);
    HRESULT __stdcall SetDefaults(IDirect3DDevice9 *);
    HRESULT __stdcall SetValue(IDirect3DDevice9 *, D3DXHANDLE, const void *, unsigned);
    HRESULT __stdcall SetBool(IDirect3DDevice9 *, D3DXHANDLE, BOOL);
    HRESULT __stdcall SetBoolArray(IDirect3DDevice9 *, D3DXHANDLE, const BOOL *, unsigned);
    HRESULT __stdcall SetInt(IDirect3DDevice9 *, D3DXHANDLE, int);
    HRESULT __stdcall SetIntArray(IDirect3DDevice9 *, D3DXHANDLE, const int *, unsigned);
    HRESULT __stdcall SetFloat(IDirect3DDevice9 *, D3DXHANDLE, float);
    HRESULT __stdcall SetFloatArray(IDirect3DDevice9 *, D3DXHANDLE, const float *, unsigned);
    HRESULT __stdcall SetVector(IDirect3DDevice9 *, D3DXHANDLE, const D3DXVECTOR4 *);
    HRESULT __stdcall SetVectorArray(IDirect3DDevice9 *, D3DXHANDLE, const D3DXVECTOR4 *, unsigned);
    HRESULT __stdcall SetMatrix(IDirect3DDevice9 *, D3DXHANDLE, const D3DXMATRIX *);
    HRESULT __stdcall SetMatrixArray(IDirect3DDevice9 *, D3DXHANDLE, const D3DXMATRIX *, unsigned);
    HRESULT __stdcall SetMatrixPointerArray(IDirect3DDevice9 *, D3DXHANDLE, const D3DXMATRIX **, unsigned);
    HRESULT __stdcall SetMatrixTranspose(IDirect3DDevice9 *, D3DXHANDLE, const D3DXMATRIX *);
    HRESULT __stdcall SetMatrixTransposeArray(IDirect3DDevice9 *, D3DXHANDLE, const D3DXMATRIX *, unsigned);
    HRESULT __stdcall SetMatrixTransposePointerArray(IDirect3DDevice9 *, D3DXHANDLE, const D3DXMATRIX **, unsigned);
};
}
#endif
