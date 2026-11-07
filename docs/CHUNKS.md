| TU (prev bound fn) | retail | slot | after | first instructions |
|---|---|---|---|---|
| r_bsp.obj | 0x10001050 | 480 | R_WorldVertexSize | `push ecx; mov ecx, dword ptr [0x101ce708]; mov edx, dword ptr [ecx + 8]; push ebx; mov ebx` |
| r_bsp.obj | 0x10001280 | 16 | R_GetWorldBounds | `jmp 0x100013d0` |
| r_bsp.obj | 0x100012b0 | 16 | R_GetNormalizedColorFromDvar | `add eax, 0x5ed8dd00; pop ecx; ret ` |
| r_bsp.obj | 0x100015b0 | 224 | R_CopyParseParamsToDvars | `push ecx; mov eax, dword ptr [0x101d1b9c]; mov eax, dword ptr [eax + 0xf4]; shl eax, 3; pu` |
| r_bsp.obj | 0x10001690 | 176 | R_CopyParseParamsToDvars | `push ebp; mov ebp, esp; and esp, 0xfffffff8; push esi; mov esi, dword ptr [ebp + 8]; push ` |
| r_bsp_load_obj.obj | 0x100017f0 | 16 | I_min | `mov eax, dword ptr [eax]; ret ` |
| r_bsp_load_obj.obj | 0x10001800 | 16 | I_min | `fld dword ptr [esp + 4]; ret ` |
| r_bsp_load_obj.obj | 0x10001850 | 16 | Vector2Set | `xor ecx, ecx; mov dword ptr [eax], ecx; mov dword ptr [eax + 4], ecx; mov dword ptr [eax +` |
| r_bsp_load_obj.obj | 0x100018c0 | 16 | Vector4Set | `mov ecx, dword ptr [eax]; mov dword ptr [edx], ecx; ret ` |
| r_bsp_load_obj.obj | 0x100018d0 | 16 | Vector4Set | `ret ` |
| r_bsp_load_obj.obj | 0x100018e0 | 16 | Vector4Set | `ret ` |
| r_bsp_load_obj.obj | 0x100018f0 | 16 | Vector4Set | `push ecx; mov dword ptr [esp], eax; fld dword ptr [esp]; pop ecx; ret ` |
| r_bsp_load_obj.obj | 0x10001900 | 64 | Vector4Set | `mov ecx, dword ptr [eax]; mov edx, dword ptr [eax + 4]; test ecx, ecx; setle cl; dec cl; a` |
| r_bsp_load_obj.obj | 0x100019c0 | 96 | R_GetLumpElemCount | `push ebx; push ebp; mov ebp, dword ptr [esp + 0x18]; push esi; mov esi, dword ptr [esp + 0` |
| r_bsp_load_obj.obj | 0x10001bc0 | 624 | R_BuildLightmapCoupling | `sub esp, 0xf40; push ebx; push ebp; push esi; lea eax, [esp + 0x48]; push eax; push ecx; c` |
| r_bsp_load_obj.obj | 0x10001e30 | 384 | R_BuildLightmapCoupling | `sub esp, 0x34; push ebx; push ebp; mov ebp, dword ptr [esp + 0x40]; xor eax, eax; test edx` |
| r_bsp_load_obj.obj | 0x10001fb0 | 1568 | R_BuildLightmapCoupling | `sub esp, 0x218; mov eax, dword ptr [0x101ae350]; mov ecx, dword ptr [0x101ae354]; mov edx,` |
| r_bsp_load_obj.obj | 0x100026c0 | 256 | R_LoadMaterials | `push ecx; mov eax, 0x48000000; mov dword ptr [ecx + 4], eax; mov dword ptr [ecx + 8], eax;` |
| r_bsp_load_obj.obj | 0x100027c0 | 128 | R_LoadMaterials | `push ebp; push esi; xor esi, esi; xor edx, edx; test edi, edi; jle 0x10002825; add eax, 6;` |
| r_bsp_load_obj.obj | 0x10002840 | 256 | R_LoadMaterials | `push ecx; xor eax, eax; mov dword ptr [esi], eax; mov dword ptr [esi + 4], eax; mov dword ` |
| r_bsp_load_obj.obj | 0x10002940 | 128 | R_LoadMaterials | `push ebp; xor ebp, ebp; cmp word ptr [ebx + 0x34], bp; jbe 0x100029b4; push edi; xor edi, ` |
| r_bsp_load_obj.obj | 0x100029c0 | 1008 | R_LoadMaterials | `sub esp, 0x28; push ebx; push ebp; push esi; mov esi, dword ptr [esp + 0x38]; push edi; mo` |
| r_bsp_load_obj.obj | 0x10003180 | 48 | R_IsValidStaticModel | `xor ecx, ecx; cmp dl, cl; mov dword ptr [eax + 8], ecx; mov dword ptr [eax + 0xc], ecx; je` |
| r_bsp_load_obj.obj | 0x100031b0 | 640 | R_IsValidStaticModel | `sub esp, 0x9c; push ebx; push ebp; mov ebp, dword ptr [esp + 0xa8]; push edi; lea eax, [es` |
| r_bsp_load_obj.obj | 0x100037e0 | 48 | R_ParseSunLight | `mov ecx, dword ptr [eax]; mov edx, dword ptr [ecx + 0x134]; mov ecx, dword ptr [eax + 4]; ` |
| r_bsp_load_obj.obj | 0x10003880 | 1216 | R_BuildCellAabbTrees | `sub esp, 0x21c; mov eax, dword ptr [ecx]; push ebx; push ebp; push esi; mov esi, dword ptr` |
| r_bsp_load_obj.obj | 0x10003d40 | 416 | R_BuildCellAabbTrees | `mov eax, 0x48000000; push esi; mov esi, dword ptr [esp + 8]; mov dword ptr [esi], eax; mov` |
| r_bsp_load_obj.obj | 0x10004300 | 208 | R_LoadPortalVerts | `push ecx; push ebx; push ebp; mov ebp, dword ptr [esp + 0x10]; push esi; push edi; mov ebx` |
| r_bsp_load_obj.obj | 0x10004430 | 576 | R_LoadCullGroupIndices | `sub esp, 0x18; push ebx; push ebp; push esi; push edi; mov ebx, 0x14; mov edx, 0x12; mov e` |
| r_bsp_load_obj.obj | 0x10004730 | 320 | R_SetParentAndCell_r | `sub esp, 8; push ebx; push ebp; push esi; push edi; mov ebx, 0x24; mov edx, 0x19; mov esi,` |
| r_bsp_load_obj.obj | 0x10004890 | 1264 | R_LoadStep | `sub esp, 0x2d8; push ebx; push ebp; mov ebp, dword ptr [esp + 0x2e4]; xor eax, eax; push e` |
| r_bsp_load_obj.obj | 0x10004d80 | 64 | R_LoadStep | `push edi; mov edi, dword ptr [ecx]; mov dword ptr [eax + 4], edi; mov edi, dword ptr [ecx ` |
| r_caps.obj | 0x10005290 | 16 | R_CheckDxCaps | `jmp 0x10017730` |
| r_caps.obj | 0x100052a0 | 16 | R_CheckDxCaps | `push 1; call 0x100263a0; pop ecx; ret ` |
| r_caps.obj | 0x100052b0 | 16 | R_CheckDxCaps | `push 0; call 0x100263a0; pop ecx; ret ` |
| r_cmds.obj | 0x10005350 | 16 | R_RegisterCmds | `dec edx; sbb eax, 0x8c48310; ret ` |
| r_debug.obj | 0x100057b0 | 48 | R_AddScaledDebugString | `push edi; xor eax, eax; mov ecx, 0x15; mov edi, edx; rep stosd dword ptr es:[edi], eax; mo` |
| r_debug.obj | 0x100057e0 | 64 | R_AddScaledDebugString | `push edi; xor eax, eax; mov ecx, 0x15; mov edi, 0x101ae4b8; rep stosd dword ptr es:[edi], ` |
| r_debug.obj | 0x10005970 | 16 | R_TransferDebugGlobals | `push esi; mov esi, 0x101ae4b8; call 0x10005820; pop esi; ret ` |
| r_debug.obj | 0x10005b10 | 16 | R_AddPlume | `fld dword ptr [esp + 4]; fsqrt ; ret ` |
| r_debug.obj | 0x10005b20 | 16 | R_AddPlume | `fld dword ptr [esp + 4]; fsqrt ; ret ` |
| r_debug.obj | 0x10005b30 | 16 | R_AddPlume | `fld dword ptr [esp + 4]; fsqrt ; ret ` |
| r_dpvs.obj | 0x10005b90 | 32 | VectorMA | `fld dword ptr [eax + 8]; fld dword ptr [eax + 4]; fld dword ptr [eax]; fld st(0); fmul st(` |
| r_dpvs.obj | 0x10005c30 | 32 | DotProduct4 | `fld dword ptr [ecx + 8]; fmul dword ptr [eax + 8]; fld dword ptr [ecx + 4]; fmul dword ptr` |
| r_dpvs.obj | 0x10005c50 | 96 | DotProduct4 | `fld dword ptr [ecx + 8]; mov edx, dword ptr [eax + 4]; fmul dword ptr [eax + 8]; fld dword` |
| r_dpvs.obj | 0x10005cd0 | 48 | R_DpvsPlaneDistToPoint | `movzx edx, byte ptr [eax + 0x11]; fld dword ptr [edx + ecx]; movzx edx, byte ptr [eax + 0x` |
| r_dpvs.obj | 0x10005d00 | 64 | R_DpvsPlaneDistToPoint | `movzx edx, byte ptr [eax + 0x10]; push esi; mov esi, ecx; sub esi, edx; movzx edx, byte pt` |
| r_dpvs.obj | 0x10005d40 | 48 | R_DpvsPlaneDistToPoint | `fld dword ptr [0x101ce5d4]; fmul dword ptr [eax + 4]; fld dword ptr [0x101ce5d8]; fmul dwo` |
| r_dpvs.obj | 0x10005d70 | 368 | R_DpvsPlaneDistToPoint | `fld dword ptr [0x1019bc84]; sub esp, 0x18; fld dword ptr [0x101ce5dc]; push esi; fucompp ;` |
| r_dpvs.obj | 0x100061d0 | 64 | R_GetSidePlaneNormals | `movzx edx, byte ptr [eax + 0x11]; fld dword ptr [edx + ecx]; movzx edx, byte ptr [eax + 0x` |
| r_dpvs.obj | 0x10006210 | 80 | R_GetSidePlaneNormals | `movzx edx, byte ptr [eax + 0x10]; push esi; mov esi, ecx; sub esi, edx; movzx edx, byte pt` |
| r_dpvs.obj | 0x10006260 | 64 | R_GetSidePlaneNormals | `movzx edx, byte ptr [eax + 0x11]; fld dword ptr [edx + ecx]; movzx edx, byte ptr [eax + 0x` |
| r_dpvs.obj | 0x10006300 | 224 | R_AppendNearFarPlanes | `push esi; push edi; mov edi, dword ptr [esp + 0xc]; xor esi, esi; test edi, edi; jle 0x100` |
| r_dpvs.obj | 0x100064b0 | 272 | R_IsBoundsOutsideViewNoStack | `push ebx; push esi; mov esi, eax; xor edx, edx; test esi, esi; jle 0x1000650a; add ecx, 0x` |
| r_dpvs.obj | 0x100065c0 | 160 | R_IsBoundsOutsideViewNoStack | `push ebx; push esi; xor bl, bl; test eax, eax; push edi; mov esi, edx; jle 0x1000662c; add` |
| r_dpvs.obj | 0x10006660 | 1408 | R_IsBoundsOutsideViewNoStack | `push ecx; fld dword ptr [ebx + 8]; lea eax, [edx + edx*2]; fmul dword ptr [ecx + 8]; lea e` |
| r_dpvs.obj | 0x10006be0 | 448 | R_IsBoundsOutsideViewNoStack | `mov ecx, dword ptr [esp + 8]; sub esp, 0xac; push ebx; xor ebx, ebx; test ecx, ecx; jle 0x` |
| r_dpvs.obj | 0x10006da0 | 608 | R_IsBoundsOutsideViewNoStack | `sub esp, 0x420; push ebx; push ebp; mov ebp, dword ptr [esp + 0x42c]; mov dword ptr [esi],` |
| r_dpvs.obj | 0x10007000 | 1072 | R_IsBoundsOutsideViewNoStack | `sub esp, 0x80; mov eax, dword ptr [0x101ce5bc]; fld dword ptr [edx]; fld dword ptr [ecx + ` |
| r_dpvs.obj | 0x10007430 | 1440 | R_IsBoundsOutsideViewNoStack | `sub esp, 0x630; push ebx; push ebp; push esi; push edi; mov edi, dword ptr [esp + 0x648]; ` |
| r_dpvs.obj | 0x10007a20 | 128 | R_OccluderBehindPlane | `push ebx; push ebp; mov ebp, dword ptr [esp + 0xc]; push esi; push edi; mov edi, dword ptr` |
| r_dpvs.obj | 0x10007aa0 | 704 | R_OccluderBehindPlane | `sub esp, 0x10; push ebp; xor ebp, ebp; push edi; mov edi, dword ptr [esp + 0x1c]; mov dwor` |
| r_dpvs.obj | 0x100080d0 | 144 | R_ChopPortalWinding | `mov eax, dword ptr [0x101d7e98]; mov ecx, dword ptr [eax + edi*4]; cmp ecx, dword ptr [0x1` |
| r_dpvs.obj | 0x10008160 | 464 | R_ChopPortalWinding | `mov eax, dword ptr [esp + 0x10]; sub esp, 0xc; push ebx; mov ebx, dword ptr [esp + 0x18]; ` |
| r_dpvs.obj | 0x10008330 | 576 | R_ChopPortalWinding | `mov al, byte ptr [0x101ce5ef]; test al, al; je 0x1000839f; mov eax, dword ptr [0x10678510]` |
| r_dpvs.obj | 0x10008600 | 336 | R_LinkEntityToCell | `sub esp, 0x18; push ebx; mov ebx, dword ptr [esp + 0x28]; push ebp; push esi; mov esi, dwo` |
| r_dpvs.obj | 0x10008750 | 80 | R_LinkEntityToCell | `fld dword ptr [ecx]; fsub dword ptr [edx]; fcomp dword ptr [0x1019bd78]; fld dword ptr [ec` |
| r_dpvs.obj | 0x100087a0 | 288 | R_LinkEntityToCell | `mov eax, dword ptr [esp + 4]; mov edx, dword ptr [0x10678510]; sub esp, 0x18; push ebx; pu` |
| r_dpvs.obj | 0x10009250 | 96 | R_CullBrushEntity | `push ecx; mov eax, dword ptr [0x1067850c]; push ebp; mov ebp, dword ptr [esp + 0xc]; push ` |
| r_dpvs.obj | 0x100092b0 | 240 | R_CullBrushEntity | `mov al, byte ptr [0x101ce5ec]; sub esp, 8; test al, al; push ebx; push ebp; mov ebp, dword` |
| r_dpvs.obj | 0x100093a0 | 224 | R_CullBrushEntity | `push ecx; push ebx; mov ebx, eax; mov eax, dword ptr [0x101d1b9c]; mov edx, dword ptr [eax` |
| r_dpvs.obj | 0x10009480 | 240 | R_CullBrushEntity | `mov eax, dword ptr [0x101d7e94]; mov ecx, dword ptr [0x10678500]; push ebx; push ebp; mov ` |
| r_dpvs.obj | 0x10009570 | 288 | R_CullBrushEntity | `push ecx; mov eax, dword ptr [0x101d7e94]; push ebx; mov ebx, dword ptr [0x10678500]; push` |
| r_dpvs.obj | 0x10009690 | 64 | R_CullBrushEntity | `mov eax, dword ptr [ecx + 0x28]; test eax, eax; push esi; mov esi, dword ptr [ecx + 0x2c];` |
| r_dpvs.obj | 0x100096d0 | 48 | R_CullBrushEntity | `push ecx; push ebx; push edi; mov edi, eax; mov ebx, ecx; push edi; push ebx; push esi; ca` |
| r_dpvs.obj | 0x10009740 | 16 | R_IsPortalOccluded | `dec eax; sar eax, 1; ret ` |
| r_dpvs.obj | 0x10009750 | 16 | R_IsPortalOccluded | `lea eax, [eax + eax + 1]; ret ` |
| r_dpvs.obj | 0x10009760 | 16 | R_IsPortalOccluded | `ret ` |
| r_dpvs.obj | 0x10009770 | 176 | R_IsPortalOccluded | `cmp dword ptr [0x101ce5e0], 0x100; push ebp; mov ebp, dword ptr [esp + 8]; push esi; push ` |
| r_dpvs.obj | 0x10009820 | 160 | R_IsPortalOccluded | `mov eax, dword ptr [0x101ce5e4]; push ebx; push ebp; mov ebp, dword ptr [eax]; push esi; m` |
| r_dpvs.obj | 0x100098c0 | 64 | R_IsPortalOccluded | `mov eax, dword ptr [0x101ce5e8]; test eax, eax; push esi; mov esi, eax; jne 0x100098f1; pu` |
| r_dpvs.obj | 0x10009900 | 16 | R_IsPortalOccluded | `mov ecx, dword ptr [0x101ce5e8]; mov dword ptr [eax], ecx; mov dword ptr [0x101ce5e8], eax` |
| r_dpvs.obj | 0x10009a10 | 96 | R_AddVertToPortalHullPoints | `push ebx; mov ebx, eax; mov al, byte ptr [ebx + 1]; test al, al; je 0x10009a1e; mov al, 1;` |
| r_dpvs.obj | 0x10009bb0 | 16 | R_IsCellInList | `mov dword ptr [ecx + eax*4], edx; inc eax; ret ` |
| r_dpvs.obj | 0x10009cf0 | 176 | R_GetFurtherCellList_r | `mov eax, 0x1c08; call 0x100f8830; push ebp; push esi; push 0; lea eax, [esp + 0xc14]; push` |
| r_dpvs.obj | 0x10009da0 | 16 | R_GetFurtherCellList_r | `test eax, eax; je 0x10009dae; mov byte ptr [eax + 1], cl; mov eax, dword ptr [eax + 4]; te` |
| r_dpvs.obj | 0x10009db0 | 32 | R_GetFurtherCellList_r | `test eax, eax; je 0x10009dc0; mov cl, 1; mov byte ptr [eax + 1], cl; mov eax, dword ptr [e` |
| r_dpvs.obj | 0x10009dd0 | 32 | R_GetFurtherCellList_r | `xor ecx, ecx; cmp eax, ecx; je 0x10009de0; mov byte ptr [eax + 1], cl; mov eax, dword ptr ` |
| r_dpvs.obj | 0x10009df0 | 560 | R_GetFurtherCellList_r | `sub esp, 0xc; push ebx; mov ebx, dword ptr [esp + 0x20]; push ebp; mov ebp, dword ptr [esp` |
| r_dpvs.obj | 0x1000a020 | 928 | R_GetFurtherCellList_r | `sub esp, 0xe5c; push ebx; push ebp; push esi; push edi; push 0x20000; call dword ptr [0x10` |
| r_dpvs.obj | 0x1000a3c0 | 400 | R_GetFurtherCellList_r | `mov eax, dword ptr [ecx]; mov dword ptr [0x101ce5d0], eax; mov edx, dword ptr [ecx + 4]; m` |
| r_dpvs.obj | 0x1000a620 | 96 | R_SetupDpvsForDir | `lea ecx, [esi + 0x108]; mov dword ptr [0x101ce5bc], ecx; mov ecx, dword ptr [esp + 4]; pus` |
| r_dpvs.obj | 0x1000a680 | 256 | R_SetupDpvsForDir | `sub esp, 8; push ebx; push ebp; mov ebp, dword ptr [esp + 0x14]; push esi; push edi; mov e` |
| r_dpvs.obj | 0x1000a780 | 80 | R_SetupDpvsForDir | `mov eax, dword ptr [0x101ce5b4]; test eax, eax; je 0x1000a7c7; mov eax, dword ptr [0x101d1` |
| r_dpvs.obj | 0x1000a7d0 | 32 | R_SetupDpvsForDir | `push ecx; push edi; mov eax, esi; call 0x1000a680; add esp, 4; push esi; push edi; call 0x` |
| r_dpvs.obj | 0x1000a840 | 144 | R_ClearDpvsScene | `push ecx; mov eax, dword ptr [0x10678514]; push ebp; mov ebp, dword ptr [esp + 0xc]; push ` |
| r_dpvs.obj | 0x1000a8d0 | 400 | R_ClearDpvsScene | `sub esp, 0x7c; push ebx; push ebp; push esi; push 0x1000; call dword ptr [0x101d4a10]; mov` |
| r_dvars.obj | 0x1000b0f0 | 2512 | R_RegisterDvars | `or al, 0x3f; push 0x10192bc4; mov dword ptr [0x101ce728], eax; call dword ptr [0x101d4a40]` |
| r_dvars.obj | 0x1000bac0 | 16 | R_RegisterDvars | `push 0x2000; call dword ptr [0x101d4a50]; pop ecx; ret ` |
| r_flares.obj | 0x1000bae0 | 32 | R_ClearFlares | `mov byte ptr [eax + 2], cl; mov cl, byte ptr [esp + 4]; mov byte ptr [eax + 1], dl; mov dl` |
| r_flares.obj | 0x1000bb00 | 16 | R_ClearFlares | `push ecx; push edx; push eax; call dword ptr [eax + 0x10]; add esp, 0xc; ret ` |
| r_fog.obj | 0x1000bb30 | 144 | R_ClearFogs | `mov ecx, dword ptr [esp + 4]; fld dword ptr [esp + 0x1c]; mov al, byte ptr [esp + 0x10]; f` |
| r_font.obj | 0x1000bce0 | 224 | R_GetCharacterGlyph | `mov eax, dword ptr [0x1076a82c]; push ebx; push ebp; push esi; xor ebp, ebp; test eax, eax` |
| r_font.obj | 0x1000bf20 | 16 | R_DuplicateFont | `ret ` |
| r_font.obj | 0x1000bf30 | 16 | R_DuplicateFont | `mov dword ptr [0x1076a82c], 0; ret ` |
| r_font.obj | 0x1000c0f0 | 352 | R_AddCmdDrawText | `mov ecx, dword ptr [esp + 8]; mov edx, dword ptr [ecx]; sub esp, 0xc; cmp edx, 0x3ff; jle ` |
| r_font.obj | 0x1000c250 | 320 | R_AddCmdDrawText | `test edi, edi; mov eax, dword ptr [esp + 0xc]; mov ecx, dword ptr [esp + 0x10]; push ebp; ` |
| r_font.obj | 0x1000c390 | 288 | R_AddCmdDrawText | `sub esp, 0x414; push esi; mov esi, dword ptr [esp + 0x41c]; test esi, esi; mov dword ptr [` |
| r_font.obj | 0x1000c4b0 | 496 | R_AddCmdDrawText | `sub esp, 0x42c; mov eax, dword ptr [esp + 0x44c]; mov ecx, dword ptr [eax]; mov edx, dword` |
| r_font.obj | 0x1000c6a0 | 240 | R_AddCmdDrawText | `push ecx; push esi; push edi; mov esi, eax; push 1; lea eax, [esp + 0xc]; push eax; push e` |
| r_image.obj | 0x1000c7a0 | 32 | I_max | `sar eax, cl; mov ecx, 1; sub ecx, eax; js 0x1000c7b0; mov eax, 1; ret ` |
| r_image.obj | 0x1000c8e0 | 48 | R_GetMinSpecImageMemory | `mov dl, byte ptr [esi]; xor eax, eax; test dl, dl; mov ecx, 0x77; je 0x1000c901; lea ecx, ` |
| r_image.obj | 0x1000c970 | 64 | Image_Release | `sar eax, cl; push edi; mov edi, 1; sub edi, eax; js 0x1000c981; mov eax, 1; mov edi, dword` |
| r_image.obj | 0x1000c9d0 | 160 | Image_GetPlatformScreenHeight | `push ebx; push ebp; mov ebp, dword ptr [esp + 0xc]; push esi; push edi; mov ebx, eax; xor ` |
| r_image.obj | 0x1000cba0 | 48 | Image_GetAvailableHashLocation | `push esi; push edi; mov edi, dword ptr [eax + 0x20]; mov esi, edx; mov edx, ecx; shr ecx, ` |
| r_image.obj | 0x1000cbd0 | 64 | Image_GetAvailableHashLocation | `push esi; push edi; lea edi, [eax + eax*8]; mov eax, dword ptr [eax*4 + 0x101a59c8]; lea e` |
| r_image.obj | 0x1000cca0 | 16 | Image_IsCodeImage | `jmp 0x1000c910` |
| r_image.obj | 0x1000ccb0 | 64 | Image_IsCodeImage | `mov eax, dword ptr [0x20]; add eax, 6; push eax; call dword ptr [0x101d49dc]; mov edx, dwo` |
| r_image.obj | 0x1000ccf0 | 32 | Image_IsCodeImage | `push esi; mov esi, eax; call 0x1000c910; push esi; call dword ptr [0x101d49e0]; add esp, 4` |
| r_image.obj | 0x1000cd10 | 336 | Image_IsCodeImage | `mov eax, 0x2004; call 0x100f8830; mov al, byte ptr [0x101d492c]; test al, al; push ebp; pu` |
| r_image.obj | 0x1000d200 | 96 | Image_FindExisting | `push ebx; push edi; mov ebx, esi; mov edi, eax; call 0x1000d140; test eax, eax; jne 0x1000` |
| r_image.obj | 0x1000d3f0 | 96 | Image_RebuildCosinePowerMap | `push ecx; push ebx; push esi; mov esi, eax; mov al, byte ptr [esi + 0xb]; test al, al; jne` |
| r_image.obj | 0x1000d510 | 80 | Image_GetSurface | `push esi; mov esi, dword ptr [0x101a59f8]; mov dword ptr [0x101cea60], esi; mov byte ptr [` |
| r_image.obj | 0x1000d560 | 288 | Image_GetSurface | `push ecx; push ebx; push esi; mov ebx, 0x10193508; call 0x1000d140; mov esi, eax; test esi` |
| r_image.obj | 0x1000d680 | 512 | Image_GetSurface | `push ebx; push esi; call 0x1002bf50; push 0x10193488; mov esi, eax; call dword ptr [0x101d` |
| r_image.obj | 0x1000d880 | 128 | Image_GetSurface | `push ecx; push esi; push edi; call 0x1000d680; call 0x1000d560; xor edi, edi; nop ; xor ea` |
| r_image.obj | 0x1000ddf0 | 16 | R_LoadWaterSetup | `push eax; call dword ptr [0x101d49d8]; add esp, 4; ret ` |
| r_image.obj | 0x1000de00 | 16 | R_LoadWaterSetup | `push eax; call dword ptr [0x101d49f8]; pop ecx; ret ` |
| r_image.obj | 0x1000de10 | 352 | R_LoadWaterSetup | `sub esp, 0x28; cmp edx, 1; push ebx; push esi; mov esi, dword ptr [esp + 0x38]; mov ebx, e` |
| r_image.obj | 0x1000e320 | 544 | $_Insertion_sort | `mov edx, dword ptr [ecx]; mov ecx, dword ptr [esp + 4]; mov dword ptr [eax], edx; mov edx,` |
| r_image.obj | 0x1000e540 | 16 | $_Median | `mov edx, dword ptr [ecx]; push esi; mov esi, dword ptr [eax]; mov dword ptr [ecx], esi; mo` |
| r_image.obj | 0x1000e550 | 16 | $_Median | `xor eax, eax; ret ` |
| r_image.obj | 0x1000e560 | 16 | $_Median | `xor eax, eax; ret ` |
| r_image.obj | 0x1000e660 | 16 | $_Med3 | `mov edx, dword ptr [ecx]; push esi; mov esi, dword ptr [eax]; mov dword ptr [ecx], esi; mo` |
| r_image.obj | 0x1000e710 | 16 | $_Pop_heap_0 | `ret ` |
| r_image.obj | 0x1000e720 | 16 | $_Pop_heap_0 | `push eax; mov eax, dword ptr [esp + 8]; call 0x1000e7a0; pop ecx; ret ` |
| r_image_load_common.obj | 0x1000eda0 | 112 | Image_UploadData | `cmp eax, 0x31545844; je 0x1000edba; cmp eax, 0x33545844; je 0x1000edba; cmp eax, 0x3554584` |
| r_image_load_common.obj | 0x1000ee10 | 32 | Image_ClampPicmip | `mov dl, byte ptr [eax + 0xb]; test dl, dl; jne 0x1000ee1f; mov al, byte ptr [eax + 0xa]; j` |
| r_image_load_common.obj | 0x1000ef30 | 16 | Image_Setup | `ret ` |
| r_image_load_common.obj | 0x1000f0b0 | 16 | Image_GetCardMemoryAmount | `fld dword ptr [esp + 4]; call 0x100f8e10; ret ` |
| r_image_load_common.obj | 0x1000f0c0 | 16 | Image_GetCardMemoryAmount | `fld dword ptr [esp + 4]; fld dword ptr [esp + 8]; fpatan ; ret ` |
| r_image_load_common.obj | 0x1000f0d0 | 16 | Image_GetCardMemoryAmount | `fld dword ptr [esp + 4]; fabs ; ret ` |
| r_image_load_common.obj | 0x1000f0e0 | 16 | Image_GetCardMemoryAmount | `fld dword ptr [esp + 4]; call 0x100f8e10; ret ` |
| r_image_load_common.obj | 0x1000f0f0 | 16 | Image_GetCardMemoryAmount | `fld dword ptr [esp + 4]; fld dword ptr [esp + 8]; fpatan ; ret ` |
| r_image_load_common.obj | 0x1000f100 | 16 | Image_GetCardMemoryAmount | `fld dword ptr [esp + 4]; fabs ; ret ` |
| r_image_load_common.obj | 0x1000f110 | 16 | Image_GetCardMemoryAmount | `fld dword ptr [esp + 4]; fabs ; ret ` |
| r_marks.obj | 0x1000f160 | 32 | VectorAdd | `mov byte ptr [eax], cl; mov cl, byte ptr [esp + 4]; mov byte ptr [eax + 1], dl; mov dl, by` |
| r_image_load_obj.obj | 0x1000f2f0 | 48 | Image_ValidateHeader | `movzx ecx, byte ptr [eax + 5]; movsx edx, word ptr [eax + 0xa]; push 0; push ecx; movsx ec` |
| r_image_load_obj.obj | 0x1000f380 | 544 | Image_ExpandBgr | `sub esp, 0x74; push ebx; push ebp; push esi; mov esi, ecx; movsx ecx, word ptr [esi + 0xa]` |
| r_image_load_obj.obj | 0x1000fb80 | 80 | Image_LoadFromFile | `push ebx; mov ebx, dword ptr [esp + 0xc]; push esi; mov esi, dword ptr [esp + 0xc]; push e` |
| r_image_load_obj.obj | 0x1000fbd0 | 96 | Image_LoadFromFile | `push ebx; push ebp; push esi; push edi; mov edi, dword ptr [esp + 0x1c]; push 0; push 7; p` |
| r_image_load_obj.obj | 0x1000fd60 | 16 | Image_GenerateSpecularity | `fld dword ptr [esp + 4]; ret ` |
| r_image_load_obj.obj | 0x10010160 | 800 | Image_GenerateSolidColor | `sub esp, 0x9c; fild dword ptr [esp + 0xa8]; push ebx; push ebp; mov ebp, dword ptr [esp + ` |
| r_image_load_obj.obj | 0x10010480 | 32 | Image_GenerateSolidColor | `fld dword ptr [esp + 4]; fadd st(0), st(0); fsubr dword ptr [0x1019bd70]; fmul dword ptr [` |
| r_image_load_obj.obj | 0x10010850 | 80 | Image_WaterColorForDirection | `mov eax, 0x1804; call 0x100f8830; mov al, byte ptr [esp + 0x180c]; mov byte ptr [esp + 1],` |
| r_image_load_obj.obj | 0x10010ae0 | 80 | Image_Load | `push ebx; push esi; mov esi, eax; mov eax, dword ptr [0x101ce708]; mov ecx, dword ptr [eax` |
| r_image_wavelet.obj | 0x10011300 | 16 | Wavelet_DecompressLevel | `fld dword ptr [esp + 4]; fld dword ptr [esp + 8]; call 0x100f8f20; ret ` |
| r_image_wavelet.obj | 0x10011310 | 16 | Wavelet_DecompressLevel | `fld dword ptr [esp + 4]; fsin ; ret ` |
| r_image_wavelet.obj | 0x10011320 | 16 | Wavelet_DecompressLevel | `fld dword ptr [esp + 4]; fld dword ptr [esp + 8]; call 0x100f8f20; ret ` |
| r_image_wavelet.obj | 0x10011330 | 16 | Wavelet_DecompressLevel | `fld dword ptr [esp + 4]; fsin ; ret ` |
| r_image_wavelet.obj | 0x10011340 | 32 | Wavelet_DecompressLevel | `mov ecx, dword ptr [0x101ce708]; mov edx, dword ptr [ecx + 8]; xor eax, eax; cmp edx, 2; s` |
| r_image_wavelet.obj | 0x10011360 | 48 | Wavelet_DecompressLevel | `push 0x30000; push 0x20000; call 0x100f6174; push 0x8001f; push 0x8001f; call 0x100f6174; ` |
| r_init.obj | 0x10011450 | 16 | R_ReleaseAndSetNULL | `push eax; call 0x100efe3c; ret ` |
| r_init.obj | 0x10011750 | 384 | R_GetDeviceCaps | `cmp eax, 1; mov eax, 0x10193fb8; je 0x1001175f; mov eax, 0x10193fac; ret ; push ebx; push ` |
| r_init.obj | 0x10012090 | 48 | R_InitSystems | `in al, 0x1a; adc byte ptr [eax], al; add al, byte ptr [eax]; add byte ptr [ebx + 0x101ae4d` |
| r_init.obj | 0x100123d0 | 752 | R_AddResolution | `sub esp, 0xc0c; push ebx; push ebp; push esi; push edi; mov edi, eax; mov eax, dword ptr [` |
| r_init.obj | 0x100126c0 | 16 | R_AddResolution | `mov eax, 1; ret ` |
| r_init.obj | 0x10012e60 | 16 | R_ShutdownHardware | `call 0x1000aaf0; jmp 0x100052c0` |
| r_init.obj | 0x10012f10 | 32 | R_InitSinTable | `push esi; mov eax, 0x101d7210; mov esi, 0x101d7a10; call 0x1005edb0; pop esi; ret ` |
| r_init.obj | 0x10012f30 | 16 | R_InitSinTable | `mov dword ptr [0x101d5d28], 0; ret ` |
| r_init.obj | 0x10013250 | 16 | R_EndView | `jmp 0x10029560` |
| r_init.obj | 0x100137d0 | 32 | R_ResetDevice | `mov eax, dword ptr [0x101d1bf8]; mov ecx, dword ptr [eax]; push eax; call dword ptr [ecx +` |
| r_init.obj | 0x100137f0 | 208 | R_ResetDevice | `push ecx; mov eax, dword ptr [0x101d1bf8]; mov ecx, dword ptr [eax]; push eax; call dword ` |
| r_init.obj | 0x10013fd0 | 80 | $_Median | `sub esp, 0x10; push ebx; push ebp; push esi; mov ebx, ecx; mov edx, dword ptr [ebx]; mov e` |
| r_init.obj | 0x10014020 | 16 | $_Median | `xor eax, eax; ret ` |
| r_init.obj | 0x10014030 | 16 | $_Median | `xor eax, eax; ret ` |
| r_init.obj | 0x100141e0 | 80 | $_Med3 | `sub esp, 0x10; push ebx; push ebp; push esi; mov ebx, ecx; mov edx, dword ptr [ebx]; mov e` |
| r_init.obj | 0x10014370 | 16 | $_Pop_heap_0 | `ret ` |
| r_init.obj | 0x10014380 | 16 | $_Pop_heap_0 | `push eax; mov eax, dword ptr [esp + 8]; push ecx; call 0x10014480; add esp, 8; ret ` |
| r_jpeg.obj | 0x10014c60 | 256 | R_LoadJpg | `push ecx; push esi; push edi; mov edi, eax; mov eax, dword ptr [0x101d7eb0]; xor esi, esi;` |
| r_jpeg.obj | 0x10014d60 | 32 | R_LoadJpg | `push ecx; mov eax, 0x10194250; call 0x10014c60; mov dword ptr [0x101d1b28], eax; pop ecx; ` |
| r_jpeg.obj | 0x10014d80 | 16 | R_LoadJpg | `mov dword ptr [0x101d7eb0], 0; ret ` |
| r_jpeg.obj | 0x10014d90 | 192 | R_LoadJpg | `dec eax; fld dword ptr [esp + 8]; fmul dword ptr [esp + 8]; push ebp; mov ebp, dword ptr [` |
| r_jpeg.obj | 0x10014e50 | 224 | R_LoadJpg | `sub esp, 0x20; mov edx, dword ptr [ecx + 0x10]; mov dword ptr [esp], edx; fld dword ptr [e` |
| r_jpeg.obj | 0x10014f30 | 144 | R_LoadJpg | `push ebx; push ebp; push esi; push edi; mov edi, eax; mov ebx, dword ptr [esp + 0x14]; mov` |
| r_light.obj | 0x10015090 | 80 | R_GetPointLightPartitions | `push ecx; push esi; mov esi, eax; mov al, byte ptr [esi]; inc esi; mov byte ptr [ebx + 4],` |
| r_light.obj | 0x100150e0 | 176 | R_GetPointLightPartitions | `push ecx; push ebx; push esi; push edi; push 0x101942b4; call 0x10060c70; lea ecx, [esp + ` |
| r_light.obj | 0x10015190 | 32 | R_GetPointLightPartitions | `fld dword ptr [edx]; fsub dword ptr [eax]; fmul dword ptr [esp + 4]; fadd dword ptr [eax];` |
| r_light.obj | 0x100151b0 | 48 | R_GetPointLightPartitions | `fld dword ptr [edx]; fsub dword ptr [eax]; fmul dword ptr [esp + 4]; fadd dword ptr [eax];` |
| r_marks.obj | 0x100155a0 | 416 | R_AddSurfaceToList | `push ecx; mov eax, dword ptr [0x101d4d20]; push edi; mov edi, dword ptr [esp + 0xc]; cmp d` |
| r_marks.obj | 0x100157e0 | 80 | R_BoxSurfaces_r | `push ecx; mov edx, dword ptr [0x101d4d20]; inc edx; lea eax, [esp]; push eax; mov eax, dwo` |
| r_marks.obj | 0x10015ba0 | 1696 | R_GetMarkFragmentBounds | `mov eax, 0x4310; call 0x100f8830; mov eax, dword ptr [esp + 0x4320]; push ebx; mov ebx, dw` |
| r_marks.obj | 0x10016240 | 80 | R_GetMarkFragmentBounds | `fld dword ptr [ecx]; fld dword ptr [edx]; fucompp ; fnstsw ax; test ah, 0x44; jp 0x1001628` |
| r_marks.obj | 0x10016290 | 16 | R_GetMarkFragmentBounds | `ret ` |
| r_marks.obj | 0x100162a0 | 16 | R_GetMarkFragmentBounds | `ret ` |
| r_marks.obj | 0x100162b0 | 16 | R_GetMarkFragmentBounds | `push eax; call dword ptr [0x101d49d4]; add esp, 4; ret ` |
| r_marks.obj | 0x100162c0 | 208 | R_GetMarkFragmentBounds | `mov al, byte ptr [esi + 0xa]; test al, al; jne 0x10016330; jmp 0x100162d0; lea esp, [esp];` |
| r_material.obj | 0x10016430 | 16 | Material_RegisterLiteral | `mov dword ptr [0x101da2d4], 0; ret ` |
| r_material.obj | 0x10016560 | 48 | Material_ClearStringTable | `mov dl, byte ptr [esi]; xor eax, eax; test dl, dl; mov ecx, 0x77; je 0x10016581; lea ecx, ` |
| r_material.obj | 0x10016590 | 48 | Material_ClearStringTable | `add edx, edx; xor eax, eax; test edx, edx; jle 0x100165af; mov ecx, 0x77; push edi; mov ed` |
| r_material.obj | 0x100169b0 | 16 | Material_SetTechnique | `ret ` |
| r_material.obj | 0x100169c0 | 32 | Material_SetTechnique | `xor ecx, ecx; xor eax, eax; cmp dword ptr [eax + 0x101d92d4], ecx; je 0x100169d2; mov dwor` |
| r_material.obj | 0x10016a80 | 16 | Material_SetTechniqueSet | `ret ` |
| r_material.obj | 0x10016a90 | 32 | Material_SetTechniqueSet | `xor ecx, ecx; xor eax, eax; cmp dword ptr [eax + 0x101d82d0], ecx; je 0x10016aa2; mov dwor` |
| r_material.obj | 0x10016ba0 | 16 | Material_SetStateMap | `ret ` |
| r_material.obj | 0x10016bd0 | 64 | Material_ClearStateMapTable | `mov cl, byte ptr [esi]; xor edx, edx; test cl, cl; mov eax, 0x77; je 0x10016bf1; lea ecx, ` |
| r_material.obj | 0x10016d40 | 32 | Material_SetShader | `mov cl, byte ptr [eax + 0xa]; test cl, cl; mov eax, dword ptr [eax + 0xc]; push eax; jne 0` |
| r_material.obj | 0x10016d60 | 80 | Material_SetShader | `mov al, byte ptr [esi + 0xa]; lea edx, [esi + 0xc]; push edx; mov edx, dword ptr [esi + 4]` |
| r_material.obj | 0x10016fe0 | 64 | Material_Duplicate | `mov eax, dword ptr [0x101d1b2c]; test eax, eax; jne 0x10016ff8; push 0x101943b8; push 0; c` |
| r_material.obj | 0x10017100 | 240 | Material_FindHashSlot | `sub esp, 8; push ebx; mov ebx, eax; lea eax, [esp + 7]; push eax; lea ecx, [esp + 0xc]; pu` |
| r_material.obj | 0x100172d0 | 48 | R_RegisterRawImage | `push esi; xor esi, esi; mov eax, dword ptr [esi + 0x101d4d28]; test eax, eax; je 0x100172e` |
| r_material.obj | 0x100173a0 | 64 | Material_RegisterBuiltins | `call 0x10017190; mov eax, dword ptr [0x101d1b30]; mov ecx, dword ptr [0x101d1b2c]; mov edx` |
| r_material.obj | 0x100173e0 | 128 | Material_RegisterBuiltins | `push ebx; push edi; xor eax, eax; mov ecx, 0xa67; mov edi, 0x101d7fc8; rep stosd dword ptr` |
| r_material.obj | 0x10017460 | 16 | Material_RegisterBuiltins | `ret ` |
| r_material.obj | 0x10017550 | 160 | Material_Shutdown | `jg 0x1001756f; adc bl, dh; stosd dword ptr es:[edi], eax; xor esi, esi; mov dword ptr [0x1` |
| r_material.obj | 0x100175f0 | 48 | Material_Shutdown | `push edi; call 0x10017540; xor eax, eax; mov ecx, 0xa67; mov edi, 0x101d7fc8; rep stosd dw` |
| r_material.obj | 0x10017620 | 16 | Material_Shutdown | `call 0x10017470; jmp 0x10016db0` |
| r_material.obj | 0x10017630 | 16 | Material_Shutdown | `call 0x100174c0; jmp 0x10016df0` |
| r_material.obj | 0x10017710 | 32 | Material_ReloadTextures | `cmp byte ptr [eax + 5], 5; je 0x10017722; mov eax, dword ptr [eax + 8]; test eax, eax; je ` |
| r_material.obj | 0x10017730 | 528 | Material_ReloadTextures | `sub esp, 8; push ebx; push ebp; push esi; push edi; call 0x1000d680; xor ecx, ecx; xor eax` |
| r_material.obj | 0x10017d30 | 544 | $_Insertion_sort | `mov edx, dword ptr [ecx]; mov ecx, dword ptr [esp + 4]; mov dword ptr [eax], edx; mov edx,` |
| r_material.obj | 0x10017f50 | 16 | $_Median | `mov edx, dword ptr [ecx]; push esi; mov esi, dword ptr [eax]; mov dword ptr [ecx], esi; mo` |
| r_material.obj | 0x10017f60 | 16 | $_Median | `xor eax, eax; ret ` |
| r_material.obj | 0x10017f70 | 16 | $_Median | `xor eax, eax; ret ` |
| r_material.obj | 0x10018070 | 16 | $_Med3 | `mov edx, dword ptr [ecx]; push esi; mov esi, dword ptr [eax]; mov dword ptr [ecx], esi; mo` |
| r_material.obj | 0x10018120 | 16 | $_Pop_heap_0 | `ret ` |
| r_material.obj | 0x10018130 | 16 | $_Pop_heap_0 | `push eax; mov eax, dword ptr [esp + 8]; call 0x100181b0; pop ecx; ret ` |
| r_material_load_obj.obj | 0x10018310 | 16 | _IncludeClass_Open | `xor eax, eax; ret 8` |
| r_material_load_obj.obj | 0x10018320 | 16 | _IncludeClass_Open | `ret ` |
| r_material_load_obj.obj | 0x10018330 | 16 | _IncludeClass_Open | `add eax, ecx; ret ` |
| r_material_load_obj.obj | 0x10018340 | 16 | _IncludeClass_Open | `mov al, byte ptr [eax + 0x1018eb34]; ret ` |
| r_material_load_obj.obj | 0x100185b0 | 352 | Material_ParseRuleSetConditionTest | `push ebp; mov ebp, dword ptr [esp + 8]; push esi; push edi; mov edi, 0x10192f58; mov esi, ` |
| r_material_load_obj.obj | 0x100188e0 | 528 | Material_AllocRuleSet | `push ebp; mov ebp, esp; and esp, 0xfffffff8; mov eax, 0x202c; call 0x100f8830; mov eax, dw` |
| r_material_load_obj.obj | 0x100193f0 | 16 | Material_LoadPassVertexDecl | `add eax, ecx; ret ` |
| r_material_load_obj.obj | 0x100194f0 | 304 | Material_ParseArrayOffset | `push ecx; push ebx; push ebp; push esi; mov esi, dword ptr [esp + 0x1c]; push edi; mov edi` |
| r_material_load_obj.obj | 0x10019780 | 32 | Material_FindScalarSamplerSource | `push eax; mov word ptr [eax], 3; mov eax, dword ptr [esp + 8]; push eax; mov edx, 0x1018ed` |
| r_material_load_obj.obj | 0x10019a80 | 544 | Material_ParseConstantArrayOffset | `push ecx; push ebx; push ebp; push esi; push edi; mov esi, dword ptr [esp + 0x18]; push 1;` |
| r_material_load_obj.obj | 0x1001a4c0 | 720 | Material_DefaultShaderArgument | `sub esp, 0x7c; mov eax, dword ptr [esp + 0x84]; push ebx; xor ebx, ebx; push ebp; push esi` |
| r_material_load_obj.obj | 0x1001a790 | 16 | Material_DefaultShaderArgument | `mov dword ptr [eax], 0x101948ec; ret ` |
| r_material_load_obj.obj | 0x1001a7a0 | 16 | Material_DefaultShaderArgument | `ret ` |
| r_material_load_obj.obj | 0x1001a7b0 | 96 | Material_DefaultShaderArgument | `push ecx; push ebx; push ebp; mov ebp, dword ptr [esp + 0x10]; mov ebx, eax; lea eax, [esp` |
| r_material_load_obj.obj | 0x1001a810 | 272 | Material_DefaultShaderArgument | `sub esp, 0x10; push ebx; push ebp; mov ebp, dword ptr [esp + 0x1c]; push esi; mov esi, eax` |
| r_material_load_obj.obj | 0x1001a920 | 224 | Material_DefaultShaderArgument | `push ecx; mov ecx, dword ptr [esi + 4]; push ebp; mov ebp, dword ptr [esp + 0x14]; lea eax` |
| r_material_load_obj.obj | 0x1001aa00 | 80 | Material_DefaultShaderArgument | `push esi; push edi; push 1; push 0x101950b4; mov esi, eax; mov edi, ecx; call 0x1005faf0; ` |
| r_material_load_obj.obj | 0x1001aa50 | 80 | Material_DefaultShaderArgument | `push esi; push edi; push 1; push 0x101950a8; mov esi, eax; mov edi, ecx; call 0x1005faf0; ` |
| r_material_load_obj.obj | 0x1001aaa0 | 80 | Material_DefaultShaderArgument | `push esi; mov esi, eax; push edi; call 0x10018ee0; add esp, 4; test al, al; jne 0x1001aab4` |
| r_material_load_obj.obj | 0x1001aaf0 | 80 | Material_DefaultShaderArgument | `push 1; push 0x10195544; mov ecx, esi; call 0x1005faf0; add esp, 8; test eax, eax; jne 0x1` |
| r_material_load_obj.obj | 0x1001ab40 | 16 | Material_DefaultShaderArgument | `mov ecx, dword ptr [eax + 4]; mov eax, dword ptr [esp + 4]; mov byte ptr [eax + ecx], dl; ` |
| r_material_load_obj.obj | 0x1001ab50 | 32 | Material_DefaultShaderArgument | `xor eax, eax; mov edx, dword ptr [eax + 0x10190254]; add eax, 8; cmp eax, 0x28; mov byte p` |
| r_material_load_obj.obj | 0x1001acb0 | 112 | Material_ParsePassOptionDx7 | `push ecx; push ebx; mov ebx, eax; xor ecx, ecx; xor eax, eax; jmp 0x1001acc0; lea ebx, [eb` |
| r_material_load_obj.obj | 0x1001ad20 | 96 | Material_ParsePassOptionDx7 | `push esi; mov esi, eax; mov eax, 0x101950a0; call 0x100183c0; test al, al; je 0x1001ad5b; ` |
| r_material_load_obj.obj | 0x1001b270 | 144 | Material_LoadPassTexCoordDx7 | `push esi; push edi; mov edi, eax; mov esi, ecx; mov eax, 0x1019507c; call 0x100183c0; test` |
| r_material_load_obj.obj | 0x1001b300 | 64 | Material_LoadPassTexCoordDx7 | `push eax; mov dword ptr [eax], 0; push 1; push 0x10194f1c; mov eax, esi; mov ecx, edi; cal` |
| r_material_load_obj.obj | 0x1001b340 | 32 | Material_LoadPassTexCoordDx7 | `push eax; mov eax, dword ptr [esp + 8]; call 0x1001ad20; add esp, 4; test al, al; setne al` |
| r_material_load_obj.obj | 0x1001b360 | 784 | Material_LoadPassTexCoordDx7 | `push ecx; push ebx; push ebp; push esi; push edi; mov ebx, eax; xor ebp, ebp; lea esp, [es` |
| r_material_load_obj.obj | 0x1001b670 | 336 | Material_LoadPassTexCoordDx7 | `push ecx; push ebx; push ebp; mov ebp, dword ptr [esp + 0x10]; push esi; push edi; xor ebx` |
| r_material_load_obj.obj | 0x1001b7c0 | 80 | Material_LoadPassTexCoordDx7 | `push esi; push edi; mov esi, ebx; call 0x10018ee0; add esp, 4; test al, al; jne 0x1001b7d4` |
| r_material_load_obj.obj | 0x1001b810 | 608 | Material_LoadPassTexCoordDx7 | `mov eax, dword ptr [esp + 4]; sub esp, 0xbc; push esi; push edi; push eax; push 0x10194ef8` |
| r_material_load_obj.obj | 0x1001ba70 | 592 | Material_LoadPassTexCoordDx7 | `mov eax, dword ptr [esp + 4]; sub esp, 0x1b8; push esi; push edi; push eax; push 0x10194e3` |
| r_material_load_obj.obj | 0x1001bcc0 | 112 | Material_LoadPassTexCoordDx7 | `sub esp, 0x44; movzx eax, word ptr [esi]; mov ecx, dword ptr [esi + 8]; mov edx, dword ptr` |
| r_material_load_obj.obj | 0x1001bd30 | 176 | Material_LoadPassTexCoordDx7 | `mov ecx, dword ptr [0x101ce708]; cmp dword ptr [ecx + 8], 2; jne 0x1001bd4d; cmp al, 3; je` |
| r_material_load_obj.obj | 0x1001bff0 | 32 | Material_TechniqueTypeForName | `mov eax, dword ptr [0x101ce708]; cmp dword ptr [eax + 8], 2; mov eax, 0x10194af0; je 0x100` |
| r_material_load_obj.obj | 0x1001c010 | 560 | Material_TechniqueTypeForName | `sub esp, 0xd0; push ebx; mov ebx, eax; mov eax, dword ptr [0x101ce708]; cmp dword ptr [eax` |
| r_material_load_obj.obj | 0x1001c290 | 48 | Material_LoadCachedTechniqueSet | `movzx ecx, word ptr [edx + 0x36]; xor eax, eax; test ecx, ecx; jle 0x1001c2ac; mov edx, dw` |
| r_material_load_obj.obj | 0x1001c2c0 | 48 | Material_LoadCachedTechniqueSet | `movzx ecx, word ptr [edx + 0x34]; xor eax, eax; test ecx, ecx; jle 0x1001c2dc; mov edx, dw` |
| r_material_load_obj.obj | 0x1001c2f0 | 208 | Material_LoadCachedTechniqueSet | `mov eax, dword ptr [esp + 0xc]; push ebx; push ebp; mov ebp, dword ptr [esp + 0x18]; push ` |
| r_material_load_obj.obj | 0x1001c3c0 | 64 | Material_LoadCachedTechniqueSet | `push ebx; push ebp; xor ebp, ebp; cmp word ptr [esi + 6], bp; push edi; mov edi, eax; jbe ` |
| r_material_load_obj.obj | 0x1001c400 | 160 | Material_LoadCachedTechniqueSet | `push ecx; push ebp; mov ebp, dword ptr [esp + 0xc]; push esi; mov esi, eax; mov eax, dword` |
| r_material_load_obj.obj | 0x1001c4a0 | 64 | Material_LoadCachedTechniqueSet | `push ebp; mov ebp, dword ptr [esp + 8]; push esi; push edi; xor edi, edi; lea esi, [ebx + ` |
| r_material_load_obj.obj | 0x1001c4e0 | 608 | Material_LoadCachedTechniqueSet | `sub esp, 0x48; push ebx; push ebp; mov ebp, dword ptr [esp + 0x54]; mov edx, dword ptr [eb` |
| r_material_load_obj.obj | 0x1001c740 | 176 | Material_LoadCachedTechniqueSet | `sub esp, 0x44; push esi; push edi; push ebx; push 0x101942c0; mov esi, 0x40; lea edi, [esp` |
| r_material_load_obj.obj | 0x1001c7f0 | 176 | Material_LoadCachedTechniqueSet | `mov eax, dword ptr [esp + 8]; sub esp, 0x44; push ebp; mov ebp, dword ptr [esp + 0x4c]; pu` |
| r_material_load_obj.obj | 0x1001c8a0 | 48 | Material_LoadCachedTechniqueSet | `push ebp; mov ebp, dword ptr [esp + 0xc]; push esi; xor esi, esi; test edi, edi; jle 0x100` |
| r_material_load_obj.obj | 0x1001c930 | 336 | Material_CompareShaderText | `sub esp, 0xc; push ebx; push ebp; push esi; push edi; push 0x14; lea eax, [esp + 0x14]; pu` |
| r_material_load_obj.obj | 0x1001d120 | 48 | $_Median | `push ebx; push ebp; push esi; push edi; mov edi, ecx; mov edx, dword ptr [edi]; mov esi, d` |
| r_material_load_obj.obj | 0x1001d150 | 16 | $_Median | `xor eax, eax; ret ` |
| r_material_load_obj.obj | 0x1001d160 | 16 | $_Median | `xor eax, eax; ret ` |
| r_material_load_obj.obj | 0x1001d2f0 | 48 | $_Med3 | `push ebx; push ebp; push esi; push edi; mov edi, ecx; mov edx, dword ptr [edi]; mov esi, d` |
| r_material_load_obj.obj | 0x1001d440 | 16 | $_Pop_heap_0 | `ret ` |
| r_material_load_obj.obj | 0x1001d450 | 16 | $_Pop_heap_0 | `push eax; mov eax, dword ptr [esp + 8]; push ecx; call 0x1001d550; add esp, 8; ret ` |
| r_model.obj | 0x1001d800 | 16 | R_ConvertAnimMatToSkelMat | `mov eax, dword ptr [eax + 8]; ret ` |
| r_model.obj | 0x1001d810 | 16 | R_ConvertAnimMatToSkelMat | `jmp dword ptr [0x101d49d4]` |
| r_model.obj | 0x1001d820 | 16 | R_ConvertAnimMatToSkelMat | `jmp dword ptr [0x101d49d4]` |
| r_model.obj | 0x1001da80 | 992 | R_CalcSceneEntityPose | `sub esp, 0x3a8; push ebx; mov ebx, eax; push edi; lea eax, [esp + 0xa8]; push eax; lea ecx` |
| r_model.obj | 0x1001de60 | 960 | R_CalcSceneEntityPose | `sub esp, 0x1cc; push ebx; push ebp; mov ebx, eax; push edi; lea eax, [esp + 0xd0]; push ea` |
| r_model.obj | 0x1001e220 | 64 | R_CalcSceneEntityPose | `push esi; mov esi, eax; mov eax, dword ptr [0x101ce7c8]; test byte ptr [eax + 8], 1; je 0x` |
| r_model.obj | 0x1001e260 | 320 | R_CalcSceneEntityPose | `fld dword ptr [edi + 4]; mov edx, dword ptr [esp + 8]; fmul dword ptr [eax + 0x10]; push e` |
| r_model.obj | 0x1001e3a0 | 160 | R_CalcSceneEntityPose | `fld dword ptr [ecx]; fmul dword ptr [eax]; fld dword ptr [ecx + 4]; fmul dword ptr [eax + ` |
| r_model.obj | 0x1001e440 | 112 | R_CalcSceneEntityPose | `mov ecx, dword ptr [esp + 4]; fld dword ptr [eax + 0x10]; fmul dword ptr [ecx + 4]; fld dw` |
| r_model.obj | 0x1001e640 | 32 | R_AllocSkinnedCachedVerts | `movaps xmm0, xmmword ptr [eax]; movaps xmmword ptr [ecx], xmm0; movaps xmm0, xmmword ptr [` |
| r_model.obj | 0x1001e6e0 | 576 | R_SkinVectorSse | `push ebp; mov ebp, esp; and esp, 0xfffffff0; sub esp, 0x88; mov eax, dword ptr [ecx + 0xc]` |
| r_model.obj | 0x1001e920 | 352 | R_SkinVectorSse | `push ebp; mov ebp, esp; and esp, 0xfffffff0; sub esp, 0x54; push ebx; mov ebx, dword ptr [` |
| r_model.obj | 0x1001ea80 | 416 | R_SkinVectorSse | `push ebp; mov ebp, esp; and esp, 0xfffffff0; sub esp, 0x48; mov edx, dword ptr [eax + 0xc]` |
| r_model.obj | 0x1001ec20 | 336 | R_SkinVectorSse | `sub esp, 0x30; push ebx; mov ebx, dword ptr [eax + 0xc]; movsx eax, word ptr [eax + 2]; te` |
| r_model.obj | 0x1001ed70 | 144 | R_SkinVectorSse | `push ebp; mov ebp, esp; and esp, 0xfffffff0; sub esp, 0x54; push ebx; mov ebx, dword ptr [` |
| r_model.obj | 0x1001ee00 | 112 | R_SkinVectorSse | `sub esp, 0x28; push ebx; mov ebx, dword ptr [eax + 0xc]; movsx eax, word ptr [eax + 2]; ad` |
| r_model.obj | 0x1001f030 | 208 | R_SkinRigidSurface | `mov ecx, dword ptr [edx + 8]; test ecx, ecx; push ebx; push esi; mov esi, eax; mov eax, dw` |
| r_model.obj | 0x1001f100 | 32 | R_SkinRigidSurface | `push eax; push ecx; call dword ptr [0x101d4bb4]; push eax; call dword ptr [0x101d4b68]; ad` |
| r_model.obj | 0x1001f120 | 352 | R_SkinRigidSurface | `push ecx; push ebp; mov ebp, dword ptr [esp + 0x10]; push esi; push edi; mov edi, eax; mov` |
| r_model.obj | 0x1001f2a0 | 480 | Material_UsesDx7GridLighting | `push ecx; push ebx; push ebp; mov ebp, dword ptr [esp + 0x1c]; push edi; push eax; mov edi` |
| r_model.obj | 0x1001f480 | 80 | Material_UsesDx7GridLighting | `push esi; mov esi, ecx; mov ecx, dword ptr [edi]; cmp ecx, 5; je 0x1001f4bc; cmp ecx, 4; j` |
| r_model.obj | 0x1001f4d0 | 80 | Material_UsesDx7GridLighting | `push ebx; push esi; shl eax, 6; mov esi, ecx; mov ecx, dword ptr [edi]; add eax, edx; cmp ` |
| r_model.obj | 0x1001f520 | 144 | Material_UsesDx7GridLighting | `sub esp, 0x50; push ebx; push ebp; mov ebp, dword ptr [esp + 0x5c]; lea ebx, [esp + 0x17];` |
| r_model.obj | 0x1001f5b0 | 96 | Material_UsesDx7GridLighting | `mov eax, dword ptr [esp + 4]; push ebx; movzx ebx, byte ptr [eax + 0x1d]; push esi; xor es` |
| r_model.obj | 0x1001f610 | 160 | Material_UsesDx7GridLighting | `push ecx; push ebp; mov ebp, dword ptr [esp + 0xc]; lea ebp, [ebp + ebp*4]; shl ebp, 0xd; ` |
| r_model.obj | 0x1001f6e0 | 16 | R_GetSceneEntDObj | `mov dword ptr [eax + 0xc], 4; ret ` |
| r_model.obj | 0x1001f6f0 | 896 | R_GetSceneEntDObj | `push ebp; mov ebp, esp; and esp, 0xfffffff8; sub esp, 0xeb4; push ebx; mov ebx, dword ptr ` |
| r_model.obj | 0x1001fa70 | 768 | R_GetSceneEntDObj | `sub esp, 0xfac; push ebp; mov ebp, dword ptr [esp + 0xfb4]; mov eax, dword ptr [ebp + 0xc]` |
| r_model.obj | 0x1001fd70 | 32 | R_GetSceneEntDObj | `cmp dword ptr [eax], 1; jne 0x1001fd82; push -1; push eax; push ecx; call 0x1001f6f0; add ` |
| r_model.obj | 0x1001fd90 | 16 | R_GetSceneEntDObj | `push eax; push ecx; push edx; call 0x1001f6f0; add esp, 0xc; ret ` |
| r_model.obj | 0x1001ffb0 | 16 | R_ExpandBoneBounds | `mov dword ptr [eax + 0xc], 2; ret ` |
| r_model.obj | 0x10020350 | 32 | R_ReleaseModel | `push 1; push 0; push 0x10020330; push 1; call dword ptr [0x101d4b80]; add esp, 0x10; ret ` |
| r_model.obj | 0x10020370 | 16 | R_ReleaseModel | `push eax; call dword ptr [0x101d49d4]; add esp, 4; ret ` |
| r_model.obj | 0x100203a0 | 48 | R_OptimizeModel | `mov eax, dword ptr [0x101ce648]; mov ecx, dword ptr [eax + 8]; test ecx, ecx; je 0x100203c` |
| r_model.obj | 0x100203d0 | 16 | R_OptimizeModel | `movaps xmm0, xmmword ptr [eax]; shufps xmm0, xmm0, 0; ret ` |
| r_model.obj | 0x100203e0 | 16 | R_OptimizeModel | `movaps xmm0, xmmword ptr [eax]; shufps xmm0, xmm0, 0x55; ret ` |
| r_model.obj | 0x100203f0 | 16 | R_OptimizeModel | `movaps xmm0, xmmword ptr [eax]; shufps xmm0, xmm0, 0xaa; ret ` |
| r_model.obj | 0x10020400 | 288 | R_OptimizeModel | `sub esp, 0x58; push ebx; push ebp; mov ebp, dword ptr [esp + 0x64]; push esi; push edi; pu` |
| r_model.obj | 0x10020520 | 16 | R_OptimizeModel | `cmp ecx, eax; jl 0x1002052c; cmp ecx, edx; mov eax, edx; jg 0x1002052c; mov eax, ecx; ret ` |
| rb_light.obj | 0x10020560 | 32 | I_ffloor | `push 0x40000; call dword ptr [0x101d49d8]; add esp, 4; mov dword ptr [0x101da9bc], eax; re` |
| rb_light.obj | 0x10020580 | 16 | I_ffloor | `mov eax, dword ptr [0x101da9bc]; push eax; call dword ptr [0x101d49f8]; pop ecx; ret ` |
| r_outdoor.obj | 0x10020640 | 336 | R_OutdoorTraceHeight | `mov eax, 0xc8000000; mov dword ptr [0x101da980], 0x48000000; mov dword ptr [0x101da984], 0` |
| r_outdoor.obj | 0x10020790 | 96 | R_OutdoorTraceHeight | `push ecx; xor eax, eax; mov ecx, dword ptr [eax + 0x10190398]; dec ecx; mov dword ptr [esp` |
| r_outdoor.obj | 0x100207f0 | 160 | R_OutdoorTraceHeight | `sub esp, 0x1c; xor eax, eax; jmp 0x10020800; lea esp, [esp]; mov edi, edi; fld dword ptr [` |
| r_outdoor.obj | 0x100208b0 | 80 | R_OutdoorTexelToWorld | `sub esp, 0xc; fld dword ptr [esp + 0x10]; fmul dword ptr [eax*4 + 0x101da998]; fadd dword ` |
| r_outdoor.obj | 0x10020900 | 80 | R_OutdoorTexelToWorld | `sub esp, 0xc; fld dword ptr [0x101da9a0]; fmul dword ptr [esp + 0x10]; fadd dword ptr [0x1` |
| r_outdoor.obj | 0x10020950 | 208 | R_OutdoorTexelToWorld | `sub esp, 0x14; fld qword ptr [0x1019bd68]; push ebx; push ebp; fstp qword ptr [esp + 0x14]` |
| r_outdoor.obj | 0x10020a20 | 80 | R_OutdoorTexelToWorld | `mov eax, dword ptr [0x101ce708]; cmp dword ptr [eax + 8], 2; push esi; jne 0x10020a38; mov` |
| r_outdoor.obj | 0x10020b00 | 16 | R_CreateOutdoorImage | `xor ecx, ecx; mov dword ptr [eax], ecx; mov dword ptr [eax + 4], ecx; mov dword ptr [eax +` |
| r_outdoor.obj | 0x10020b10 | 16 | R_CreateOutdoorImage | `mov ecx, dword ptr [0x101d489c]; xor eax, eax; test ecx, ecx; setne al; ret ` |
| r_outdoor.obj | 0x10020b20 | 32 | R_CreateOutdoorImage | `mov eax, dword ptr [0x101ce708]; cmp dword ptr [eax + 8], 2; jne 0x10020b2e; xor al, al; r` |
| r_outdoor.obj | 0x10020b40 | 16 | R_CreateOutdoorImage | `ret ` |
| r_rendercmds.obj | 0x10020bd0 | 16 | R_InitRenderCmds | `push esi; mov esi, 0x10678498; call 0x10005820; pop esi; ret ` |
| r_rendercmds.obj | 0x10020be0 | 192 | R_InitRenderCmds | `push ecx; mov eax, dword ptr [esp + 8]; cmp eax, 7; push ebx; push esi; push edi; ja 0x100` |
| r_rendercmds.obj | 0x10020ca0 | 16 | R_InitRenderCmds | `push ecx; push 0; push eax; push ecx; call 0x10020be0; add esp, 0xc; pop ecx; ret ` |
| r_rendercmds.obj | 0x10020cb0 | 16 | R_InitRenderCmds | `jmp dword ptr [0x101d4c60]` |
| r_rendercmds.obj | 0x10020cc0 | 16 | R_InitRenderCmds | `jmp dword ptr [0x101d4c5c]` |
| r_scene.obj | 0x10020ce0 | 16 | R_UpdateGfxEntityBoundsCmd | `push edi; mov edi, dword ptr [esp + 8]; call 0x10023d70; pop edi; ret ` |
| r_scene.obj | 0x10020cf0 | 16 | R_UpdateGfxEntityBoundsCmd | `ret ` |
| r_scene.obj | 0x10020d00 | 32 | R_UpdateGfxEntityBoundsCmd | `mov eax, dword ptr [0x101da9c8]; xor ecx, ecx; mov dword ptr [eax + 0x249d0c], ecx; mov dw` |
| r_scene.obj | 0x10020d20 | 48 | R_UpdateGfxEntityBoundsCmd | `mov eax, dword ptr [0x101d49c4]; test eax, eax; je 0x10020d43; push eax; mov eax, dword pt` |
| r_rendercmds.obj | 0x10020e10 | 112 | R_AbortRenderCommands | `mov ecx, dword ptr [0x1042e778]; mov edx, dword ptr [ecx + 0x30000]; mov eax, 0x30000; sub` |
| r_rendercmds.obj | 0x10020e80 | 64 | R_AbortRenderCommands | `mov eax, dword ptr [0x1042e778]; mov ecx, dword ptr [eax + 0x30008]; push ebx; mov ebx, dw` |
| r_rendercmds.obj | 0x10021040 | 144 | R_IssueDelayedDrawing | `mov eax, dword ptr [0x101d4d1c]; inc eax; mov dword ptr [0x101da9c8], 0x1042e780; mov dwor` |
| r_rendercmds.obj | 0x100210d0 | 48 | R_IssueDelayedDrawing | `mov ecx, dword ptr [0x101da9c8]; mov edx, dword ptr [ecx + 0x217c7c]; mov eax, edx; imul e` |
| r_rendercmds.obj | 0x10021770 | 208 | R_AddCmdSetMaterialColor | `mov edx, dword ptr [0x1042e778]; push esi; mov esi, dword ptr [edx + 0x30000]; mov eax, 0x` |
| r_rendercmds.obj | 0x10021900 | 16 | R_AddCmdDrawSurfs | `push 0; push eax; push ecx; push edx; call 0x10021890; add esp, 0x10; ret ` |
| r_rendercmds.obj | 0x10021910 | 16 | R_AddCmdDrawSurfs | `push 1; push eax; push ecx; push edx; call 0x10021890; add esp, 0x10; ret ` |
| r_rendercmds.obj | 0x10021980 | 80 | R_AddCmdDrawSun | `mov eax, dword ptr [0x1042e778]; mov edx, dword ptr [eax + 0x30000]; mov ecx, 0x30000; sub` |
| r_rendercmds.obj | 0x100219d0 | 144 | R_AddCmdDrawSun | `mov eax, dword ptr [0x1042e778]; push esi; push edi; mov edi, dword ptr [eax + 0x30000]; m` |
| r_rendercmds.obj | 0x10021a60 | 128 | R_AddCmdDrawSun | `mov eax, dword ptr [0x101d4964]; test eax, eax; je 0x10021ad3; mov eax, dword ptr [0x1042e` |
| r_rendercmds.obj | 0x10021d70 | 64 | R_ClearModifiedLightDvars | `mov eax, dword ptr [0x101ce6c8]; mov cl, byte ptr [eax + 7]; test cl, cl; push ebx; jne 0x` |
| r_rendercmds.obj | 0x10022350 | 256 | R_AddCmdBlendSavedScreen | `mov edx, dword ptr [0x1042e778]; push ebx; mov ebx, dword ptr [edx + 0x30008]; test ebx, e` |
| r_rendercmds.obj | 0x10022450 | 256 | R_AddCmdBlendSavedScreen | `mov edx, dword ptr [0x1042e778]; push ebx; mov ebx, dword ptr [edx + 0x30008]; test ebx, e` |
| r_rendercmds.obj | 0x10022550 | 368 | R_AddCmdBlendSavedScreen | `mov eax, dword ptr [esp + 4]; mov ecx, dword ptr [eax + 0x38]; mov edx, dword ptr [esp + 8` |
| r_rendercmds.obj | 0x100226c0 | 80 | R_AddCmdBlendSavedScreen | `mov eax, dword ptr [0x1042e778]; mov edx, dword ptr [eax + 0x30000]; push esi; mov esi, dw` |
| r_rendertarget.obj | 0x10022a50 | 16 | R_InitFrameBuffer | `mov eax, 0x101d4820; jmp 0x10022940` |
| r_rendertarget.obj | 0x10022b00 | 48 | R_InitRenderTargetImage | `push ebp; mov ebp, dword ptr [esp + 0xc]; push esi; push eax; mov eax, dword ptr [esp + 0x` |
| r_rendertarget.obj | 0x10022b30 | 96 | R_InitRenderTargetImage | `mov eax, dword ptr [0x101d4c6c]; mov ecx, edi; sar eax, cl; push ebp; mov ebp, dword ptr [` |
| r_rendertarget.obj | 0x10023610 | 16 | R_ShutdownRenderTargets | `fld dword ptr [esp + 4]; fptan ; fstp st(0); ret ` |
| r_rendertarget.obj | 0x10023620 | 16 | R_ShutdownRenderTargets | `fld dword ptr [esp + 4]; fptan ; fstp st(0); ret ` |
| r_scene.obj | 0x10023670 | 80 | I_fmax | `push ecx; movzx edx, byte ptr [ecx]; mov dword ptr [esp], edx; fild dword ptr [esp]; fmul ` |
| rb_fog.obj | 0x10023710 | 32 | R_ConvertPackedColorToFloat | `test eax, eax; jns 0x10023719; shr eax, 0x13; jmp 0x1002371c; shr eax, 4; and eax, 0xfff; ` |
| rb_fog.obj | 0x10023730 | 48 | R_ConvertPackedColorToFloat | `test eax, eax; jns 0x10023744; shr eax, 9; and eax, 0x3ff; mov eax, dword ptr [eax*4 + 0x1` |
| rb_fog.obj | 0x10023760 | 16 | R_ConvertPackedColorToFloat | `push edi; mov ecx, 0xd; xor eax, eax; mov edi, edx; rep stosd dword ptr es:[edi], eax; pop` |
| rb_fog.obj | 0x10023770 | 16 | R_ConvertPackedColorToFloat | `push edi; mov ecx, 0x1d; xor eax, eax; mov edi, edx; rep stosd dword ptr es:[edi], eax; po` |
| rb_fog.obj | 0x10023780 | 336 | R_ConvertPackedColorToFloat | `mov edx, dword ptr [esp + 4]; fld dword ptr [0x1019bc84]; mov eax, dword ptr [0x10678510];` |
| r_scene.obj | 0x10023920 | 464 | R_CountMatchingSceneEntities | `mov eax, 0x2028; call 0x100f8830; mov ecx, dword ptr [0x1067850c]; xor eax, eax; test ecx,` |
| r_scene.obj | 0x10023cc0 | 176 | R_AddStaticModelToScene | `push ebx; call 0x10023af0; mov ebx, eax; test ebx, ebx; jge 0x10023cd0; xor eax, eax; pop ` |
| r_scene.obj | 0x10023ed0 | 256 | R_ResetEntries | `mov al, byte ptr [0x101d4d00]; test al, al; je 0x10023fc4; push esi; mov esi, dword ptr [e` |
| r_scene.obj | 0x10024280 | 48 | R_UpdateFrameFog | `mov eax, dword ptr [0x101ce814]; fld dword ptr [eax + 8]; fld dword ptr [0x1019bde8]; fsub` |
| r_scene.obj | 0x100242b0 | 48 | R_UpdateFrameFog | `mov eax, dword ptr [esp + 0xc]; mov ecx, dword ptr [esp + 8]; mov edx, dword ptr [esp + 4]` |
| r_scene.obj | 0x100242e0 | 48 | R_UpdateFrameFog | `lea edx, [esi + 0xc8]; lea eax, [esi + 0x88]; lea ecx, [esi + 0x48]; call 0x1005a880; lea ` |
| r_scene.obj | 0x10024310 | 112 | R_UpdateFrameFog | `mov edx, eax; and edx, 0x80000000; mov ecx, eax; je 0x10024321; shr ecx, 0x13; jmp 0x10024` |
| r_scene.obj | 0x10024380 | 128 | R_UpdateFrameFog | `push ebx; push edi; mov edi, eax; mov eax, dword ptr [0x101da9c8]; mov edx, dword ptr [eax` |
| r_scene.obj | 0x10024400 | 32 | R_UpdateFrameFog | `push esi; push eax; mov eax, dword ptr [esp + 0xc]; mov esi, 0x1f; call 0x10024380; add es` |
| r_scene.obj | 0x10024420 | 32 | R_UpdateFrameFog | `mov ecx, dword ptr [eax + 8]; push esi; movzx esi, word ptr [eax + 4]; mov eax, dword ptr ` |
| r_scene.obj | 0x10024440 | 32 | R_UpdateFrameFog | `mov edx, dword ptr [ecx]; push esi; mov esi, dword ptr [ecx + 4]; push edi; mov edi, dword` |
| r_scene.obj | 0x100245e0 | 32 | qsortDrawSurfs | `mov eax, dword ptr [0x101ce708]; mov ecx, dword ptr [eax + 8]; xor eax, eax; cmp ecx, 2; j` |
| r_scene.obj | 0x10024600 | 16 | qsortDrawSurfs | `jmp 0x100244b0` |
| r_scene.obj | 0x10024610 | 112 | qsortDrawSurfs | `mov ecx, dword ptr [0x101ce654]; mov dword ptr [eax + 0xc], 5; mov dl, byte ptr [ecx + 8];` |
| r_scene.obj | 0x10024680 | 304 | qsortDrawSurfs | `sub esp, 0xc; mov edx, dword ptr [esp + 0x10]; mov ecx, dword ptr [0x10678510]; push ebx; ` |
| r_scene.obj | 0x100247b0 | 32 | qsortDrawSurfs | `mov eax, dword ptr [0x101d1b9c]; test eax, eax; je 0x100247c8; mov ecx, dword ptr [eax + 0` |
| r_scene.obj | 0x100247d0 | 336 | qsortDrawSurfs | `mov eax, dword ptr [0x101ce694]; mov cl, byte ptr [eax + 8]; test cl, cl; je 0x100247ea; m` |
| r_scene.obj | 0x100249c0 | 112 | R_GetClearColor | `mov eax, dword ptr [0x101d4818]; sub esp, 0x10; test eax, eax; push esi; je 0x100249fb; mo` |
| r_scene.obj | 0x10024a30 | 16 | R_GetClearColor | `push eax; call 0x100249c0; pop ecx; ret ` |
| r_scene.obj | 0x10024a80 | 16 | R_ClearFloatZ | `mov ecx, dword ptr [0x101d4818]; xor eax, eax; test ecx, ecx; sete al; ret ` |
| r_scene.obj | 0x10024a90 | 464 | R_ClearFloatZ | `push ebp; mov ebp, dword ptr [esp + 8]; push esi; push edi; mov edi, eax; mov eax, dword p` |
| r_scene.obj | 0x10024c60 | 32 | R_ClearFloatZ | `mov eax, dword ptr [0x101ce708]; cmp dword ptr [eax + 8], 2; jne 0x10024c6e; xor al, al; r` |
| r_scene.obj | 0x10024c80 | 272 | R_ClearFloatZ | `mov ecx, dword ptr [0x10678500]; sub esp, 0x10; push ebp; mov ebp, dword ptr [esp + 0x1c];` |
| r_scene.obj | 0x10024d90 | 464 | R_ClearFloatZ | `mov eax, dword ptr [0x10696c98]; sub esp, 0x10; cmp eax, -1; push ebp; mov ebp, dword ptr ` |
| r_scene.obj | 0x10024f60 | 224 | R_ClearFloatZ | `mov ecx, dword ptr [0x10678500]; sub esp, 0x10; push esi; push edi; push eax; push ecx; mo` |
| r_scene.obj | 0x10025040 | 704 | R_ClearFloatZ | `push ebx; push ebp; mov ebp, dword ptr [esp + 0xc]; push esi; mov esi, dword ptr [esp + 0x` |
| r_scene.obj | 0x10025380 | 400 | R_RenderSceneMode | `push ebp; mov ebp, esp; and esp, 0xfffffff8; mov eax, 0x16ec; call 0x100f8830; push ebx; p` |
| r_scene.obj | 0x10025690 | 48 | R_SetViewParmsForScene | `mov edx, dword ptr [ecx + 0x50]; push esi; mov esi, dword ptr [0x101d4c6c]; mov dword ptr ` |
| r_scene.obj | 0x100257a0 | 384 | R_SetLodOrigin | `mov al, byte ptr [0x101d4d00]; sub esp, 8; test al, al; je 0x1002590f; mov eax, dword ptr ` |
| r_screenshot.obj | 0x100259a0 | 368 | R_ScreenshotFilename | `sub esp, 0x44; fild dword ptr [esp + 0x48]; push ebx; push ebp; mov ebp, dword ptr [esp + ` |
| r_screenshot.obj | 0x10025d10 | 368 | R_UpsamplePixelData | `mov edx, dword ptr [esp + 4]; sub esp, 0xc; cmp edx, edi; push ebx; push ebp; jle 0x10025d` |
| r_screenshot.obj | 0x100265e0 | 272 | R_ScreenShotCmd | `sub esp, 0xc; movzx ecx, word ptr [0x101d4928]; mov dword ptr [esp], ecx; lea eax, [eax + ` |
| r_screenshot.obj | 0x10026760 | 80 | R_FlipCubemapShot | `movzx edx, word ptr [0x101d4928]; push edi; mov edi, eax; movzx eax, word ptr [0x101d492a]` |
| r_screenshot.obj | 0x100267b0 | 48 | R_FlipCubemapShot | `push esi; xor ecx, ecx; mov esi, eax; mov dword ptr [esi], ecx; mov dword ptr [esi + 4], e` |
| r_screenshot.obj | 0x100267e0 | 96 | R_FlipCubemapShot | `mov dx, word ptr [0x101d4928]; movzx eax, dx; push ebp; xor ebp, ebp; test eax, eax; jle 0` |
| r_screenshot.obj | 0x10026a40 | 16 | R_ClearForCubemapShot | `xor eax, eax; jmp 0x1003ea30` |
| r_screenshot.obj | 0x10026ab0 | 128 | R_SaveCubemapShot | `fld dword ptr [esp + 4]; lea eax, [eax + eax*8 + 9]; shl eax, 2; fmul dword ptr [eax + 0x1` |
| r_screenshot.obj | 0x10026b30 | 816 | R_SaveCubemapShot | `sub esp, 0x40; push ebx; push ebp; xor eax, eax; push esi; push edi; mov dword ptr [esp + ` |
| r_screenshot.obj | 0x10026e60 | 384 | R_SaveCubemapShot | `sub esp, 0x24; push ebx; push ebp; push esi; push edi; xor edi, edi; mov dword ptr [esp + ` |
| r_screenshot.obj | 0x100270e0 | 144 | R_CubemapShotExtractLinearLight | `sub esp, 0x18; push esi; movzx esi, word ptr [0x101d4928]; imul esi, esi; lea eax, [esi + ` |
| r_shadowcookie.obj | 0x10027190 | 32 | R_CompareShadowCandidates | `mov eax, esi; mov ecx, edi; call 0x100244b0; mov eax, dword ptr [esp + 4]; push 0; push ea` |
| r_shadowcookie.obj | 0x100271b0 | 224 | R_CompareShadowCandidates | `sub esp, 8; mov eax, dword ptr [0x101d1b9c]; fld dword ptr [eax + 0xb8]; add eax, 0xb8; fc` |
| r_shadowcookie.obj | 0x10027290 | 688 | R_CompareShadowCandidates | `sub esp, 0x4c; push ebx; push ebp; mov ebp, dword ptr [esp + 0x5c]; push edi; lea edi, [es` |
| r_shadowcookie.obj | 0x10027540 | 80 | R_CompareShadowCandidates | `xor edx, edx; add ecx, 4; movzx eax, byte ptr [ecx + 0xc]; fld dword ptr [eax + esi]; movz` |
| r_shadowcookie.obj | 0x10027590 | 320 | R_CompareShadowCandidates | `sub esp, 0x68; mov eax, dword ptr [0x10678ab8]; mov dword ptr [ebx + 8], eax; mov eax, dwo` |
| r_shadowcookie.obj | 0x100276d0 | 512 | R_CompareShadowCandidates | `sub esp, 8; push ebx; mov ebx, dword ptr [0x10678510]; push ebp; push esi; mov esi, dword ` |
| r_shadowcookie.obj | 0x100278d0 | 32 | R_CompareShadowCandidates | `push 0; push 0x3f800000; push eax; push 7; call 0x10022220; add esp, 0x10; ret ` |
| r_shadowcookie.obj | 0x100278f0 | 64 | R_CompareShadowCandidates | `mov eax, dword ptr [0x101ce708]; cmp dword ptr [eax + 8], 2; je 0x10027924; mov ecx, dword` |
| r_shadowcookie.obj | 0x10027930 | 848 | R_CompareShadowCandidates | `mov eax, dword ptr [0x10696c60]; sub esp, 0x1c; cmp eax, -1; je 0x10027944; mov ecx, 1; jm` |
| r_shadowcookie.obj | 0x10027c80 | 128 | R_CompareShadowCandidates | `sub esp, 0x44; fild dword ptr [0x101d4c6c]; push esi; push edi; lea eax, [esp + 0xc]; fstp` |
| r_shadowcookie.obj | 0x10027f40 | 416 | R_PopulateCandidates | `sub esp, 0x18; mov eax, dword ptr [0x101ce76c]; fld dword ptr [0x1019bc78]; push ebx; push` |
| r_shadowcookie.obj | 0x100280e0 | 64 | R_PopulateCandidates | `sub esp, 0xc4; lea eax, [esp]; push eax; push esi; call 0x10027d00; push 0x10027170; push ` |
| r_shadowcookie.obj | 0x10028120 | 48 | R_PopulateCandidates | `push edi; mov edi, 0x10696bd0; xor ecx, ecx; mov eax, 8; mov dword ptr [0x10696bd0], 0x412` |
| r_shadowcookie.obj | 0x10028570 | 192 | $_Insertion_sort | `mov edx, dword ptr [ecx]; mov ecx, dword ptr [esp + 4]; mov dword ptr [eax], edx; mov edx,` |
| r_shadowcookie.obj | 0x10028630 | 32 | $_Median | `mov edx, dword ptr [ecx]; push esi; mov esi, dword ptr [ecx + 4]; push edi; mov edi, dword` |
| r_shadowcookie.obj | 0x10028650 | 16 | $_Median | `xor eax, eax; ret ` |
| r_shadowcookie.obj | 0x10028660 | 16 | $_Median | `xor eax, eax; ret ` |
| r_shadowcookie.obj | 0x10028790 | 32 | $_Med3 | `mov edx, dword ptr [ecx]; push esi; mov esi, dword ptr [ecx + 4]; push edi; mov edi, dword` |
| r_shadowcookie.obj | 0x10028870 | 16 | $_Pop_heap_0 | `ret ` |
| r_shadowcookie.obj | 0x10028880 | 16 | $_Pop_heap_0 | `push eax; mov eax, dword ptr [esp + 8]; call 0x10028930; pop ecx; ret ` |
| r_shadowcookie.obj | 0x100289f0 | 16 | $_Rotate | `fld dword ptr [esp + 4]; fcos ; ret ` |
| r_shadowcookie.obj | 0x10028a00 | 16 | $_Rotate | `mov eax, 0x15; ret ` |
| r_sky_load_obj.obj | 0x10029310 | 16 | R_LoadSun | `fld dword ptr [esp + 4]; fldln2 ; fxch st(1); fyl2x ; ret ` |
| r_staticmodel_load_obj.obj | 0x100296f0 | 96 | R_GetMaxModelSurfaceCount | `mov edx, dword ptr [0x101d1b9c]; push ebx; push ebp; lea eax, [ecx + ecx*2]; push esi; mov` |
| r_staticmodel_load_obj.obj | 0x10029750 | 48 | R_GetMaxModelSurfaceCount | `fld dword ptr [edx]; fadd dword ptr [ecx]; fmul dword ptr [0x1019bcb0]; fstp dword ptr [ea` |
| r_staticmodel_load_obj.obj | 0x1002a200 | 80 | R_AddStaticModelToAabbTree_r | `mov edx, dword ptr [esi + 0xf8]; imul eax, eax, 0x3c; push edi; add eax, dword ptr [esi + ` |
| r_staticmodel_load_obj.obj | 0x1002a250 | 272 | R_AddStaticModelToAabbTree_r | `sub esp, 0x18; push ebx; mov ebx, dword ptr [esp + 0x28]; push ebp; push esi; push edi; mo` |
| r_staticmodel_load_obj.obj | 0x1002a360 | 448 | R_AddStaticModelToAabbTree_r | `sub esp, 0x18; push ebx; mov ebx, eax; mov eax, 0x7f7fffff; mov dword ptr [edi], eax; mov ` |
| r_staticmodel_load_obj.obj | 0x1002a780 | 224 | R_GetStaticModelLightingFromGround | `push ecx; push esi; mov esi, eax; mov eax, dword ptr [0x101ce708]; push edi; mov edi, ecx;` |
| r_staticmodel_load_obj.obj | 0x1002a860 | 224 | R_GetStaticModelLightingFromGround | `mov eax, dword ptr [0x101ce708]; cmp dword ptr [eax + 8], 2; push ebp; mov ebp, dword ptr ` |
| r_staticmodelcache.obj | 0x1002adb0 | 784 | SMC_AllocCachedSurface | `sub esp, 0x38; mov edx, dword ptr [esp + 0x40]; push ebx; mov ebx, dword ptr [esp + 0x48];` |
| r_staticmodelcache.obj | 0x1002b0c0 | 768 | SMC_AllocCachedSurface | `sub esp, 0x20; fld dword ptr [0x1019bc84]; push ebx; fld dword ptr [0x1019bc84]; push ebp;` |
| r_staticmodelcache.obj | 0x1002b3c0 | 624 | SMC_AllocCachedSurface | `sub esp, 0x36c; push ebx; push ebp; mov ebp, dword ptr [esp + 0x378]; push esi; push edi; ` |
| r_staticmodelcache.obj | 0x1002b630 | 96 | SMC_AllocCachedSurface | `push ebp; mov ebp, esp; and esp, 0xfffffff8; push ecx; mov ecx, dword ptr [ebp + 0x10]; pu` |
| r_staticmodelcache.obj | 0x1002b690 | 256 | SMC_AllocCachedSurface | `push ebp; mov ebp, esp; and esp, 0xfffffff0; sub esp, 0x74; mov eax, dword ptr [ebp + 8]; ` |
| r_staticmodelcache.obj | 0x1002b7f0 | 208 | R_CopyCachedSurfaceIndices | `mov al, byte ptr [0x101d492c]; sub esp, 0xc; test al, al; push ebp; mov ebp, dword ptr [es` |
| r_staticmodelcache.obj | 0x1002bb60 | 48 | R_FlushStaticModelCache | `call 0x1002baf0; mov eax, dword ptr [0x101d49b4]; test eax, eax; je 0x1002bb87; mov edi, e` |
| r_staticmodelcache.obj | 0x1002bbf0 | 16 | R_StaticModelCacheStats_f | `jmp 0x1002baf0` |
| r_staticmodelcache.obj | 0x1002bc00 | 64 | R_StaticModelCacheStats_f | `mov ecx, dword ptr [eax + 4]; mov edx, dword ptr [eax]; mov dword ptr [ecx], edx; mov ecx,` |
| r_staticmodelcache.obj | 0x1002bc40 | 32 | R_StaticModelCacheStats_f | `mov dword ptr [eax], ecx; mov edx, dword ptr [ecx + 4]; mov dword ptr [eax + 4], edx; mov ` |
| r_utils.obj | 0x1002c010 | 80 | R_HashString | `mov eax, dword ptr [0x101d1b9c]; mov ecx, dword ptr [eax + 0xc]; cmp dword ptr [ecx], -1; ` |
| r_utils.obj | 0x1002c060 | 80 | R_HashString | `push ecx; xor edx, edx; test esi, esi; jle 0x1002c09c; fld dword ptr [esp + 8]; add ecx, 4` |
| r_utils.obj | 0x1002c330 | 64 | R_PickMaterial | `mov eax, esi; lea edx, [eax + 1]; mov cl, byte ptr [eax]; inc eax; test cl, cl; jne 0x1002` |
| r_utils.obj | 0x1002c370 | 208 | R_PickMaterial | `sub esp, 0x10; fld dword ptr [esp + 0x1c]; fabs ; fst dword ptr [esp + 0x1c]; call 0x100f8` |
| r_utils.obj | 0x1002c440 | 16 | R_PickMaterial | `push eax; call dword ptr [0x101d4a10]; mov dword ptr [esi], eax; add esp, 4; mov eax, esi;` |
| r_utils.obj | 0x1002c450 | 16 | R_PickMaterial | `mov ecx, dword ptr [eax]; push ecx; call dword ptr [0x101d4a14]; pop ecx; ret ` |
| r_utils.obj | 0x1002c460 | 16 | R_PickMaterial | `mov ecx, dword ptr [eax]; push ecx; call dword ptr [0x101d4a18]; add esp, 4; ret ` |
| r_utils.obj | 0x1002c470 | 256 | R_PickMaterial | `sub esp, 0x18; mov eax, dword ptr [esi + 0x10]; cdq ; sub eax, edx; sar eax, 1; push ebx; ` |
| r_utils.obj | 0x1002c570 | 176 | R_PickMaterial | `mov eax, dword ptr [esi + 0x10]; push ebx; push ebp; xor ebp, ebp; cmp eax, 1; push edi; j` |
| r_utils.obj | 0x1002c620 | 400 | R_PickMaterial | `sub esp, 0x44; push ebx; push ebp; mov ebp, dword ptr [esp + 0x50]; mov edx, dword ptr [eb` |
| r_water.obj | 0x1002c910 | 240 | R_WaterHeightMap | `push ecx; mov eax, dword ptr [0x106d3194]; mov eax, dword ptr [eax]; push ebx; push ebp; m` |
| r_water.obj | 0x1002ca00 | 32 | R_WaterHeightMap | `fld dword ptr [esp + 4]; fldl2e ; fmulp st(1); fld st(0); frndint ; fxch st(1); fsub st(1)` |
| r_water.obj | 0x1002ca20 | 32 | R_WaterHeightMap | `fld dword ptr [esp + 4]; fldl2e ; fmulp st(1); fld st(0); frndint ; fxch st(1); fsub st(1)` |
| com_convexhull.obj | 0x1002ca50 | 688 | Dot2Product | `push ecx; mov eax, dword ptr [edx + 0xc]; cmp eax, dword ptr [ecx + 0xc]; jne 0x1002cb3c; ` |
| r_water_load_obj.obj | 0x1002cd00 | 128 | R_PickWaterFrequencies | `push ebp; mov ebp, dword ptr [esp + 8]; mov eax, dword ptr [ebp + 0xc]; imul eax, dword pt` |
| r_xsurface.obj | 0x1002cec0 | 16 | XSurfaceGetTris | `mov eax, dword ptr [eax + 0xc]; ret ` |
| r_xsurface.obj | 0x1002ced0 | 16 | XSurfaceGetTris | `movsx eax, word ptr [eax + 6]; ret ` |
| r_xsurface.obj | 0x1002cee0 | 736 | XSurfaceGetTris | `push ecx; mov ecx, dword ptr [esp + 8]; movsx edx, word ptr [ecx + 6]; cmp edx, -1; mov ea` |
| r_xsurface.obj | 0x1002d3e0 | 16 | XSurfaceTransferDx7 | `mov ecx, dword ptr [edx]; mov ax, word ptr [ecx]; add ecx, 2; mov dword ptr [edx], ecx; re` |
| r_xsurface.obj | 0x1002d3f0 | 16 | XSurfaceTransferDx7 | `mov ecx, dword ptr [edx]; mov ax, word ptr [ecx]; add ecx, 2; mov dword ptr [edx], ecx; re` |
| r_xsurface_load_obj.obj | 0x1002d4a0 | 1520 | XModelReadBlendInfo | `sub esp, 0x14; push ebx; push ebp; push esi; push edi; push 0x18; call dword ptr [esp + 0x` |
| r_xsurface_load_obj.obj | 0x1002da90 | 192 | XModelReadBlendInfo | `push ecx; mov eax, dword ptr [edi + 0x10]; test eax, eax; push ebp; mov ebp, dword ptr [es` |
| r_xsurface_optimize.obj | 0x1002dcf0 | 176 | XModelOptimize | `sub esp, 0x10; mov eax, dword ptr [esp + 0x14]; push ebx; push esi; push eax; call dword p` |
| r_xsurface_optimize.obj | 0x1002dda0 | 32 | XModelOptimize | `fld dword ptr [esp + 4]; sub esp, 8; fstp qword ptr [esp]; call 0x100f6670; add esp, 8; re` |
| r_xsurface_optimize.obj | 0x1002ddc0 | 16 | XModelOptimize | `mov eax, ecx; sar eax, 0x1f; not eax; and eax, ecx; ret ` |
| r_xsurface_optimize.obj | 0x1002ddd0 | 32 | XModelOptimize | `push eax; push ecx; fld dword ptr [esp + 0xc]; fsincos ; mov ecx, dword ptr [esp + 0x14]; ` |
| r_xsurface_optimize.obj | 0x1002ddf0 | 32 | XModelOptimize | `fld dword ptr [esp + 4]; fmul dword ptr [ecx]; fstp dword ptr [eax]; fld dword ptr [esp + ` |
| r_xsurface_optimize.obj | 0x1002de10 | 48 | XModelOptimize | `push ecx; mov dl, byte ptr [ecx + 3]; push ebx; mov bl, byte ptr [ecx + 2]; mov byte ptr [` |
| r_xsurface_optimize.obj | 0x1002de40 | 32 | XModelOptimize | `push ecx; mov byte ptr [esp + 2], al; mov al, byte ptr [esp + 8]; mov byte ptr [esp + 1], ` |
| r_xsurface_optimize.obj | 0x1002de60 | 16 | XModelOptimize | `rdtsc ; ret ` |
| r_xsurface_optimize.obj | 0x1002de70 | 32 | XModelOptimize | `push ecx; mov eax, dword ptr [0x1072d9d0]; test eax, eax; jne 0x1002de83; mov eax, dword p` |
| r_xsurface_optimize.obj | 0x1002de90 | 48 | XModelOptimize | `mov edx, dword ptr [ecx]; add eax, -0x80; shl eax, 4; add eax, 0x1072da00; mov dword ptr [` |
| r_xsurface_optimize.obj | 0x1002dec0 | 16 | XModelOptimize | `add eax, -0x80; shl eax, 4; add eax, 0x1072da00; ret ` |
| r_xsurface_optimize.obj | 0x1002ded0 | 64 | XModelOptimize | `push esi; push edi; mov esi, eax; mov eax, dword ptr [0x1072d9bc]; mov edi, ecx; cmp eax, ` |
| r_xsurface_optimize.obj | 0x1002df10 | 48 | XModelOptimize | `push ecx; cmp dword ptr [0x1072d9cc], esi; je 0x1002df36; mov eax, dword ptr [0x1072d9d0];` |
| rb_backend.obj | 0x1002dfd0 | 16 | RB_CheckOverflow | `mov dword ptr [0x1073055c], eax; ret ` |
| rb_backend.obj | 0x1002dfe0 | 32 | RB_CheckOverflow | `push esi; mov esi, eax; cmp dword ptr [0x1076674c], esi; je 0x1002dff0; call 0x1003ecb0; p` |
| rb_backend.obj | 0x1002e000 | 16 | RB_CheckOverflow | `movzx eax, word ptr [ecx + 2]; add eax, ecx; ret ` |
| rb_backend.obj | 0x1002e010 | 16 | RB_CheckOverflow | `mov eax, dword ptr [ecx]; movzx edx, word ptr [eax + 2]; add edx, eax; mov dword ptr [ecx]` |
| rb_backend.obj | 0x1002e020 | 864 | RB_CheckOverflow | `mov eax, dword ptr [0x1072d9d0]; sub esp, 0x9c; test eax, eax; push ebx; push ebp; push es` |
| rb_backend.obj | 0x1002e470 | 224 | RB_Set3D | `push esi; mov esi, ecx; mov ecx, dword ptr [0x101ce708]; mov edx, dword ptr [ecx + 8]; mov` |
| rb_backend.obj | 0x1002e550 | 240 | RB_Set3D | `push esi; mov esi, ecx; mov ecx, dword ptr [0x101ce708]; mov edx, dword ptr [ecx + 8]; mov` |
| rb_backend.obj | 0x1002e640 | 256 | RB_Set3D | `mov ecx, dword ptr [0x101ce708]; cmp dword ptr [ecx + 8], 2; jne 0x1002e6b3; fld dword ptr` |
| rb_backend.obj | 0x1002e740 | 272 | RB_Set3D | `mov edx, dword ptr [0x101ce708]; mov ecx, dword ptr [esp + 0x28]; cmp dword ptr [edx + 8],` |
| rb_backend.obj | 0x1002e9e0 | 64 | RB_DrawStretchPic | `mov eax, dword ptr [esp + 0x14]; fild dword ptr [0x10766720]; mov ecx, dword ptr [esp + 0x` |
| rb_backend.obj | 0x1002ea20 | 64 | RB_DrawStretchPic | `push ecx; fild dword ptr [0x10766720]; push 0x3f800000; push 0x3f800000; push 0; push 0; s` |
| rb_backend.obj | 0x1002ea60 | 64 | RB_DrawStretchPic | `fild dword ptr [0x10766720]; push ebx; push 0x3f800000; push 0x3f800000; push 0; push 0; s` |
| rb_backend.obj | 0x1002ec00 | 640 | RB_StretchPicCmd | `push ebp; mov ebp, esp; and esp, 0xfffffff8; sub esp, 0x2c; mov al, byte ptr [0x1072debd];` |
| rb_backend.obj | 0x1002ee80 | 576 | RB_StretchPicCmd | `push ebp; mov ebp, esp; and esp, 0xfffffff8; push ecx; mov al, byte ptr [0x1072debd]; test` |
| rb_backend.obj | 0x1002f110 | 336 | RB_DrawFullScreenColoredQuadCmd | `sub esp, 0x24; push ebx; mov ebx, dword ptr [esp + 0x3c]; push esi; push edi; push 0; lea ` |
| rb_backend.obj | 0x1002f2a0 | 144 | RB_StretchRawCmd | `sub esp, 0x18; fld dword ptr [esp + 0x1c]; sub esp, 8; fstp qword ptr [esp]; call 0x100f66` |
| rb_backend.obj | 0x1002f330 | 192 | RB_StretchRawCmd | `cmp eax, 6; push esi; jne 0x1002f376; cmp edx, 0x1f; jne 0x1002f376; cmp ecx, 0x7fe; jne 0` |
| rb_backend.obj | 0x1002f3f0 | 32 | RB_StretchRawCmd | `mov eax, dword ptr [0x101ce7bc]; mov cl, byte ptr [eax + 8]; test cl, cl; jne 0x1002f409; ` |
| rb_backend.obj | 0x1002f410 | 32 | RB_StretchRawCmd | `cmp eax, -1; jne 0x1002f418; xor al, al; ret ; mov edx, dword ptr [ecx + 0x38]; mov ecx, d` |
| rb_backend.obj | 0x1002f430 | 1232 | RB_StretchRawCmd | `sub esp, 0x34; mov edx, dword ptr [esp + 0x38]; push ebx; push ebp; push esi; xor esi, esi` |
| rb_backend.obj | 0x1002f900 | 112 | RB_StretchRawCmd | `push ebp; mov ebp, esp; and esp, 0xfffffff8; push ecx; mov eax, dword ptr [ebp + 8]; push ` |
| rb_backend.obj | 0x1002f990 | 192 | RB_DrawSunCmd | `mov eax, dword ptr [0x1072d9d0]; push ebx; xor ebx, ebx; cmp eax, ebx; push esi; push edi;` |
| rb_backend.obj | 0x1002faf0 | 624 | RB_SetStencilRefValueCmd | `push ebp; mov ebp, esp; and esp, 0xfffffff8; sub esp, 0x1c; mov eax, dword ptr [ebp + 8]; ` |
| rb_backend.obj | 0x1002fd60 | 272 | RB_SetStencilRefValueCmd | `mov ecx, dword ptr [0x107667d4]; push ebp; mov ebp, dword ptr [esp + 8]; push esi; push ed` |
| rb_backend.obj | 0x1002ff80 | 528 | RB_ClearScreenCmd | `sub esp, 0x24; fild dword ptr [0x1076671c]; mov eax, dword ptr [0x1072dbb0]; mov ecx, dwor` |
| rb_backend.obj | 0x10030190 | 288 | RB_ClearScreenCmd | `sub esp, 0x14; fild dword ptr [0x1076671c]; push ebx; push ebp; push esi; fmul dword ptr [` |
| rb_backend.obj | 0x100302b0 | 272 | RB_ClearScreenCmd | `mov eax, dword ptr [0x101d489c]; sub esp, 0x18; test eax, eax; push ebx; je 0x100303ba; fi` |
| rb_backend.obj | 0x100303c0 | 272 | RB_ClearScreenCmd | `sub esp, 0x18; fild dword ptr [0x1076671c]; mov eax, dword ptr [0x1072dbb0]; mov ecx, dwor` |
| rb_backend.obj | 0x100305d0 | 224 | RB_DrawGlowImages | `mov dword ptr [ecx], 0; mov eax, dword ptr [0x101ce6e8]; fld dword ptr [eax + 8]; fcomp dw` |
| rb_backend.obj | 0x10030700 | 16 | RB_GenerateGlowImages | `fidiv word ptr [edx + 0x10]; call 0x10035740; pop ebx; add esp, 0x10; ret ` |
| rb_backend.obj | 0x10030710 | 208 | RB_GenerateGlowImages | `sub esp, 0x1c; push ebx; push 0x40400000; call dword ptr [0x101d4c0c]; fstp dword ptr [esp` |
| rb_backend.obj | 0x10030840 | 64 | RB_SetGammaRamp | `mov eax, dword ptr [0x101ce708]; cmp dword ptr [eax + 8], 2; je 0x10030875; mov ecx, dword` |
| rb_backend.obj | 0x10030880 | 64 | RB_SetGammaRamp | `mov eax, dword ptr [0x101ce708]; cmp dword ptr [eax + 8], 2; je 0x10030894; mov al, byte p` |
| rb_backend.obj | 0x10030a20 | 32 | RB_BlurShadowCookieCmd | `mov eax, dword ptr [0x101ce7a4]; fld dword ptr [eax + 8]; fld st(0); fmulp st(1); fld dwor` |
| rb_backend.obj | 0x10030de0 | 656 | RB_BlendSavedScreenCmd | `mov eax, dword ptr [0x101d1b38]; mov ecx, dword ptr [0x1072d9bc]; sub esp, 8; cmp ecx, eax` |
| rb_backend.obj | 0x10031070 | 944 | RB_BlendSavedScreenCmd | `mov eax, dword ptr [0x101d1b40]; mov ecx, dword ptr [0x1072d9bc]; sub esp, 0x78; cmp ecx, ` |
| rb_backend.obj | 0x10031470 | 320 | RB_DrawPointsCmd | `mov eax, dword ptr [0x101d1b38]; mov ecx, dword ptr [0x1072d9bc]; sub esp, 0xc; cmp ecx, e` |
| rb_backend.obj | 0x100315b0 | 448 | RB_DrawPointsCmd | `fnstenv [edx + 0x10]; add esp, 4; cmp eax, esi; je 0x100315d7; mov eax, dword ptr [0x1072d` |
| rb_backend.obj | 0x10031770 | 16 | RB_DrawPointsCmd | `mov ecx, dword ptr [eax + 0x30]; and ecx, 0xfffffff1; or ecx, edx; mov dword ptr [eax + 0x` |
| rb_backend.obj | 0x10031780 | 832 | RB_DrawPointsCmd | `mov eax, dword ptr [0x101d1b44]; mov ecx, dword ptr [0x1072d9bc]; sub esp, 0x8c; cmp ecx, ` |
| rb_backend.obj | 0x10031ac0 | 512 | RB_DrawPointsCmd | `fnstenv [edx + 0x10]; mov edx, dword ptr [0x1072d9d4]; fld dword ptr [esp + 0x24]; mov ecx` |
| rb_backend.obj | 0x10031cc0 | 96 | RB_DrawPointsCmd | `push ebp; mov ebp, esp; and esp, 0xfffffff8; push ecx; mov cl, byte ptr [0x1072debd]; push` |
| rb_backend.obj | 0x10031e90 | 96 | RB_DrawTriangles | `push ebx; push ebp; push esi; mov esi, dword ptr [esp + 0x10]; mov edx, dword ptr [esi]; p` |
| rb_backend.obj | 0x10031f10 | 80 | RB_TouchAllImagesCmd | `mov eax, dword ptr [0x1072d9d0]; test eax, eax; push esi; push edi; mov edi, dword ptr [es` |
| rb_backend.obj | 0x10031f60 | 384 | RB_TouchAllImagesCmd | `mov eax, dword ptr [0x1072d9d0]; test eax, eax; push esi; push edi; mov edi, dword ptr [es` |
| rb_backend.obj | 0x10032370 | 80 | RB_SetViewportCmd | `mov al, dl; sub al, 0x30; cmp al, 0xa; movzx eax, al; jb 0x10032380; mov eax, 7; movzx eax` |
| rb_backend.obj | 0x100323c0 | 64 | RB_SetViewportCmd | `mov ecx, dword ptr [eax + 0x14]; mov edx, dword ptr [eax + 0x10]; push ecx; mov ecx, dword` |
| rb_backend.obj | 0x10032560 | 752 | RB_UpdateColor | `push ebp; mov ebp, esp; and esp, 0xfffffff8; sub esp, 0x2c; fld dword ptr [ebp + 0x1c]; mo` |
| rb_backend.obj | 0x10032850 | 64 | RB_UpdateColor | `mov eax, dword ptr [esp + 0x14]; mov ecx, dword ptr [esp + 0x10]; mov edx, dword ptr [esp ` |
| rb_backend.obj | 0x10032890 | 448 | RB_UpdateColor | `push ebp; mov ebp, dword ptr [esp + 0x10]; push esi; push edi; mov edi, eax; cmp dword ptr` |
| rb_backend.obj | 0x10032a50 | 448 | RB_UpdateColor | `sub esp, 0x38; push ebx; mov ebx, eax; mov eax, dword ptr [esp + 0x44]; mov ecx, dword ptr` |
| rb_backend.obj | 0x10032e70 | 16 | RB_AdaptiveGpuSyncTarget | `mov byte ptr [0x101d4958], 0; ret ` |
| rb_backend.obj | 0x10032f80 | 16 | RB_IsGpuFenceFinished | `call 0x10032cd0; call 0x10032d10; jmp 0x10032cd0` |
| rb_backend.obj | 0x10033190 | 64 | RB_Benchmark2D | `mov eax, dword ptr [0x101ce75c]; fild dword ptr [0x10766720]; mov ecx, dword ptr [eax + 8]` |
| rb_backend.obj | 0x100331d0 | 1024 | RB_Benchmark2D | `sub esp, 0xbc; push ebx; xor ebx, ebx; push ebp; mov ebp, 0x3f800000; push esi; push edi; ` |
| rb_backend.obj | 0x10033970 | 16 | RB_TestFill | `fld dword ptr [0x1019bc84]; ret ` |
| rb_backend.obj | 0x10033980 | 16 | RB_TestFill | `fld dword ptr [0x1019bc84]; ret ` |
| rb_backend.obj | 0x10033990 | 32 | RB_TestFill | `push ecx; push 0x552; push 0; push 0; call 0x100330c0; fmul dword ptr [0x1019bf40]; add es` |
| rb_backend.obj | 0x100339b0 | 224 | RB_TestFill | `push ecx; mov eax, dword ptr [0x101d1b38]; push 0x552; push 0; push 0; call 0x100330c0; ad` |
| rb_backend.obj | 0x10033d20 | 704 | RB_UpdateBackendDvars | `push ebp; mov ebp, esp; and esp, 0xfffffff8; sub esp, 0x14; mov eax, dword ptr [0x101d0a8c` |
| rb_backend.obj | 0x10033fe0 | 48 | RB_InitBackendGlobalStructs | `mov ecx, dword ptr [esp + 4]; mov edx, dword ptr [esp + 8]; add eax, -0x80; shl eax, 4; ad` |
| rb_backend.obj | 0x10034010 | 192 | RB_InitBackendGlobalStructs | `push ebp; mov ebp, dword ptr [esp + 0xc]; push esi; push edi; mov edi, dword ptr [esp + 0x` |
| rb_backend.obj | 0x100340d0 | 32 | RB_InitBackendGlobalStructs | `push ecx; test eax, eax; je 0x100340e2; push ecx; push edx; push 1; push eax; call 0x10031` |
| rb_backend.obj | 0x100340f0 | 224 | RB_InitBackendGlobalStructs | `mov edx, dword ptr [0x101ce708]; push esi; cmp dword ptr [edx + 8], 2; mov edx, dword ptr ` |
| rb_backend.obj | 0x100341d0 | 512 | RB_InitBackendGlobalStructs | `sub esp, 0x14; push ebx; push ebp; push esi; push edi; mov edi, dword ptr [0x101d1b38]; xo` |
| rb_backend.obj | 0x100343d0 | 240 | RB_InitBackendGlobalStructs | `sub esp, 0xc; push ebx; push ebp; push esi; push edi; push 0xaa50; call dword ptr [0x101d4` |
| rb_backend.obj | 0x100344c0 | 64 | RB_InitBackendGlobalStructs | `push ecx; mov eax, dword ptr [0x106d3194]; mov ecx, dword ptr [eax + 0x249d28]; test ecx, ` |
| rb_backend.obj | 0x10034500 | 224 | RB_InitBackendGlobalStructs | `sub esp, 0xc; push ebx; push ebp; push esi; push edi; mov edi, eax; test edi, edi; mov esi` |
| rb_backend.obj | 0x100345e0 | 288 | RB_InitBackendGlobalStructs | `sub esp, 0x1c; push ebx; push esi; mov esi, eax; test esi, esi; push edi; je 0x100346ee; m` |
| rb_backend.obj | 0x10034700 | 320 | RB_InitBackendGlobalStructs | `sub esp, 0x14; mov eax, dword ptr [0x106d3194]; mov ecx, dword ptr [eax + 0x249d64]; push ` |
| rb_fog.obj | 0x10034c60 | 64 | RB_UpdateFogColor | `push ecx; mov eax, dword ptr [0x1072ddc8]; mov ecx, dword ptr [eax + 0x3c]; fild dword ptr` |
| rb_imagefilter.obj | 0x10034dc0 | 256 | RB_GaussianFilterPoints1D | `faddp st(2); fmul dword ptr [esp + 4]; fdivp st(1); fstp dword ptr [edx + ecx*4]; fstp st(` |
| rb_imagefilter.obj | 0x10034fe0 | 992 | RB_GenerateGaussianFilter1D | `sub esp, 0x40; mov eax, dword ptr [esp + 0x4c]; push ebx; mov ebx, dword ptr [esp + 0x48];` |
| rb_imagefilter.obj | 0x100353c0 | 112 | RB_GenerateGaussianFilter1D | `mov eax, dword ptr [ecx + 0x14]; sub esp, 8; xor edx, edx; test eax, eax; jle 0x1003542a; ` |
| rb_imagefilter.obj | 0x10035430 | 80 | RB_GenerateGaussianFilter1D | `mov eax, esi; and eax, 1; test esi, esi; jne 0x10035441; mov edx, dword ptr [ecx + 0x984];` |
| rb_imagefilter.obj | 0x10035480 | 16 | RB_GenerateGaussianFilter1D | `ret ` |
| rb_imagefilter.obj | 0x10035490 | 208 | RB_GenerateGaussianFilter1D | `push ebx; push ebp; mov ebp, dword ptr [esp + 0xc]; mov eax, dword ptr [ebp]; push esi; pu` |
| rb_imagefilter.obj | 0x10035560 | 192 | RB_GenerateGaussianFilter1D | `mov eax, dword ptr [0x1072ddc8]; mov edx, dword ptr [eax + 0x3c]; fild dword ptr [eax + 0x` |
| rb_imagefilter.obj | 0x10035620 | 288 | RB_GenerateGaussianFilter1D | `fld dword ptr [0x1019bc84]; sub esp, 0x9a0; fld dword ptr [esp + 0x9a4]; fucompp ; fnstsw ` |
| rb_imagefilter.obj | 0x10035740 | 208 | RB_GenerateGaussianFilter1D | `push ecx; fld dword ptr [0x1019bc84]; push esi; fld dword ptr [ebx]; push edi; fucompp ; f` |
| rb_imagefilter.obj | 0x10035810 | 64 | RB_GenerateGaussianFilter1D | `cmp dword ptr [eax], 3; push ebx; jne 0x1003584d; push 0x3f800000; push 0x3f800000; push 0` |
| rb_light.obj | 0x100359c0 | 144 | RB_DrawGridSampleBox | `sub esp, 0x28; add eax, 0xfffff000; shl eax, 5; mov dword ptr [esp], eax; fild dword ptr [` |
| rb_light.obj | 0x10035ac0 | 272 | RB_DrawGridPointBox | `mov eax, 1; shl eax, cl; mov ecx, dword ptr [esp + 4]; mov dl, byte ptr [ecx + 5]; sub esp` |
| rb_light.obj | 0x10035bd0 | 112 | RB_DrawGridPointBox | `mov eax, dword ptr [0x1076457c]; cmp eax, 0x400000; jl 0x10035bdf; xor al, al; ret ; mov e` |
| rb_light.obj | 0x10035cd0 | 672 | RB_GridVisLogIndex | `mov ecx, dword ptr [0x10764578]; sub esp, 0x4c; test ecx, ecx; push ebx; push ebp; push es` |
| rb_light.obj | 0x10035f70 | 64 | RB_GridVisLogIndex | `push esi; mov esi, edx; and esi, 0xfffffffc; shl esi, 0xb; or esi, eax; push edi; and al, ` |
| rb_light.obj | 0x100362d0 | 80 | RB_ScaleGridColors | `xor edx, edx; mov dword ptr [eax], edx; mov dword ptr [eax + 8], edx; mov ecx, 0x3f800000;` |
| rb_light.obj | 0x10036320 | 128 | RB_ScaleGridColors | `push ecx; mov eax, dword ptr [0x101d1b9c]; test eax, eax; je 0x10036336; mov eax, dword pt` |
| rb_light.obj | 0x100363a0 | 896 | RB_ScaleGridColors | `sub esp, 0x40; push ebx; push ebp; mov ebp, dword ptr [esp + 0x50]; fld dword ptr [ebp]; p` |
| rb_light.obj | 0x100373c0 | 32 | RB_FitDirectionalLight | `mov ecx, dword ptr [eax + 0x38]; mov eax, dword ptr [ecx + 0x40]; test eax, eax; jne 0x100` |
| rb_light.obj | 0x100373e0 | 64 | RB_FitDirectionalLight | `mov dword ptr [eax], 3; fld dword ptr [ecx]; fmul dword ptr [0x1019bcb0]; fstp dword ptr [` |
| rb_light.obj | 0x10037790 | 96 | RB_InitLightVisHistory | `mov eax, dword ptr [0x10764578]; sub esp, 0x40; test eax, eax; je 0x100377ea; mov ecx, dwo` |
| rb_light.obj | 0x100377f0 | 32 | RB_InitLightVisHistory | `mov eax, dword ptr [0x10764584]; test eax, eax; je 0x1003780c; push eax; call 0x100f7089; ` |
| rb_logfile.obj | 0x100381f0 | 48 | RB_LogPrintState_1 | `fld dword ptr [edx]; fadd dword ptr [ecx]; fstp dword ptr [eax]; fld dword ptr [edx + 4]; ` |
| rb_logfile.obj | 0x10038220 | 64 | RB_LogPrintState_1 | `fld dword ptr [edx]; fsub dword ptr [eax]; fmul dword ptr [esp + 4]; fadd dword ptr [eax];` |
| rb_logfile.obj | 0x10038260 | 16 | RB_LogPrintState_1 | `mov eax, dword ptr [eax + 8]; ret ` |
| rb_logfile.obj | 0x10038270 | 16 | RB_LogPrintState_1 | `mov eax, dword ptr [0x101d49b4]; ret ` |
| rb_logfile.obj | 0x10038280 | 32 | RB_LogPrintState_1 | `mov ecx, dword ptr [0x101ce708]; mov edx, dword ptr [ecx + 8]; xor eax, eax; cmp edx, 2; s` |
| rb_logfile.obj | 0x100382a0 | 48 | RB_LogPrintState_1 | `mov edx, dword ptr [ecx]; add eax, -0x80; shl eax, 4; mov dword ptr [eax + 0x1072da00], ed` |
| rb_logfile.obj | 0x100382d0 | 32 | RB_LogPrintState_1 | `mov eax, dword ptr [0x101d49a4]; mov ecx, dword ptr [eax]; add ecx, edx; cmp ecx, dword pt` |
| rb_logfile.obj | 0x100382f0 | 64 | RB_LogPrintState_1 | `mov eax, dword ptr [esi]; cmp eax, dword ptr [0x10766680]; je 0x1003830a; push eax; call 0` |
| rb_logfile.obj | 0x10038330 | 32 | RB_LogPrintState_1 | `cmp byte ptr [ecx + 0x10766715], al; jne 0x1003833c; cmp al, 2; jne 0x10038346; push eax; ` |
| rb_logfile.obj | 0x10038350 | 80 | RB_LogPrintState_1 | `mov edx, dword ptr [ecx*4 + 0x10766694]; sub esp, 0x10; cmp edx, eax; je 0x10038398; push ` |
| rb_logfile.obj | 0x100383a0 | 80 | RB_LogPrintState_1 | `mov edx, dword ptr [ecx*4 + 0x107666b4]; sub esp, 0x10; cmp edx, eax; je 0x100383e8; push ` |
| rb_logfile.obj | 0x100383f0 | 64 | RB_LogPrintState_1 | `push ebx; push esi; mov esi, dword ptr [esp + 0xc]; push edi; mov edi, eax; lea eax, [esi ` |
| rb_shade.obj | 0x100387d0 | 288 | RB_SetIndexData | `push ecx; push ebx; push ebp; push esi; push edi; mov edi, ecx; imul eax, edi; mov ebp, ea` |
| rb_shade.obj | 0x10038920 | 128 | RB_ApplyImageOverride | `push ecx; mov eax, dword ptr [edx]; cmp dword ptr [eax], 3; jne 0x1003897f; movzx ecx, byt` |
| rb_shade.obj | 0x100389a0 | 704 | RB_ApplyImageOverride | `cmp ebx, 0x17; ja 0x10038b96; jmp dword ptr [ebx*4 + 0x10038ba0]; mov eax, dword ptr [0x10` |
| rb_shade.obj | 0x100393b0 | 240 | RB_ChangePixelShaderConstants | `push ecx; test eax, eax; push esi; mov esi, ecx; jle 0x10039492; push ebx; push ebp; mov d` |
| rb_shade.obj | 0x100394a0 | 368 | RB_ChangePixelShaderConstants | `sub esp, 0x18; test eax, eax; push ebx; push ebp; mov ebp, dword ptr [esp + 0x24]; push es` |
| rb_shade.obj | 0x100396d0 | 688 | RB_EvaluateStateMap | `mov ecx, dword ptr [edi + 4]; sub esp, 0xc; push ebx; push ebp; push esi; mov esi, eax; mo` |
| rb_shade.obj | 0x10039980 | 80 | RB_EvaluateStateMap | `sub esp, 0xc; cmp word ptr [ecx], 3; push ebx; mov ebx, dword ptr [ecx + 4]; push esi; pus` |
| rb_shade.obj | 0x10039b40 | 1216 | RB_GetObjectiveColorDx7 | `sub esp, 0x2c; push ebx; push ebp; mov ebp, dword ptr [esp + 0x38]; mov ecx, dword ptr [eb` |
| rb_surface.obj | 0x1003a850 | 48 | RB_DrawTessSurface | `fnstenv [edx + 0x10]; lea edx, [esp + 0x10]; push edx; push eax; mov dword ptr [esp + 0x24` |
| rb_surface.obj | 0x1003a880 | 80 | RB_DrawTessSurface | `test esi, esi; je 0x1003a8bc; mov al, byte ptr [0x1072debc]; test al, al; je 0x1003a892; c` |
| rb_surface.obj | 0x1003a9a0 | 48 | RB_EndSurface | `push 0x200000; call dword ptr [0x101d49d4]; push 0x200000; mov dword ptr [0x1072d9b0], eax` |
| rb_surface.obj | 0x1003a9d0 | 512 | RB_EndSurface | `sub esp, 8; push ebx; push esi; mov esi, dword ptr [0x107645b4]; test esi, esi; push edi; ` |
| rb_sky.obj | 0x1003aed0 | 496 | RB_SetTessQuad | `sub esp, 0x54; mov eax, dword ptr [0x1072ddc8]; mov ecx, dword ptr [0x101d1b9c]; fld dword` |
| rb_sky.obj | 0x1003b0c0 | 592 | RB_SetTessQuad | `mov eax, dword ptr [0x101ce708]; mov ecx, dword ptr [eax + 8]; sub esp, 0x64; cmp ecx, 2; ` |
| rb_sky.obj | 0x1003b310 | 416 | RB_SetTessQuad | `mov ecx, dword ptr [0x1072ddc8]; mov edx, dword ptr [0x101d1b9c]; fld dword ptr [ecx + 0xf` |
| rb_sky.obj | 0x1003b550 | 512 | RB_TraceSunVisibility | `mov eax, dword ptr [0x1072ddb0]; sub esp, 8; and eax, 0x80000001; push ebx; push ebp; mov ` |
| rb_sky.obj | 0x1003b750 | 576 | RB_TraceSunVisibility | `mov eax, dword ptr [0x101d1b9c]; sub esp, 0x38; push ebx; push esi; push edi; mov edi, dwo` |
| rb_sky.obj | 0x1003b990 | 592 | RB_TraceSunVisibility | `mov eax, dword ptr [0x101d1b9c]; sub esp, 0x3c; push ebx; push ebp; push esi; push edi; mo` |
| rb_sky.obj | 0x1003c0d0 | 16 | RB_DrawSunPostEffects | `mov dword ptr [eax], 0x18128812; mov dword ptr [eax + 4], 0xe00e0007; ret ` |
| rb_sky.obj | 0x1003c0e0 | 16 | RB_DrawSunPostEffects | `mov dword ptr [eax + 4], 0xe00e0007; mov dword ptr [eax], 0x19128912; ret ` |
| rb_sky.obj | 0x1003c0f0 | 16 | RB_DrawSunPostEffects | `mov dword ptr [eax], 0x18128812; mov dword ptr [eax + 4], 0xe00e0007; ret ` |
| rb_state.obj | 0x1003d210 | 32 | RB_ChangeState_1 | `mov eax, ecx; and eax, 7; test cl, 8; mov eax, dword ptr [eax*4 + 0x10190860]; je 0x1003d2` |
| rb_state.obj | 0x1003dde0 | 48 | RB_InitImages | `mov eax, dword ptr [esi + 0x38]; push eax; mov eax, dword ptr [0x10730550]; imul eax, eax,` |
| rb_state.obj | 0x1003de10 | 32 | RB_InitImages | `mov eax, dword ptr [0x10730550]; imul eax, eax, 0xcd0; add eax, 0x1072def0; ret ` |
| rb_state.obj | 0x1003de30 | 352 | RB_InitImages | `mov eax, dword ptr [0x10730550]; mov ecx, dword ptr [esp + 4]; imul eax, eax, 0xcd0; add e` |
| rb_state.obj | 0x1003e130 | 240 | RB_SetViewMatrixForWDx7 | `mov eax, dword ptr [0x10730550]; mov ecx, dword ptr [0x101ce708]; imul eax, eax, 0xcd0; ad` |
| rb_state.obj | 0x1003e220 | 48 | RB_SetViewMatrixForWDx7 | `push esi; push edi; mov edi, dword ptr [0x10730550]; imul edi, edi, 0xcd0; add edi, 0x1072` |
| rb_state.obj | 0x1003e270 | 48 | RB_SetDepthHackNearClip | `push esi; push edi; mov esi, eax; mov ecx, 0x10; mov edi, 0x10764518; rep movsd dword ptr ` |
| rb_state.obj | 0x1003e300 | 384 | RB_CopyViewParmsMatrices | `push ebx; mov edx, edi; call 0x1003e2a0; mov eax, dword ptr [0x10730550]; xor ebx, ebx; im` |
| rb_state.obj | 0x1003e610 | 32 | RB_PopMatrixStack | `mov eax, dword ptr [0x101d4c6c]; mov ecx, dword ptr [0x101d4c70]; mov dword ptr [0x1072dde` |
| rb_state.obj | 0x1003e630 | 96 | RB_PopMatrixStack | `cmp dword ptr [0x10766724], 1; jne 0x1003e65b; mov dword ptr [eax], 0; mov dword ptr [eax ` |
| rb_state.obj | 0x1003e690 | 368 | RB_PopMatrixStack | `sub esp, 0x34; fild dword ptr [0x1076671c]; mov edx, dword ptr [0x10766724]; fld dword ptr` |
| rb_state.obj | 0x1003ea20 | 16 | RB_UpdateViewport | `mov eax, dword ptr [0x10766718]; mov eax, dword ptr [eax*4 + 0x1019087c]; ret ` |
| rb_state.obj | 0x1003ec20 | 16 | RB_SetRenderTarget | `push esi; xor esi, esi; call 0x10038430; pop esi; ret ` |
| rb_state.obj | 0x1003ec30 | 16 | RB_SetRenderTarget | `push esi; xor esi, esi; call 0x100384a0; pop esi; ret ` |
| rb_state.obj | 0x1003ec40 | 16 | RB_SetRenderTarget | `push esi; xor esi, esi; call 0x10038590; pop esi; ret ` |
| rb_state.obj | 0x1003ec80 | 48 | RB_BindWhiteImages | `push edi; xor edi, edi; xor eax, eax; mov al, byte ptr [edi + 0x10766764]; push eax; mov e` |
| com_math.obj | 0x1003ee10 | 80 | Vec2Length | `push ecx; push esi; mov esi, eax; xor edx, edx; sub esi, ecx; jmp 0x1003ee20; lea ebx, [eb` |
| com_math.obj | 0x1003ee60 | 16 | Vec2Length | `mov eax, dword ptr [eax + 0x14]; ret ` |
| com_math.obj | 0x1003ee70 | 16 | Vec2Length | `mov eax, dword ptr [eax]; ret ` |
| com_math.obj | 0x1003ee80 | 32 | Vec2Length | `push ecx; mov ecx, dword ptr [0x1072d9e0]; add ecx, eax; cmp ecx, 0x100000; jle 0x1003ee96` |
| com_math.obj | 0x1003eea0 | 128 | Vec2Length | `mov eax, dword ptr [0x10730550]; mov edx, dword ptr [ecx + 8]; imul eax, eax, 0xcd0; add e` |
| com_math.obj | 0x1003ef20 | 16 | Vec2Length | `ret ` |
| com_math.obj | 0x1003ef30 | 496 | Vec2Length | `push ebp; mov ebp, esp; and esp, 0xfffffff8; push ecx; mov eax, dword ptr [0x1072d9cc]; pu` |
| com_math.obj | 0x1003f120 | 1280 | Vec2Length | `mov eax, dword ptr [0x1072d9d4]; sub esp, 0x1c; add eax, 4; cmp eax, 0x154a; push ebp; jg ` |
| com_math.obj | 0x1003f620 | 160 | Vec2Length | `sub esp, 8; push esi; mov esi, dword ptr [edi + 0x54]; movzx eax, byte ptr [esi + 0xe]; mo` |
| com_math.obj | 0x1003f6c0 | 496 | Vec2Length | `sub esp, 0x50; push ebx; push esi; push edi; mov edi, eax; mov eax, dword ptr [edi + 0x3c]` |
| com_math.obj | 0x1003f8b0 | 128 | Vec2Length | `mov eax, dword ptr [0x1072ddc8]; fld dword ptr [eax + 0xf4]; fmul dword ptr [ecx + 8]; fld` |
| com_math.obj | 0x1003f930 | 128 | Vec2Length | `mov ecx, dword ptr [0x1072ddc8]; fld dword ptr [ecx + 0xf4]; fmul dword ptr [eax + 8]; fld` |
| com_math.obj | 0x1003f9b0 | 256 | Vec2Length | `sub esp, 0x18; mov ecx, dword ptr [0x1072ddc8]; fld dword ptr [ecx + 0xf4]; fmul dword ptr` |
| com_math.obj | 0x1003fab0 | 160 | Vec2Length | `mov ecx, dword ptr [esi + 0x68]; sub esp, 0xc; lea eax, [esp + 4]; push eax; push ecx; lea` |
| rb_tess.obj | 0x1003fba0 | 528 | RB_TessSprite | `sub esp, 0x48; fld dword ptr [0x1019bc84]; push ebx; push esi; mov esi, eax; fld dword ptr` |
| rb_tess.obj | 0x1003fdb0 | 1008 | RB_TessSprite | `sub esp, 0x48; push ebx; push ebp; mov ebp, dword ptr [esp + 0x54]; fld dword ptr [ebp + 0` |
| rb_tess.obj | 0x100401a0 | 992 | RB_TessSprite | `sub esp, 0x48; push ebx; push ebp; mov ebp, dword ptr [esp + 0x54]; fld dword ptr [ebp + 0` |
| rb_tess.obj | 0x10040580 | 928 | RB_TessSprite | `sub esp, 0x30; fld dword ptr [ebx]; push ebp; push esi; push edi; mov edi, eax; mov eax, d` |
| rb_tess.obj | 0x10040920 | 736 | RB_TessSprite | `sub esp, 0x30; fld dword ptr [ebx]; push ebp; push esi; push edi; mov edi, eax; mov eax, d` |
| rb_tess.obj | 0x10040c00 | 160 | RB_TessSprite | `push ecx; fld dword ptr [ecx + 0x48]; push ebx; fsub dword ptr [ecx + 0x3c]; push esi; fld` |
| rb_tess.obj | 0x10040ca0 | 160 | RB_TessSprite | `sub esp, 0x44; mov ecx, dword ptr [0x1072ddc8]; push esi; mov esi, dword ptr [ecx + 0x50];` |
| rb_tess.obj | 0x10040d40 | 176 | RB_TessSprite | `push ecx; fld dword ptr [edx]; fcomp dword ptr [0x1019bde4]; fnstsw ax; test ah, 5; jp 0x1` |
| rb_tess.obj | 0x10040df0 | 320 | RB_TessSprite | `fld dword ptr [edi + 0x68]; sub esp, 0x20; fld dword ptr [edi + 0x64]; push ebx; fucompp ;` |
| rb_tess.obj | 0x10040f30 | 256 | RB_TessSprite | `mov eax, dword ptr [0x1072d9d0]; sub esp, 0x14; push ebx; xor ebx, ebx; cmp eax, ebx; push` |
| rb_tess.obj | 0x10041030 | 128 | RB_TessSprite | `sub esp, 0x1c; push ebx; push edi; mov edi, eax; mov al, byte ptr [edi + 0x58]; mov cl, by` |
| rb_tess.obj | 0x100410b0 | 128 | RB_TessSprite | `push ecx; mov ecx, dword ptr [eax]; add ecx, -4; cmp ecx, 5; ja 0x1004110a; jmp dword ptr ` |
| rb_tess.obj | 0x10041130 | 16 | RB_TessSprite | `mov eax, dword ptr [0x1072de40]; jmp 0x100410b0` |
| rb_tess.obj | 0x10041140 | 288 | RB_TessSprite | `sub esp, 0x18; push ebx; push esi; mov esi, eax; mov eax, dword ptr [0x1072d9d0]; xor ebx,` |
| rb_tess.obj | 0x10041260 | 352 | RB_TessSprite | `mov eax, dword ptr [0x101ce7ec]; mov ecx, dword ptr [eax + 8]; test ecx, ecx; push ebx; pu` |
| rb_tess.obj | 0x100413c0 | 336 | RB_TessXModelSkinned | `push ebp; mov ebp, esp; and esp, 0xfffffff8; sub esp, 0x14; mov eax, dword ptr [0x1072d9d0` |
| rb_tess.obj | 0x100415f0 | 160 | RB_TessStaticModelCached | `push ebp; mov ebp, esp; and esp, 0xfffffff8; push ecx; mov eax, dword ptr [0x1072d9e0]; te` |
| rb_tess.obj | 0x10041690 | 96 | RB_TessStaticModelCached | `push 0x10192f58; push ebx; call 0x100f78cf; add esp, 8; test eax, eax; jne 0x100416a3; ret` |
| rb_tess.obj | 0x100416f0 | 32 | RB_TessStaticModelCached | `test eax, eax; jle 0x10041704; cmp eax, 0x17; jge 0x10041704; lea eax, [eax + eax*4]; mov ` |
| jcapimin.obj | 0x100417f0 | 32 | _jpeg_CreateCompress | `mov eax, dword ptr [esi + 4]; push edi; xor edi, edi; cmp eax, edi; je 0x10041801; push es` |
| jcapimin.obj | 0x10041810 | 64 | _jpeg_CreateCompress | `mov eax, dword ptr [esi + 4]; test eax, eax; je 0x10041840; push 1; push esi; call dword p` |
| jcapistd.obj | 0x10041d60 | 80 | _jpeg_write_raw_data | `mov eax, dword ptr [ecx + 0x150]; push esi; mov esi, dword ptr [ecx + 0xec]; mov edx, 1; c` |
