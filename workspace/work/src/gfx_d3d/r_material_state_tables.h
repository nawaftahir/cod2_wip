// PINNED PC 1.0 sampler tables at 1018eb58, 1018eb80, 1018ec0c and 1018ec38.
static const CodeSamplerSource s_lightSamplers[] =
{
    { "attenuation", TEXTURE_SRC_CODE_LIGHT0_ATTENUATION, 0, 0, 0 },
    { 0, TEXTURE_SRC_CODE_BLACK, 0, 0, 0 }
};

static const CodeSamplerSource s_lightmapSamplers[] =
{
    { "weights", TEXTURE_SRC_CODE_LIGHTMAP_WEIGHTS, 0, 0, 0 },
    { "colorsR", TEXTURE_SRC_CODE_LIGHTMAP_0, 0, 0, 0 },
    { "colorsG", TEXTURE_SRC_CODE_LIGHTMAP_1, 0, 0, 0 },
    { "colorsB", TEXTURE_SRC_CODE_LIGHTMAP_2, 0, 0, 0 },
    { "sun", TEXTURE_SRC_CODE_LIGHTMAP_3, 0, 0, 0 },
    { "traditional", TEXTURE_SRC_CODE_LIGHTMAP_0, 0, 0, 0 },
    { 0, TEXTURE_SRC_CODE_BLACK, 0, 0, 0 }
};

static const CodeSamplerSource s_lightGridSamplers[] =
{
    { "weights", TEXTURE_SRC_CODE_LIGHT_GRID_WEIGHTS_0, 0, 2, 1 },
    { 0, TEXTURE_SRC_CODE_BLACK, 0, 0, 0 }
};

static const CodeSamplerSource s_codeSamplers[] =
{
    { "specularity", TEXTURE_SRC_CODE_SPECULARITY, 0, 0, 0 },
    { "white", TEXTURE_SRC_CODE_WHITE, 0, 0, 0 },
    { "black", TEXTURE_SRC_CODE_BLACK, 0, 0, 0 },
    { "identityNormalMap", TEXTURE_SRC_CODE_IDENTITY_NORMAL_MAP, 0, 0, 0 },
    { "lightmap", TEXTURE_SRC_CODE_LIGHTMAP_0, s_lightmapSamplers, 0, 0 },
    { "outdoor", TEXTURE_SRC_CODE_OUTDOOR, 0, 0, 0 },
    { "shadowCookie", TEXTURE_SRC_CODE_SHADOWCOOKIE, 0, 0, 0 },
    { "dynamicShadow", TEXTURE_SRC_CODE_DYNAMIC_SHADOWS, 0, 0, 0 },
    { "feedback", TEXTURE_SRC_CODE_FEEDBACK, 0, 0, 0 },
    { "resolvedPostSun", TEXTURE_SRC_CODE_RESOLVED_POST_SUN, 0, 0, 0 },
    { "resolvedScene", TEXTURE_SRC_CODE_RESOLVED_SCENE, 0, 0, 0 },
    { "sky", TEXTURE_SRC_CODE_SKY, 0, 0, 0 },
    { "light", TEXTURE_SRC_CODE_LIGHT0_ATTENUATION, s_lightSamplers, 2, 1 },
    { "lightGrid", TEXTURE_SRC_CODE_LIGHT_GRID_WEIGHTS_0, s_lightGridSamplers, 0, 0 },
    { "floatZ", TEXTURE_SRC_CODE_FLOATZ, 0, 0, 0 },
    { "waterColor", TEXTURE_SRC_CODE_WATER_COLOR, 0, 0, 0 },
    { "sunHalfAngle", TEXTURE_SRC_CODE_SUN_HALF_ANGLE, 0, 0, 0 },
    { 0, TEXTURE_SRC_CODE_BLACK, 0, 0, 0 }
};

// PINNED PC 1.0 code-constant hierarchy at1018eed0..1018f61b.
static const CodeConstantSource s_lightConsts[] =
{
    { "position", 131, 0, 0, 0 },
    { "color", 133, 0, 0, 0 },
    { "ambient", 135, 0, 0, 0 },
    { "specular", 137, 0, 0, 0 },
    { 0, 0, 0, 0, 0 },
};

static const CodeConstantSource s_cameraConsts[] =
{
    { "position", 139, 0, 0, 0 },
    { "forward", 140, 0, 0, 0 },
    { "left", 141, 0, 0, 0 },
    { "up", 142, 0, 0, 0 },
    { 0, 0, 0, 0, 0 },
};

static const CodeConstantSource s_nearPlaneConsts[] =
{
    { "org", 143, 0, 0, 0 },
    { "dx", 144, 0, 0, 0 },
    { "dy", 145, 0, 0, 0 },
    { 0, 0, 0, 0, 0 },
};

