// PINNED PC 1.0 material state names, values and masks (0x1018f950-0x10190100).
static const MtlStateMapBitName s_AlphaTestBitNames[] =
{
    { "Always", 0x00000800 },
    { "GE128", 0x00003000 },
    { "GT0", 0x00001000 },
    { "LT128", 0x00002000 },
    { 0, 0 }
};

static const MtlStateMapBitName s_BlendOpBitNames[] =
{
    { "Disable", 0x00000000 },
    { "Add", 0x00000100 },
    { "Subtract", 0x00000200 },
    { "RevSubtract", 0x00000300 },
    { "Min", 0x00000400 },
    { "Max", 0x00000500 },
    { 0, 0 }
};

static const MtlStateMapBitName s_SrcBlendBitNames[] =
{
    { "Zero", 0x00000001 },
    { "One", 0x00000002 },
    { "SrcColor", 0x00000003 },
    { "InvSrcColor", 0x00000004 },
    { "SrcAlpha", 0x00000005 },
    { "InvSrcAlpha", 0x00000006 },
    { "DestAlpha", 0x00000007 },
    { "InvDestAlpha", 0x00000008 },
    { "DestColor", 0x00000009 },
    { "InvDestColor", 0x0000000a },
    { "BlendFactor", 0x0000000c },
    { "InvBlendFactor", 0x0000000d },
    { 0, 0 }
};

static const MtlStateMapBitName s_DestBlendBitNames[] =
{
    { "Zero", 0x00000010 },
    { "One", 0x00000020 },
    { "SrcColor", 0x00000030 },
    { "InvSrcColor", 0x00000040 },
    { "SrcAlpha", 0x00000050 },
    { "InvSrcAlpha", 0x00000060 },
    { "DestAlpha", 0x00000070 },
    { "InvDestAlpha", 0x00000080 },
    { "DestColor", 0x00000090 },
    { "InvDestColor", 0x000000a0 },
    { "BlendFactor", 0x000000c0 },
    { "InvBlendFactor", 0x000000d0 },
    { 0, 0 }
};

static const MtlStateMapBitName s_BlendOpAlphaBitNames[] =
{
    { "Disable", 0x00000000 },
    { "Add", 0x01000000 },
    { "Subtract", 0x02000000 },
    { "RevSubtract", 0x03000000 },
    { "Min", 0x04000000 },
    { "Max", 0x05000000 },
    { 0, 0 }
};

static const MtlStateMapBitName s_SrcBlendAlphaBitNames[] =
{
    { "Zero", 0x00010000 },
    { "One", 0x00020000 },
    { "SrcColor", 0x00030000 },
    { "InvSrcColor", 0x00040000 },
    { "SrcAlpha", 0x00050000 },
    { "InvSrcAlpha", 0x00060000 },
    { "DestAlpha", 0x00070000 },
    { "InvDestAlpha", 0x00080000 },
    { "DestColor", 0x00090000 },
    { "InvDestColor", 0x000a0000 },
    { "BlendFactor", 0x000c0000 },
    { "InvBlendFactor", 0x000d0000 },
    { 0, 0 }
};

static const MtlStateMapBitName s_DestBlendAlphaBitNames[] =
{
    { "Zero", 0x00100000 },
    { "One", 0x00200000 },
    { "SrcColor", 0x00300000 },
    { "InvSrcColor", 0x00400000 },
    { "SrcAlpha", 0x00500000 },
    { "InvSrcAlpha", 0x00600000 },
    { "DestAlpha", 0x00700000 },
    { "InvDestAlpha", 0x00800000 },
    { "DestColor", 0x00900000 },
    { "InvDestColor", 0x00a00000 },
    { "BlendFactor", 0x00c00000 },
    { "InvBlendFactor", 0x00d00000 },
    { 0, 0 }
};

static const MtlStateMapBitName s_CullFaceBitNames[] =
{
    { "None", 0x00004000 },
    { "Back", 0x00008000 },
    { "Front", 0x0000c000 },
    { 0, 0 }
};

