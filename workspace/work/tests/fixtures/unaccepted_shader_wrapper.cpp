// DEFER: body217 matches size, not bytes; SDK linkage also disturbs a CRT data binding.
// Tested by work/tests/test_shader_argument_list.py; replay inside the material TU.
// SDK interface prefix; later unused reflection methods are omitted.
struct ShaderConstantTableInterface
{
    virtual HRESULT __stdcall QueryInterface(const GUID &iid, void **object) = 0;
    virtual ULONG __stdcall AddRef() = 0;
    virtual ULONG __stdcall Release() = 0;
    virtual void *__stdcall GetBufferPointer() = 0;
};
extern "C" HRESULT __stdcall D3DXGetShaderConstantTable(const DWORD *program, ShaderConstantTableInterface **table);
extern "C" const char *__stdcall DXGetErrorDescription9A(HRESULT result);

// PINNED 1001a920: the wrapper narrows Constants to a byte before allocation.
Bool Material_SetPassShaderArguments(const char **text, const MaterialShader *shader,
    byte *techFlags, unsigned short *argumentCount, MaterialShaderArgument **arguments)
{
    ShaderConstantTableInterface *constants;
    HRESULT result = D3DXGetShaderConstantTable((const DWORD *)shader->program, &constants);
    if (result < 0)
    {
        Com_ScriptWarning("Couldn't get the constant table: %s (%08x)\n",
            DXGetErrorDescription9A(result), result);
        return 0;
    }
    const D3DXSHADER_CONSTANTTABLE *table = (const D3DXSHADER_CONSTANTTABLE *)constants->GetBufferPointer();
    *argumentCount = (byte)table->Constants;
    if (!*argumentCount)
    {
        *arguments = 0;
        Bool success = Com_MatchToken(text, "{", 1) && Com_MatchToken(text, "}", 1);
        constants->Release();
        return success;
    }
    *arguments = (MaterialShaderArgument *)ri.Hunk_AllocInternal(*argumentCount * sizeof(MaterialShaderArgument));
    Bool success = Material_ParseShaderArguments(text, shader->name, table, techFlags, *arguments);
    constants->Release();
    return success;
}