static const CodeConstantSource s_lightGridConsts[] =
{
    { "colorsR", 146, 0, 2, 1 },
    { "colorsG", 148, 0, 2, 1 },
    { "colorsB", 150, 0, 2, 1 },
    { 0, 0, 0, 0, 0 },
};

static const CodeConstantSource s_codeConsts[] =
{
    { "camera", 0, s_cameraConsts, 0, 0 },
    { "nearPlane", 0, s_nearPlaneConsts, 0, 0 },
    { "light", 0, s_lightConsts, 2, 1 },
    { "lightGrid", 0, s_lightGridConsts, 0, 0 },
    { "baseLightingCoords", 152, 0, 0, 0 },
    { "lightingLookupScale", 153, 0, 0, 0 },
    { "debugWeights", 154, 0, 0, 0 },
    { "ambientColor", 158, 0, 0, 0 },
    { "entityAmbient", 162, 0, 0, 0 },
    { "materialColor", 155, 0, 0, 0 },
    { "devgui", 179, 0, 0, 0 },
    { "fogConsts", 156, 0, 0, 0 },
    { "fogColor", 157, 0, 0, 0 },
    { "meanBrightness", 159, 0, 0, 0 },
    { "glowSetup", 160, 0, 0, 0 },
    { "glowApply", 161, 0, 0, 0 },
    { "filterTap", 163, 0, 8, 1 },
    { "renderTargetSize", 171, 0, 0, 0 },
    { "shadowmapSize", 172, 0, 0, 0 },
    { "shadowParms", 173, 0, 0, 0 },
    { "clipSpaceLookupScale", 174, 0, 0, 0 },
    { "clipSpaceLookupOffset", 175, 0, 0, 0 },
    { "outdoorFeatherParms", 178, 0, 0, 0 },
    { "gameTime", 130, 0, 0, 0 },
    { "particleCloudColor", 176, 0, 0, 0 },
    { "particleCloudMatrix", 177, 0, 0, 0 },
    { "worldMatrix", 188, 0, 0, 0 },
    { "inverseWorldMatrix", 189, 0, 0, 0 },
    { "transposeWorldMatrix", 190, 0, 0, 0 },
    { "inverseTransposeWorldMatrix", 191, 0, 0, 0 },
    { "viewMatrix", 192, 0, 0, 0 },
    { "inverseViewMatrix", 193, 0, 0, 0 },
    { "transposeViewMatrix", 194, 0, 0, 0 },
    { "inverseTransposeViewMatrix", 195, 0, 0, 0 },
    { "projectionMatrix", 196, 0, 0, 0 },
    { "inverseProjectionMatrix", 197, 0, 0, 0 },
    { "transposeProjectionMatrix", 198, 0, 0, 0 },
    { "inverseTransposeProjectionMatrix", 199, 0, 0, 0 },
    { "worldViewMatrix", 200, 0, 0, 0 },
    { "inverseWorldViewMatrix", 201, 0, 0, 0 },
    { "transposeWorldViewMatrix", 202, 0, 0, 0 },
    { "inverseTransposeWorldViewMatrix", 203, 0, 0, 0 },
    { "viewProjectionMatrix", 204, 0, 0, 0 },
    { "inverseViewProjectionMatrix", 205, 0, 0, 0 },
    { "transposeViewProjectionMatrix", 206, 0, 0, 0 },
    { "inverseTransposeViewProjectionMatrix", 207, 0, 0, 0 },
    { "worldViewProjectionMatrix", 208, 0, 0, 0 },
    { "inverseWorldViewProjectionMatrix", 209, 0, 0, 0 },
    { "transposeWorldViewProjectionMatrix", 210, 0, 0, 0 },
    { "inverseTransposeWorldViewProjectionMatrix", 211, 0, 0, 0 },
    { "normalizedWorldMatrix", 212, 0, 0, 0 },
    { "inverseNormalizedWorldMatrix", 213, 0, 0, 0 },
    { "transposeNormalizedWorldMatrix", 214, 0, 0, 0 },
    { "inverseTransposeNormalizedWorldMatrix", 215, 0, 0, 0 },
    { "normalizedWorldViewMatrix", 216, 0, 0, 0 },
    { "inverseNormalizedWorldViewMatrix", 217, 0, 0, 0 },
    { "transposeNormalizedWorldViewMatrix", 218, 0, 0, 0 },
    { "inverseTransposeNormalizedWorldViewMatrix", 219, 0, 0, 0 },
    { "inverseNormalizedWorldViewProjectionMatrix", 221, 0, 0, 0 },
    { "normalizedWorldViewProjectionMatrix", 220, 0, 0, 0 },
    { "transposeNormalizedWorldViewProjectionMatrix", 222, 0, 0, 0 },
    { "inverseTransposeNormalizedWorldViewProjectionMatrix", 223, 0, 0, 0 },
    { "shadowLookupMatrix", 224, 0, 0, 0 },
    { "inverseShadowLookupMatrix", 225, 0, 0, 0 },
    { "transposeShadowLookupMatrix", 226, 0, 0, 0 },
    { "inverseTransposeShadowLookupMatrix", 227, 0, 0, 0 },
    { "lightGridLookupMatrix", 228, 0, 0, 0 },
    { "inverseLightGridLookupMatrix", 229, 0, 0, 0 },
    { "transposeLightGridLookupMatrix", 230, 0, 0, 0 },
    { "inverseTransposeLightGridLookupMatrix", 231, 0, 0, 0 },
    { "worldOutdoorLookupMatrix", 232, 0, 0, 0 },
    { "inverseWorldOutdoorLookupMatrix", 233, 0, 0, 0 },
    { "transposeWorldOutdoorLookupMatrix", 234, 0, 0, 0 },
    { "inverseTransposeWorldOutdoorLookupMatrix", 235, 0, 0, 0 },
    { 0, 0, 0, 0, 0 },
};