static const MtlStateMapBitName s_ColorWriteRgbBitNames[] =
{
    { "Enable", 0x08000000 },
    { "Disable", 0x00000000 },
    { 0, 0 }
};

static const MtlStateMapBitName s_ColorWriteAlphaBitNames[] =
{
    { "Enable", 0x10000000 },
    { "Disable", 0x00000000 },
    { 0, 0 }
};

static const MtlStateMapBitName s_FogBitNames[] =
{
    { "Enable", 0x20000000 },
    { "Disable", 0x00000000 },
    { 0, 0 }
};

static const MtlStateMapBitName s_DepthTestBitNames[] =
{
    { "Disable", 0x00000002 },
    { "LessEqual", 0x00000004 },
    { "Equal", 0x00000008 },
    { "Always", 0x0000000c },
    { 0, 0 }
};

static const MtlStateMapBitName s_DepthWriteBitNames[] =
{
    { "Enable", 0x00000001 },
    { "Disable", 0x00000000 },
    { 0, 0 }
};

static const MtlStateMapBitName s_PolygonOffsetBitNames[] =
{
    { "0", 0x00000000 },
    { "1", 0x00000010 },
    { "2", 0x00000020 },
    { 0, 0 }
};

static const MtlStateMapBitName s_StencilBitNames[] =
{
    { "Disable", 0x00000000 },
    { "OneSided", 0x00000040 },
    { "TwoSided", 0x000000c0 },
    { 0, 0 }
};

static const MtlStateMapBitName s_StencilFuncFrontBitNames[] =
{
    { "Never", 0x00000000 },
    { "Less", 0x00020000 },
    { "Equal", 0x00040000 },
    { "LessEqual", 0x00060000 },
    { "Greater", 0x00080000 },
    { "NotEqual", 0x000a0000 },
    { "GreaterEqual", 0x000c0000 },
    { "Always", 0x000e0000 },
    { 0, 0 }
};

static const MtlStateMapBitName s_StencilOpFrontPassBitNames[] =
{
    { "Keep", 0x00000000 },
    { "Zero", 0x00000100 },
    { "Replace", 0x00000200 },
    { "IncrSat", 0x00000300 },
    { "DecrSat", 0x00000400 },
    { "Invert", 0x00000500 },
    { "Incr", 0x00000600 },
    { "Decr", 0x00000700 },
    { 0, 0 }
};

static const MtlStateMapBitName s_StencilOpFrontFailBitNames[] =
{
    { "Keep", 0x00000000 },
    { "Zero", 0x00000800 },
    { "Replace", 0x00001000 },
    { "IncrSat", 0x00001800 },
    { "DecrSat", 0x00002000 },
    { "Invert", 0x00002800 },
    { "Incr", 0x00003000 },
    { "Decr", 0x00003800 },
    { 0, 0 }
};

static const MtlStateMapBitName s_StencilOpFrontZFailBitNames[] =
{
    { "Keep", 0x00000000 },
    { "Zero", 0x00004000 },
    { "Replace", 0x00008000 },
    { "IncrSat", 0x0000c000 },
    { "DecrSat", 0x00010000 },
    { "Invert", 0x00014000 },
    { "Incr", 0x00018000 },
    { "Decr", 0x0001c000 },
    { 0, 0 }
};

static const MtlStateMapBitName s_StencilFuncBackBitNames[] =
{
    { "Never", 0x00000000 },
    { "Less", 0x20000000 },
    { "Equal", 0x40000000 },
    { "LessEqual", 0x60000000 },
    { "Greater", 0x80000000 },
    { "NotEqual", 0xa0000000 },
    { "GreaterEqual", 0xc0000000 },
    { "Always", 0xe0000000 },
    { 0, 0 }
};

static const MtlStateMapBitName s_StencilOpBackPassBitNames[] =
{
    { "Keep", 0x00000000 },
    { "Zero", 0x00100000 },
    { "Replace", 0x00200000 },
    { "IncrSat", 0x00300000 },
    { "DecrSat", 0x00400000 },
    { "Invert", 0x00500000 },
    { "Incr", 0x00600000 },
    { "Decr", 0x00700000 },
    { 0, 0 }
};

