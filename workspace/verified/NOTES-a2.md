# Worker a2 — range 0x10015000–0x1002c000

Build/verify: `make -f closed.mk SRCDIR=src/claude_a2 B=build/a2 verify`.
Verified = bindcheck `why: []`. Vec3Add/Vec3Scale/VectorCopy/AxisCopy (a2.h inlines) also bind
at out-of-range retail copies (0x1000f140, 0x10001880, 0x10001010, 0x1005c9d0); not counted here.

## Verified

| addr | function | bytes | TU |
|---|---|---|---|
| 0x100153f0 | R_AABBTreeSurfaces_r | 376 | r_marks.cpp |
| 0x10015570 | R_AddSurfaceToList | 35 | r_marks.cpp |
| 0x10029910 | R_SortGfxAabbTreeChildren | 699 | r_staticmodel_load_obj.cpp |
| 0x10029be0 | R_CompareStaticModelIndex | 13 | r_staticmodel_load_obj.cpp |
| 0x10029bf0 | R_SortGfxAabbTree | 1056 | r_staticmodel_load_obj.cpp |
| 0x1002b9a0 | SMC_ClearCache | 288 | r_staticmodelcache.cpp |
| 0x1002baf0 | R_FlushStaticModelCache | 111 | r_staticmodelcache.cpp |
| 0x10024080 | R_UpdateFrameFog | 508 | r_scene.cpp |
| 0x10023af0 | R_AllocSceneEntity (name HYPOTHESIS; inlined in Mac) | 149 | r_scene.cpp |
| 0x1001be50 | Material_TechniqueTypeForName | 401 | r_material_load_obj.cpp |
| 0x1002aac0 | SMC_FreeCachedSurface_r | 206 | r_staticmodelcache.cpp |
| 0x1002bd20 | R_VideoMemoryForDevice | 113 | r_texturemem.cpp |
| 0x1002bda0 | R_DDEnumCallback | 35 | r_texturemem.cpp |
| 0x1002bdd0 | R_DrasticVideoMemoryForDevice | 213 | r_texturemem.cpp |
| 0x1002bed0 | R_VideoMemory | 115 | r_texturemem.cpp |
| 0x1002bf50 | R_AvailableTextureMemory | 96 | r_texturemem.cpp |

## Deferred

- 0x1002a010 R_AddStaticModelToAabbTree_r: 3 insns, `(childCount+1)*48` alloc size in eax (retail) vs ecx; 6+ variants tried.
- 0x100155a0 R_CellSurfaces: retail pushes ebx/ebp inside the cull-group loop; index-in-ebx in ours; wrapper/helper variants worse.
- 0x10023b90 R_AddStaticModelToScene: retail keeps entIndex in ebp and reloads rgp.world after the colorForDir store; ours keeps smodelIndex in ebp and does not reload. Probes (&rgp taken, scene.def.entities assigned) did not change it.
- std::sort instantiations (0x10028170.., 0x1001ca80..): only reachable via blocked callers (0x10025380, codex 0x10017100).
- 0x1002a250, 0x10015740: need BoxOnPlaneSide 0x1005da30 (out of range; now available via cltus com_math, not yet attempted).

- 0x1002beb0 R_DDEnumDrasticCallback: source bytes match but 27-byte body also matches the tail of 0x1002bda8, so cmp gives 2 hits (not counted).
- 0x100165c0 Material_BuildVertexDecl / 0x100174c0 Material_ReloadAll (r_material.cpp, D3D): Build differs only in the log guard: retail materializes `setne cl; cmp cl,bl` for the fp test, ours branches directly (tried inline/extern/bool/Bool RB_IsLogging variants; codex hit the same wall). ReloadAll: retail uses a 32-countdown in a stack slot, ours a pointer compare.

## Facts

- PINNED: rgp.world = 0x101d1b9c; rg.fogSettings[2..4] = 0x101d61ac/cc/ec, rg.fogIndex = 0x101d620c.
- PINNED: s_cache (static_model_cache_t) = 0x10696d00, size 0xc438; usedlist +0xc428.
- PINNED: scene.def.time = 0x10678504, scene.def.entityCount = 0x1067850c, scene.def.entities = 0x10678510, scene.sceneEnts = 0x10678ac4 (stride 0x34).
- PINNED: frontEndDataOut = 0x101da9c8; ->entityCount +0xa000c; ->fogSettings +0x219cec; ->frameCount +0.
- PINNED: GfxEntity lighting union at +8; axis +0x14; scale +0x38; origin +0x3c (0x74 bytes).
- PINNED: CoD2 R_UpdateFrameFog lerps fog[3]->fog[4] only when techniqueOffset matches; otherwise copies and zeroes fog[4].finishTime (opencod2 has the condition inverted).
- PINNED: Material_TechniqueTypeForName table is the CoD2 34-entry list (see r_material_load_obj.cpp), built on the stack per call.
- PINNED: r_logFile dvar ptr 0x101ce7ec (current +8), r_logFileGlob.fp 0x10764584, alwaysfails 0x1076a830 (Mac symbol name), materialGlobals.vertexDeclCount 0x101d7fc8, vertexDecls 0x101d7fcc (stride 0x18).
- PINNED: s_streamSourceInfo[4][7] 0x1018eac8, s_streamDestInfo[12] 0x1018eb1c (values in r_material.cpp).
- PINNED: IID_IDirectDraw7 0x101977cc (dxguid.lib); R_VideoMemoryForDevice / R_DrasticVideoMemoryForDevice take the GUID in ecx (LTCG).
- Build note: closed.mk does not track a2.h / a2_d3d.h; touch the .cpp files after header edits.