// PINNED 0x1018eda0.
static const CodeSamplerSource s_defaultCodeSamplers[] =
{
    { "specularitySampler", TEXTURE_SRC_CODE_SPECULARITY, 0, 0, 0 },
    { "shadowCookieSampler", TEXTURE_SRC_CODE_SHADOWCOOKIE, 0, 0, 0 },
    { "feedbackSampler", TEXTURE_SRC_CODE_FEEDBACK, 0, 0, 0 },
    { "dynamicShadowSampler", TEXTURE_SRC_CODE_DYNAMIC_SHADOWS, 0, 0, 0 },
    { "floatZSampler", TEXTURE_SRC_CODE_FLOATZ, 0, 0, 0 },
    { "attenuationSampler", TEXTURE_SRC_CODE_LIGHT0_ATTENUATION, 0, 0, 0 },
    { "lightmapWeightSampler", TEXTURE_SRC_CODE_LIGHTMAP_WEIGHTS, 0, 0, 0 },
    { "lightmapSamplerR", TEXTURE_SRC_CODE_LIGHTMAP_0, 0, 0, 0 },
    { "lightmapSamplerG", TEXTURE_SRC_CODE_LIGHTMAP_1, 0, 0, 0 },
    { "lightmapSamplerB", TEXTURE_SRC_CODE_LIGHTMAP_2, 0, 0, 0 },
    { "lightmapSamplerSun", TEXTURE_SRC_CODE_LIGHTMAP_3, 0, 0, 0 },
    { "lightGridWeightSampler0", TEXTURE_SRC_CODE_LIGHT_GRID_WEIGHTS_0, 0, 0, 0 },
    { "lightGridWeightSampler1", TEXTURE_SRC_CODE_LIGHT_GRID_WEIGHTS_1, 0, 0, 0 },
    { "smodelLightingSampler", TEXTURE_SRC_CODE_SMODEL_LIGHTING, 0, 0, 0 },
    { 0, TEXTURE_SRC_CODE_BLACK, 0, 0, 0 },
};

// PINNED 0x1018f620.
static const CodeConstantSource s_defaultCodeConsts[] =
{
    { "eyePosition", 139, 0, 0, 0 },
    { "eyeForward", 140, 0, 0, 0 },
    { "eyeLeft", 141, 0, 0, 0 },
    { "eyeUp", 142, 0, 0, 0 },
    { "nearPlaneOrg", 143, 0, 0, 0 },
    { "nearPlaneDx", 144, 0, 0, 0 },
    { "nearPlaneDy", 145, 0, 0, 0 },
    { "lightPosition0", 131, 0, 0, 0 },
    { "lightPosition1", 132, 0, 0, 0 },
    { "lightColor0", 133, 0, 0, 0 },
    { "lightColor1", 134, 0, 0, 0 },
    { "lightAmbient0", 135, 0, 0, 0 },
    { "lightAmbient1", 136, 0, 0, 0 },
    { "lightSpecular0", 137, 0, 0, 0 },
    { "lightSpecular1", 138, 0, 0, 0 },
    { "lightGridColorsR0", 146, 0, 0, 0 },
    { "lightGridColorsR1", 147, 0, 0, 0 },
    { "lightGridColorsG0", 148, 0, 0, 0 },
    { "lightGridColorsG1", 149, 0, 0, 0 },
    { "lightGridColorsB0", 150, 0, 0, 0 },
    { "lightGridColorsB1", 151, 0, 0, 0 },
    { 0, 0, 0, 0, 0 },
};

// PINNED PC 1.0 material state names, values and masks (0x1018f950-0x10190100).
// PINNED: retail's state-name tables start on eight-byte boundaries.
__declspec(align(8)) static const MtlStateMapBitName s_AlphaTestBitNames[] =
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