static const MtlStateMapBitName s_StencilOpBackFailBitNames[] =
{
    { "Keep", 0x00000000 },
    { "Zero", 0x00800000 },
    { "Replace", 0x01000000 },
    { "IncrSat", 0x01800000 },
    { "DecrSat", 0x02000000 },
    { "Invert", 0x02800000 },
    { "Incr", 0x03000000 },
    { "Decr", 0x03800000 },
    { 0, 0 }
};

static const MtlStateMapBitName s_StencilOpBackZFailBitNames[] =
{
    { "Keep", 0x00000000 },
    { "Zero", 0x04000000 },
    { "Replace", 0x08000000 },
    { "IncrSat", 0x0c000000 },
    { "DecrSat", 0x10000000 },
    { "Invert", 0x14000000 },
    { "Incr", 0x18000000 },
    { "Decr", 0x1c000000 },
    { 0, 0 }
};

static const MtlStateMapBitName s_wireframeBitNames[] =
{
    { "Enable", 0x80000000 },
    { "Disable", 0x00000000 },
    { 0, 0 }
};

static const MtlStateMapBitGroup s_stateMapSrcBitGroup[] =
{
    { "mtlAlphaTest", s_AlphaTestBitNames, { 0x00003800, 0x00000000 } },
    { "mtlBlendOp", s_BlendOpBitNames, { 0x00000700, 0x00000000 } },
    { "mtlSrcBlend", s_SrcBlendBitNames, { 0x0000000f, 0x00000000 } },
    { "mtlDestBlend", s_DestBlendBitNames, { 0x000000f0, 0x00000000 } },
    { "mtlBlendOpAlpha", s_BlendOpAlphaBitNames, { 0x07000000, 0x00000000 } },
    { "mtlSrcBlendAlpha", s_SrcBlendAlphaBitNames, { 0x000f0000, 0x00000000 } },
    { "mtlDestBlendAlpha", s_DestBlendAlphaBitNames, { 0x00f00000, 0x00000000 } },
    { "mtlCullFace", s_CullFaceBitNames, { 0x0000c000, 0x00000000 } },
    { "mtlColorWriteRgb", s_ColorWriteRgbBitNames, { 0x08000000, 0x00000000 } },
    { "mtlColorWriteAlpha", s_ColorWriteAlphaBitNames, { 0x10000000, 0x00000000 } },
    { "mtlFog", s_FogBitNames, { 0x20000000, 0x00000000 } },
    { "mtlDepthTest", s_DepthTestBitNames, { 0x00000000, 0x0000000e } },
    { "mtlDepthWrite", s_DepthWriteBitNames, { 0x00000000, 0x00000001 } },
    { "mtlPolygonOffset", s_PolygonOffsetBitNames, { 0x00000000, 0x00000030 } },
    { "mtlStencil", s_StencilBitNames, { 0x00000000, 0x000000c0 } },
    { "mtlStencilFuncFront", s_StencilFuncFrontBitNames, { 0x00000000, 0x000e0000 } },
    { "mtlStencilOpFrontPass", s_StencilOpFrontPassBitNames, { 0x00000000, 0x00000700 } },
    { "mtlStencilOpFrontFail", s_StencilOpFrontFailBitNames, { 0x00000000, 0x00003800 } },
    { "mtlStencilOpFrontZFail", s_StencilOpFrontZFailBitNames, { 0x00000000, 0x0001c000 } },
    { "mtlStencilFuncBack", s_StencilFuncBackBitNames, { 0x00000000, 0x000e0000 } },
    { "mtlStencilOpBackPass", s_StencilOpBackPassBitNames, { 0x00000000, 0x00000700 } },
    { "mtlStencilOpBackFail", s_StencilOpBackFailBitNames, { 0x00000000, 0x00003800 } },
    { "mtlStencilOpBackZFail", s_StencilOpBackZFailBitNames, { 0x00000000, 0x0001c000 } },
    { 0, 0, { 0, 0 } }
};

static const MtlStateMapBitGroup s_stateMapDstAlphaTestBitGroup[] =
{
    { "alphaTest", s_AlphaTestBitNames, { 0x00003800, 0x00000000 } },
    { 0, 0, { 0, 0 } }
};

static const MtlStateMapBitGroup s_stateMapDstBlendFuncRgbBitGroup[] =
{
    { "blendFuncRgb", s_BlendOpBitNames, { 0x00000700, 0x00000000 } },
    { "blendFuncRgb", s_SrcBlendBitNames, { 0x0000070f, 0x00000000 } },
    { "blendFuncRgb", s_DestBlendBitNames, { 0x000007f0, 0x00000000 } },
    { 0, 0, { 0, 0 } }
};

static const MtlStateMapBitGroup s_stateMapDstBlendFuncAlphaBitGroup[] =
{
    { "blendFuncAlpha", s_BlendOpAlphaBitNames, { 0x07000000, 0x00000000 } },
    { "blendFuncAlpha", s_SrcBlendAlphaBitNames, { 0x000f0000, 0x00000000 } },
    { "blendFuncAlpha", s_DestBlendAlphaBitNames, { 0x00f00000, 0x00000000 } },
    { 0, 0, { 0, 0 } }
};

static const MtlStateMapBitGroup s_stateMapDstCullFaceBitGroup[] =
{
    { "cullFace", s_CullFaceBitNames, { 0x0000c000, 0x00000000 } },
    { 0, 0, { 0, 0 } }
};

static const MtlStateMapBitGroup s_stateMapDstDepthTestBitGroup[] =
{
    { "depthTest", s_DepthTestBitNames, { 0x00000000, 0x0000000e } },
    { 0, 0, { 0, 0 } }
};

static const MtlStateMapBitGroup s_stateMapDstDepthWriteBitGroup[] =
{
    { "depthWrite", s_DepthWriteBitNames, { 0x00000000, 0x00000001 } },
    { 0, 0, { 0, 0 } }
};

static const MtlStateMapBitGroup s_stateMapDstColorWriteBitGroup[] =
{
    { "colorWrite", s_ColorWriteRgbBitNames, { 0x08000000, 0x00000000 } },
    { "colorWrite", s_ColorWriteAlphaBitNames, { 0x10000000, 0x00000000 } },
    { 0, 0, { 0, 0 } }
};

static const MtlStateMapBitGroup s_stateMapDstFogBitGroup[] =
{
    { "fog", s_FogBitNames, { 0x20000000, 0x00000000 } },
    { 0, 0, { 0, 0 } }
};

static const MtlStateMapBitGroup s_stateMapDstPolygonOffsetBitGroup[] =
{
    { "polygonOffset", s_PolygonOffsetBitNames, { 0x00000000, 0x00000030 } },
    { 0, 0, { 0, 0 } }
};

static const MtlStateMapBitGroup s_stateMapDstWireframeBitGroup[] =
{
    { "wireframe", s_wireframeBitNames, { 0x80000000, 0x00000000 } },
    { 0, 0, { 0, 0 } }
};

static const MtlStateMapBitGroup s_stateMapDstStencilBitGroup[] =
{
    { "stencil", s_StencilBitNames, { 0x00000000, 0x000000c0 } },
    { "stencil", s_StencilFuncFrontBitNames, { 0x00000000, 0x000e0000 } },
    { "stencil", s_StencilOpFrontPassBitNames, { 0x00000000, 0x00000700 } },
    { "stencil", s_StencilOpFrontFailBitNames, { 0x00000000, 0x00003800 } },
    { "stencil", s_StencilOpFrontZFailBitNames, { 0x00000000, 0x0001c000 } },
    { "stencil", s_StencilFuncBackBitNames, { 0x00000000, 0x000e0000 } },
    { "stencil", s_StencilOpBackPassBitNames, { 0x00000000, 0x00000700 } },
    { "stencil", s_StencilOpBackFailBitNames, { 0x00000000, 0x00003800 } },
    { "stencil", s_StencilOpBackZFailBitNames, { 0x00000000, 0x0001c000 } },
    { 0, 0, { 0, 0 } }
};
