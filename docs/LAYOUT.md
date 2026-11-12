# Source layout: ours -> Infinity Ward

Evidence: Mac 1.3 i386 STABS (N_SO dir+file per TU, N_SOL headers), root `.../COD2/Project/PC/<module>/` and
`Project/libwww/`. Our `src/`+`workspace/` root = IW `PC/` (retail `__FILE__` `.\universal\com_memory.cpp` is cwd-relative
to it; libwww `__FILE__` = `\builds\pc_1.3_1_1\pc\cod2src\libwww\...`). Script: `/home/nawaf/layout/map.py`.

TUs: 370; with a STABS path (PINNED): 281 (75%). Rest keep their path (no evidence:
CRT/`unknown/`, MSS, speex/zlib files the Mac build lacks, imports). Moved TUs were checked by a clean byte-identical gate.

Kept on purpose: `oc/headers`, `oc/shims`, `oc/imports` (the draft header layer `#oc` TUs build against; its
q_shared.h/com_math.h etc. conflict with the real ones, so merging would change TU include content), and dead drafts
`oc/win32/win_net.cpp`, `oc/win32/win_shared.cpp` (superseded by `win32/`, not built). `#oc` in `tus.txt` selects OCFLAGS.

| ours (before) | IW / now | tag | kind |
|---|---|---|---|
| EffectsCore/FxArchive.cpp | EffectsCore/FxArchive.cpp | PINNED | TU |
| EffectsCore/FxChannel.cpp | EffectsCore/FxChannel.cpp | PINNED | TU |
| EffectsCore/FxCurve.cpp | EffectsCore/FxCurve.cpp | PINNED | TU |
| EffectsCore/FxCurve_load_obj.cpp | EffectsCore/FxCurve_load_obj.cpp | PINNED | TU |
| EffectsCore/FxMemMgr.cpp | EffectsCore/FxMemMgr.cpp | PINNED | TU |
| EffectsCore/FxPrimitives.cpp | EffectsCore/FxPrimitives.cpp | PINNED | TU |
| EffectsCore/FxProfile.cpp | EffectsCore/FxProfile.cpp | PINNED | TU |
| EffectsCore/FxScheduler.cpp | EffectsCore/FxScheduler.cpp | PINNED | TU |
| EffectsCore/FxScheduler_load_obj.cpp | EffectsCore/FxScheduler_load_obj.cpp | PINNED | TU |
| EffectsCore/FxSystem.cpp | EffectsCore/FxSystem.cpp | PINNED | TU |
| EffectsCore/FxTemplate.cpp | EffectsCore/FxTemplate.cpp | PINNED | TU |
| EffectsCore/FxUtil.cpp | EffectsCore/FxUtil.cpp | PINNED | TU |
| EffectsCore/Fxexport.cpp | EffectsCore/Fxexport.cpp | PINNED | TU |
| EffectsCore/GenericParser2.cpp | EffectsCore/GenericParser2.cpp | PINNED | TU |
| EffectsCore/fx_dvars.cpp | EffectsCore/fx_dvars.cpp | kept (no evidence) | TU |
| bgame/bg_animation_mp.cpp | bgame/bg_animation_mp.cpp | PINNED | TU |
| bgame/bg_jump.cpp | bgame/bg_jump.cpp | PINNED | TU |
| bgame/bg_mantle.cpp | bgame/bg_mantle.cpp | PINNED | TU |
| bgame/bg_misc.cpp | bgame/bg_misc.cpp | PINNED | TU |
| bgame/bg_misctables.cpp | bgame/bg_misctables.cpp | PINNED | TU |
| bgame/bg_pmove.cpp | bgame/bg_pmove.cpp | PINNED | TU |
| bgame/bg_slidemove.cpp | bgame/bg_slidemove.cpp | PINNED | TU |
| bgame/bg_weapons.cpp | bgame/bg_weapons.cpp | PINNED | TU |
| bgame/bg_weapons_load_obj.cpp | bgame/bg_weapons_load_obj.cpp | PINNED | TU |
| botlib/l_memory.cpp | botlib/l_memory.cpp | PINNED | TU |
| botlib/l_precomp.cpp | botlib/l_precomp.cpp | PINNED | TU |
| botlib/l_script.cpp | botlib/l_script.cpp | PINNED | TU |
| cgame/cg_effects_load_obj.cpp | cgame/cg_effects_load_obj.cpp | PINNED | TU |
| compat/imports.cpp | compat/imports.cpp | kept (no evidence) | TU |
| devgui/devgui.cpp | devgui/devgui.cpp | PINNED | TU |
| devgui/devgui_input.cpp | devgui/devgui_input.cpp | PINNED | TU |
| devgui/devgui_util.cpp | devgui/devgui_util.cpp | PINNED | TU |
| game/g_active_mp.cpp | game_mp/g_active_mp.cpp | PINNED | TU |
| game/g_client_fields_mp.cpp | game_mp/g_client_fields_mp.cpp | PINNED | TU |
| game/g_client_mp.cpp | game_mp/g_client_mp.cpp | PINNED | TU |
| game/g_client_script_cmd_mp.cpp | game_mp/g_client_script_cmd_mp.cpp | PINNED | TU |
| game/g_cmds_mp.cpp | game_mp/g_cmds_mp.cpp | PINNED | TU |
| game/g_combat_mp.cpp | game_mp/g_combat_mp.cpp | PINNED | TU |
| game/g_debug_mp.cpp | game/g_debug_mp.cpp | kept (no evidence) | TU |
| game/g_hudelem_mp.cpp | game_mp/g_hudelem_mp.cpp | PINNED | TU |
| game/g_items_mp.cpp | game_mp/g_items_mp.cpp | PINNED | TU |
| game/g_load_utils.cpp | game/g_load_utils.cpp | PINNED | TU |
| game/g_main_mp.cpp | game_mp/g_main_mp.cpp | PINNED | TU |
| game/g_misc_mp.cpp | game_mp/g_misc_mp.cpp | PINNED | TU |
| game/g_missile_mp.cpp | game_mp/g_missile_mp.cpp | PINNED | TU |
| game/g_mover_mp.cpp | game_mp/g_mover_mp.cpp | PINNED | TU |
| game/g_scr_main_mp.cpp | game_mp/g_scr_main_mp.cpp | PINNED | TU |
| game/g_scr_mover_mp.cpp | game_mp/g_scr_mover_mp.cpp | PINNED | TU |
| game/g_spawn_mp.cpp | game_mp/g_spawn_mp.cpp | PINNED | TU |
| game/g_svcmds_mp.cpp | game_mp/g_svcmds_mp.cpp | PINNED | TU |
| game/g_team_mp.cpp | game_mp/g_team_mp.cpp | PINNED | TU |
| game/g_trigger_mp.cpp | game_mp/g_trigger_mp.cpp | PINNED | TU |
| game/g_utils_mp.cpp | game_mp/g_utils_mp.cpp | PINNED | TU |
| game/g_weapon_load_obj.cpp | game/g_weapon_load_obj.cpp | PINNED | TU |
| game/g_weapon_mp.cpp | game_mp/g_weapon_mp.cpp | PINNED | TU |
| game/player_use_mp.cpp | game_mp/player_use_mp.cpp | PINNED | TU |
| game/scr_const_mp.cpp | game_mp/scr_const_mp.cpp | PINNED | TU |
| groupvoice/play_dsound.cpp | groupvoice/play_dsound.cpp | kept (no evidence) | TU |
| groupvoice/record_dsound.cpp | groupvoice/record_dsound.cpp | kept (no evidence) | TU |
| libwww/Library/src/HTAABrow.c | libwww/Library/src/HTAABrow.c | PINNED | TU |
| libwww/Library/src/HTAAUtil.c | libwww/Library/src/HTAAUtil.c | PINNED | TU |
| libwww/Library/src/HTANSI.c | libwww/Library/src/HTANSI.c | kept (no evidence) | TU |
| libwww/Library/src/HTAccess.c | libwww/Library/src/HTAccess.c | PINNED | TU |
| libwww/Library/src/HTAlert.c | libwww/Library/src/HTAlert.c | PINNED | TU |
| libwww/Library/src/HTAnchor.c | libwww/Library/src/HTAnchor.c | PINNED | TU |
| libwww/Library/src/HTArray.c | libwww/Library/src/HTArray.c | PINNED | TU |
| libwww/Library/src/HTAssoc.c | libwww/Library/src/HTAssoc.c | PINNED | TU |
| libwww/Library/src/HTAtom.c | libwww/Library/src/HTAtom.c | PINNED | TU |
| libwww/Library/src/HTBInit.c | libwww/Library/src/HTBInit.c | PINNED | TU |
| libwww/Library/src/HTBind.c | libwww/Library/src/HTBind.c | PINNED | TU |
| libwww/Library/src/HTBound.c | libwww/Library/src/HTBound.c | PINNED | TU |
| libwww/Library/src/HTBufWrt.c | libwww/Library/src/HTBufWrt.c | PINNED | TU |
| libwww/Library/src/HTCache.c | libwww/Library/src/HTCache.c | PINNED | TU |
| libwww/Library/src/HTChannl.c | libwww/Library/src/HTChannl.c | PINNED | TU |
| libwww/Library/src/HTChunk.c | libwww/Library/src/HTChunk.c | PINNED | TU |
| libwww/Library/src/HTConLen.c | libwww/Library/src/HTConLen.c | PINNED | TU |
| libwww/Library/src/HTDNS.c | libwww/Library/src/HTDNS.c | PINNED | TU |
| libwww/Library/src/HTDialog.c | libwww/Library/src/HTDialog.c | PINNED | TU |
| libwww/Library/src/HTDigest.c | libwww/Library/src/HTDigest.c | kept (no evidence) | TU |
| libwww/Library/src/HTDir.c | libwww/Library/src/HTDir.c | PINNED | TU |
| libwww/Library/src/HTError.c | libwww/Library/src/HTError.c | PINNED | TU |
| libwww/Library/src/HTEscape.c | libwww/Library/src/HTEscape.c | PINNED | TU |
| libwww/Library/src/HTEvent.c | libwww/Library/src/HTEvent.c | PINNED | TU |
| libwww/Library/src/HTEvtLst.c | libwww/Library/src/HTEvtLst.c | PINNED | TU |
| libwww/Library/src/HTFSave.c | libwww/Library/src/HTFSave.c | PINNED | TU |
| libwww/Library/src/HTFTP.c | libwww/Library/src/HTFTP.c | PINNED | TU |
| libwww/Library/src/HTFTPDir.c | libwww/Library/src/HTFTPDir.c | PINNED | TU |
| libwww/Library/src/HTFWrite.c | libwww/Library/src/HTFWrite.c | PINNED | TU |
| libwww/Library/src/HTFile.c | libwww/Library/src/HTFile.c | kept (no evidence) | TU |
| libwww/Library/src/HTFilter.c | libwww/Library/src/HTFilter.c | PINNED | TU |
| libwww/Library/src/HTFormat.c | libwww/Library/src/HTFormat.c | PINNED | TU |
| libwww/Library/src/HTGopher.c | libwww/Library/src/HTGopher.c | kept (no evidence) | TU |
| libwww/Library/src/HTGuess.c | libwww/Library/src/HTGuess.c | PINNED | TU |
| libwww/Library/src/HTHInit.c | libwww/Library/src/HTHInit.c | kept (no evidence) | TU |
| libwww/Library/src/HTHeader.c | libwww/Library/src/HTHeader.c | PINNED | TU |
| libwww/Library/src/HTHome.c | libwww/Library/src/HTHome.c | PINNED | TU |
| libwww/Library/src/HTHost.c | libwww/Library/src/HTHost.c | PINNED | TU |
| libwww/Library/src/HTIcons.c | libwww/Library/src/HTIcons.c | PINNED | TU |
| libwww/Library/src/HTInet.c | libwww/Library/src/HTInet.c | PINNED | TU |
| libwww/Library/src/HTInit.c | libwww/Library/src/HTInit.c | PINNED | TU |
| libwww/Library/src/HTLib.c | libwww/Library/src/HTLib.c | PINNED | TU |
| libwww/Library/src/HTLink.c | libwww/Library/src/HTLink.c | PINNED | TU |
| libwww/Library/src/HTList.c | libwww/Library/src/HTList.c | PINNED | TU |
| libwww/Library/src/HTLocal.c | libwww/Library/src/HTLocal.c | kept (no evidence) | TU |
| libwww/Library/src/HTLog.c | libwww/Library/src/HTLog.c | kept (no evidence) | TU |
| libwww/Library/src/HTMIME.c | libwww/Library/src/HTMIME.c | PINNED | TU |
| libwww/Library/src/HTMIMERq.c | libwww/Library/src/HTMIMERq.c | PINNED | TU |
| libwww/Library/src/HTMIMImp.c | libwww/Library/src/HTMIMImp.c | PINNED | TU |
| libwww/Library/src/HTMIMPrs.c | libwww/Library/src/HTMIMPrs.c | PINNED | TU |
| libwww/Library/src/HTML.c | libwww/Library/src/HTML.c | kept (no evidence) | TU |
| libwww/Library/src/HTMLGen.c | libwww/Library/src/HTMLGen.c | PINNED | TU |
| libwww/Library/src/HTMLPDTD.c | libwww/Library/src/HTMLPDTD.c | PINNED | TU |
| libwww/Library/src/HTMemory.c | libwww/Library/src/HTMemory.c | PINNED | TU |
| libwww/Library/src/HTMerge.c | libwww/Library/src/HTMerge.c | PINNED | TU |
| libwww/Library/src/HTMethod.c | libwww/Library/src/HTMethod.c | PINNED | TU |
| libwww/Library/src/HTMulti.c | libwww/Library/src/HTMulti.c | kept (no evidence) | TU |
| libwww/Library/src/HTNDir.c | libwww/Library/src/HTNDir.c | kept (no evidence) | TU |
| libwww/Library/src/HTNet.c | libwww/Library/src/HTNet.c | PINNED | TU |
| libwww/Library/src/HTNews.c | libwww/Library/src/HTNews.c | kept (no evidence) | TU |
| libwww/Library/src/HTNewsLs.c | libwww/Library/src/HTNewsLs.c | kept (no evidence) | TU |
| libwww/Library/src/HTNewsRq.c | libwww/Library/src/HTNewsRq.c | kept (no evidence) | TU |
| libwww/Library/src/HTNoFree.c | libwww/Library/src/HTNoFree.c | PINNED | TU |
| libwww/Library/src/HTPEP.c | libwww/Library/src/HTPEP.c | PINNED | TU |
| libwww/Library/src/HTParse.c | libwww/Library/src/HTParse.c | PINNED | TU |
| libwww/Library/src/HTPlain.c | libwww/Library/src/HTPlain.c | kept (no evidence) | TU |
| libwww/Library/src/HTProfil.c | libwww/Library/src/HTProfil.c | PINNED | TU |
| libwww/Library/src/HTProt.c | libwww/Library/src/HTProt.c | PINNED | TU |
| libwww/Library/src/HTProxy.c | libwww/Library/src/HTProxy.c | PINNED | TU |
| libwww/Library/src/HTReader.c | libwww/Library/src/HTReader.c | PINNED | TU |
| libwww/Library/src/HTReqMan.c | libwww/Library/src/HTReqMan.c | PINNED | TU |
| libwww/Library/src/HTResponse.c | libwww/Library/src/HTResponse.c | PINNED | TU |
| libwww/Library/src/HTRules.c | libwww/Library/src/HTRules.c | PINNED | TU |
| libwww/Library/src/HTSChunk.c | libwww/Library/src/HTSChunk.c | kept (no evidence) | TU |
| libwww/Library/src/HTStream.c | libwww/Library/src/HTStream.c | PINNED | TU |
| libwww/Library/src/HTString.c | libwww/Library/src/HTString.c | PINNED | TU |
| libwww/Library/src/HTTCP.c | libwww/Library/src/HTTCP.c | PINNED | TU |
| libwww/Library/src/HTTChunk.c | libwww/Library/src/HTTChunk.c | PINNED | TU |
| libwww/Library/src/HTTP.c | libwww/Library/src/HTTP.c | PINNED | TU |
| libwww/Library/src/HTTPGen.c | libwww/Library/src/HTTPGen.c | PINNED | TU |
| libwww/Library/src/HTTPReq.c | libwww/Library/src/HTTPReq.c | PINNED | TU |
| libwww/Library/src/HTTeXGen.c | libwww/Library/src/HTTeXGen.c | kept (no evidence) | TU |
| libwww/Library/src/HTTee.c | libwww/Library/src/HTTee.c | PINNED | TU |
| libwww/Library/src/HTTelnet.c | libwww/Library/src/HTTelnet.c | kept (no evidence) | TU |
| libwww/Library/src/HTTimer.c | libwww/Library/src/HTTimer.c | PINNED | TU |
| libwww/Library/src/HTTrace.c | libwww/Library/src/HTTrace.c | PINNED | TU |
| libwww/Library/src/HTTrans.c | libwww/Library/src/HTTrans.c | PINNED | TU |
| libwww/Library/src/HTUTree.c | libwww/Library/src/HTUTree.c | PINNED | TU |
| libwww/Library/src/HTUU.c | libwww/Library/src/HTUU.c | PINNED | TU |
| libwww/Library/src/HTUser.c | libwww/Library/src/HTUser.c | PINNED | TU |
| libwww/Library/src/HTWWWStr.c | libwww/Library/src/HTWWWStr.c | PINNED | TU |
| libwww/Library/src/HTWriter.c | libwww/Library/src/HTWriter.c | PINNED | TU |
| libwww/Library/src/HText.c | libwww/Library/src/HText.c | kept (no evidence) | TU |
| libwww/Library/src/SGML.c | libwww/Library/src/SGML.c | kept (no evidence) | TU |
| libwww/Library/src/md5.c | libwww/Library/src/md5.c | kept (no evidence) | TU |
| oc/PC/qcommon/net_hardening.h | qcommon/net_hardening.h | SUPPORTED (module dir) | hdr |
| oc/PC/win32/gfx_dll_v60.h | win32/gfx_dll_v60.h | SUPPORTED (module dir) | hdr |
| oc/alias.cpp | alias.cpp | SUPPORTED (module dir) | TU |
| oc/cgame_mp/cg_animtree_mp.cpp | cgame_mp/cg_animtree_mp.cpp | PINNED | TU |
| oc/cgame_mp/cg_compassfriendlies_mp.cpp | cgame_mp/cg_compassfriendlies_mp.cpp | PINNED | TU |
| oc/cgame_mp/cg_consolecmds_mp.cpp | cgame_mp/cg_consolecmds_mp.cpp | PINNED | TU |
| oc/cgame_mp/cg_devgui.cpp | cgame_mp/cg_devgui.cpp | PINNED | TU |
| oc/cgame_mp/cg_draw_mp.cpp | cgame_mp/cg_draw_mp.cpp | PINNED | TU |
| oc/cgame_mp/cg_drawtools_mp.cpp | cgame_mp/cg_drawtools_mp.cpp | PINNED | TU |
| oc/cgame_mp/cg_ents_mp.cpp | cgame_mp/cg_ents_mp.cpp | PINNED | TU |
| oc/cgame_mp/cg_event_mp.cpp | cgame_mp/cg_event_mp.cpp | PINNED | TU |
| oc/cgame_mp/cg_hudelem_mp.cpp | cgame_mp/cg_hudelem_mp.cpp | PINNED | TU |
| oc/cgame_mp/cg_info_mp.cpp | cgame_mp/cg_info_mp.cpp | PINNED | TU |
| oc/cgame_mp/cg_localents_mp.cpp | cgame_mp/cg_localents_mp.cpp | PINNED | TU |
| oc/cgame_mp/cg_main_mp.cpp | cgame_mp/cg_main_mp.cpp | PINNED | TU |
| oc/cgame_mp/cg_marks_mp.cpp | cgame_mp/cg_marks_mp.cpp | PINNED | TU |
| oc/cgame_mp/cg_newDraw_mp.cpp | cgame_mp/cg_newDraw_mp.cpp | PINNED | TU |
| oc/cgame_mp/cg_players_mp.cpp | cgame_mp/cg_players_mp.cpp | PINNED | TU |
| oc/cgame_mp/cg_playerstate_mp.cpp | cgame_mp/cg_playerstate_mp.cpp | PINNED | TU |
| oc/cgame_mp/cg_predict_mp.cpp | cgame_mp/cg_predict_mp.cpp | PINNED | TU |
| oc/cgame_mp/cg_rumble_mp.cpp | cgame_mp/cg_rumble_mp.cpp | SUPPORTED (module dir) | TU |
| oc/cgame_mp/cg_scoreboard_mp.cpp | cgame_mp/cg_scoreboard_mp.cpp | PINNED | TU |
| oc/cgame_mp/cg_servercmds_mp.cpp | cgame_mp/cg_servercmds_mp.cpp | PINNED | TU |
| oc/cgame_mp/cg_shellshock.cpp | cgame_mp/cg_shellshock.cpp | PINNED | TU |
| oc/cgame_mp/cg_snapshot_mp.cpp | cgame_mp/cg_snapshot_mp.cpp | PINNED | TU |
| oc/cgame_mp/cg_view_mp.cpp | cgame_mp/cg_view_mp.cpp | PINNED | TU |
| oc/cgame_mp/cg_weapons.cpp | cgame_mp/cg_weapons.cpp | PINNED | TU |
| oc/cgame_mp/offhandweapons_mp.cpp | cgame_mp/offhandweapons_mp.cpp | PINNED | TU |
| oc/client_mp/cl_cgame_mp.cpp | client_mp/cl_cgame_mp.cpp | PINNED | TU |
| oc/client_mp/cl_cin_mp.cpp | client_mp/cl_cin_mp.cpp | PINNED | TU |
| oc/client_mp/cl_console_mp.cpp | client_mp/cl_console_mp.cpp | PINNED | TU |
| oc/client_mp/cl_devgui.cpp | client_mp/cl_devgui.cpp | PINNED | TU |
| oc/client_mp/cl_gamepad.cpp | client_mp/cl_gamepad.cpp | SUPPORTED (module dir) | TU |
| oc/client_mp/cl_input.cpp | client_mp/cl_input.cpp | PINNED | TU |
| oc/client_mp/cl_keyevent.inl | client_mp/cl_keyevent.inl | SUPPORTED (module dir) | hdr |
| oc/client_mp/cl_keys_mp.cpp | client_mp/cl_keys_mp.cpp | PINNED | TU |
| oc/client_mp/cl_main_mp.cpp | client_mp/cl_main_mp.cpp | PINNED | TU |
| oc/client_mp/cl_main_pc_mp.cpp | client_mp/cl_main_pc_mp.cpp | PINNED | TU |
| oc/client_mp/cl_net_chan_mp.cpp | client_mp/cl_net_chan_mp.cpp | PINNED | TU |
| oc/client_mp/cl_parse_mp.cpp | client_mp/cl_parse_mp.cpp | PINNED | TU |
| oc/client_mp/cl_scrn_mp.cpp | client_mp/cl_scrn_mp.cpp | PINNED | TU |
| oc/client_mp/cl_ui_mp.cpp | client_mp/cl_ui_mp.cpp | PINNED | TU |
| oc/client_mp/cl_ui_pc_mp.cpp | client_mp/cl_ui_pc_mp.cpp | PINNED | TU |
| oc/client_mp/screen_placement_mp.cpp | client_mp/screen_placement_mp.cpp | PINNED | TU |
| oc/globals.cpp | globals.cpp | SUPPORTED (module dir) | TU |
| oc/groupvoice/decode.cpp | groupvoice/decode.cpp | PINNED | TU |
| oc/groupvoice/encode.cpp | groupvoice/encode.cpp | PINNED | TU |
| oc/groupvoice/mixer.cpp | groupvoice/mixer.cpp | SUPPORTED (module dir) | TU |
| oc/groupvoice/play.cpp | groupvoice/play.cpp | PINNED | TU |
| oc/groupvoice/record.cpp | groupvoice/record.cpp | PINNED | TU |
| oc/headers/PC/gfx_d3d/r_local.h | oc/headers/PC/gfx_d3d/r_local.h | PINNED | hdr |
| oc/headers/PC/gfx_d3d/rb_backend.h | oc/headers/PC/gfx_d3d/rb_backend.h | PINNED | hdr |
| oc/headers/PC/gfx_d3d/rb_state.h | oc/headers/PC/gfx_d3d/rb_state.h | PINNED | hdr |
| oc/headers/PC/punkbuster/pbcommon.h | oc/headers/PC/punkbuster/pbcommon.h | PINNED | hdr |
| oc/headers/PC/universal/com_math.h | oc/headers/PC/universal/com_math.h | PINNED | hdr |
| oc/headers/PC/universal/com_vector.h | oc/headers/PC/universal/com_vector.h | PINNED | hdr |
| oc/headers/PC/universal/q_shared.h | oc/headers/PC/universal/q_shared.h | PINNED | hdr |
| oc/headers/PC/xanim/xanim_public.h | oc/headers/PC/xanim/xanim_public.h | PINNED | hdr |
| oc/qcommon/statmonitor.cpp | qcommon/statmonitor.cpp | PINNED | TU |
| oc/snd.cpp | snd.cpp | PINNED | TU |
| oc/snd_utils.cpp | snd_utils.cpp | PINNED | TU |
| oc/ui/ui_component.cpp | ui/ui_component.cpp | PINNED | TU |
| oc/ui/ui_shared_obj.cpp | ui/ui_shared_obj.cpp | PINNED | TU |
| oc/ui/ui_utils.cpp | ui/ui_utils.cpp | PINNED | TU |
| oc/ui_mp/ui_atoms.cpp | ui_mp/ui_atoms.cpp | PINNED | TU |
| oc/ui_mp/ui_console_mode.cpp | ui_mp/ui_console_mode.cpp | SUPPORTED (module dir) | TU |
| oc/ui_mp/ui_console_mode.h | ui_mp/ui_console_mode.h | SUPPORTED (module dir) | hdr |
| oc/ui_mp/ui_gameinfo_mp.cpp | ui_mp/ui_gameinfo_mp.cpp | PINNED | TU |
| oc/ui_mp/ui_gamepad_menu.cpp | ui_mp/ui_gamepad_menu.cpp | SUPPORTED (module dir) | TU |
| oc/ui_mp/ui_main_mp.cpp | ui_mp/ui_main_mp.cpp | PINNED | TU |
| oc/ui_mp/ui_shared_mp.cpp | ui_mp/ui_shared_mp.cpp | PINNED | TU |
| oc/win32/cinematics.cpp | win32/cinematics.cpp | PINNED | TU |
| oc/win32/gfx_dll_v60.cpp | win32/gfx_dll_v60.cpp | SUPPORTED (module dir) | TU |
| oc/win32/gfx_v60_threads.cpp | win32/gfx_v60_threads.cpp | SUPPORTED (module dir) | TU |
| oc/win32/snd_driver.cpp | win32/snd_driver.cpp | PINNED | TU |
| oc/win32/win_localize.cpp | win32/win_localize.cpp | PINNED | TU |
| oc/win32/win_net.cpp | oc/win32/win_net.cpp | PINNED | hdr |
| oc/win32/win_shared.cpp | oc/win32/win_shared.cpp | PINNED | hdr |
| oc/win32/win_syscon.cpp | win32/win_syscon.cpp | SUPPORTED (module dir) | TU |
| oc/win32/win_threads.cpp | win32/win_threads.cpp | SUPPORTED (module dir) | TU |
| oc/win32/win_voice.cpp | win32/win_voice.cpp | PINNED | TU |
| punkbuster/pbcl.cpp | punkbuster/pbcl.cpp | PINNED | TU |
| punkbuster/pbmd5.cpp | punkbuster/pbmd5.cpp | PINNED | TU |
| punkbuster/pbsv.cpp | punkbuster/pbsv.cpp | PINNED | TU |
| punkbuster/pbsv.h | punkbuster/pbsv.h | PINNED | hdr |
| qcommon/buildnumber.c | qcommon/buildnumber.c | kept (no evidence) | TU |
| qcommon/cm_load.cpp | qcommon/cm_load.cpp | PINNED | TU |
| qcommon/cm_load_obj.cpp | qcommon/cm_load_obj.cpp | PINNED | TU |
| qcommon/cm_mesh.cpp | qcommon/cm_mesh.cpp | PINNED | TU |
| qcommon/cm_polylib.cpp | qcommon/cm_polylib.cpp | kept (no evidence) | TU |
| qcommon/cm_staticmodel.cpp | qcommon/cm_staticmodel.cpp | PINNED | TU |
| qcommon/cm_staticmodel_load_obj.cpp | qcommon/cm_staticmodel_load_obj.cpp | PINNED | TU |
| qcommon/cm_test.cpp | qcommon/cm_test.cpp | PINNED | TU |
| qcommon/cm_trace.cpp | qcommon/cm_trace.cpp | PINNED | TU |
| qcommon/cm_tracebox.cpp | qcommon/cm_tracebox.cpp | PINNED | TU |
| qcommon/cm_world.cpp | qcommon/cm_world.cpp | PINNED | TU |
| qcommon/cmd.cpp | qcommon/cmd.cpp | PINNED | TU |
| qcommon/com_bsp_load_obj.cpp | qcommon/com_bsp_load_obj.cpp | PINNED | TU |
| qcommon/com_profilemapload.cpp | qcommon/com_profilemapload.cpp | PINNED | TU |
| qcommon/common.cpp | qcommon/common.cpp | PINNED | TU |
| qcommon/dl_main.cpp | qcommon/dl_main.cpp | PINNED | TU |
| qcommon/dobj_management.cpp | qcommon/dobj_management.cpp | PINNED | TU |
| qcommon/huffman.cpp | qcommon/huffman.cpp | PINNED | TU |
| qcommon/legacyhacks.cpp | qcommon/legacyhacks.cpp | PINNED | TU |
| qcommon/md4.cpp | qcommon/md4.cpp | PINNED | TU |
| qcommon/mem_track.cpp | qcommon/mem_track.cpp | PINNED | TU |
| qcommon/msg_mp.cpp | qcommon/msg_mp.cpp | PINNED | TU |
| qcommon/net_chan_mp.cpp | qcommon/net_chan_mp.cpp | PINNED | TU |
| qcommon/unused_stubs.cpp | qcommon/unused_stubs.cpp | kept (no evidence) | TU |
| script/scr_animtree.cpp | script/scr_animtree.cpp | PINNED | TU |
| script/scr_compiler.cpp | script/scr_compiler.cpp | PINNED | TU |
| script/scr_debugger.cpp | script/scr_debugger.cpp | PINNED | TU |
| script/scr_evaluate.cpp | script/scr_evaluate.cpp | PINNED | TU |
| script/scr_main.cpp | script/scr_main.cpp | PINNED | TU |
| script/scr_memorytree.cpp | script/scr_memorytree.cpp | PINNED | TU |
| script/scr_parser.cpp | script/scr_parser.cpp | PINNED | TU |
| script/scr_parsetree.cpp | script/scr_parsetree.cpp | PINNED | TU |
| script/scr_stringlist.cpp | script/scr_stringlist.cpp | PINNED | TU |
| script/scr_tempmemory.cpp | script/scr_tempmemory.cpp | PINNED | TU |
| script/scr_variable.cpp | script/scr_variable.cpp | PINNED | TU |
| script/scr_vm.cpp | script/scr_vm.cpp | PINNED | TU |
| script/scr_yacc.c | script/scr_yacc.c | PINNED | TU |
| server/server.h | server_mp/server.h | SUPPORTED (module dir) | hdr |
| server/sv_ccmds_mp.cpp | server_mp/sv_ccmds_mp.cpp | PINNED | TU |
| server/sv_client_mp.cpp | server_mp/sv_client_mp.cpp | PINNED | TU |
| server/sv_game_mp.cpp | server_mp/sv_game_mp.cpp | PINNED | TU |
| server/sv_init_mp.cpp | server_mp/sv_init_mp.cpp | PINNED | TU |
| server/sv_main_mp.cpp | server_mp/sv_main_mp.cpp | PINNED | TU |
| server/sv_main_pc_mp.cpp | server_mp/sv_main_pc_mp.cpp | PINNED | TU |
| server/sv_net_chan_mp.cpp | server_mp/sv_net_chan_mp.cpp | PINNED | TU |
| server/sv_snapshot_mp.cpp | server_mp/sv_snapshot_mp.cpp | PINNED | TU |
| server/sv_voice_mp.cpp | server_mp/sv_voice_mp.cpp | PINNED | TU |
| server/sv_world_mp.cpp | server_mp/sv_world_mp.cpp | PINNED | TU |
| speex/bits.c | speex/bits.c | PINNED | TU |
| speex/cb_search.c | speex/cb_search.c | PINNED | TU |
| speex/exc_10_16_table.c | speex/exc_10_16_table.c | kept (no evidence) | TU |
| speex/exc_10_32_table.c | speex/exc_10_32_table.c | kept (no evidence) | TU |
| speex/exc_20_32_table.c | speex/exc_20_32_table.c | kept (no evidence) | TU |
| speex/exc_5_256_table.c | speex/exc_5_256_table.c | kept (no evidence) | TU |
| speex/exc_5_64_table.c | speex/exc_5_64_table.c | kept (no evidence) | TU |
| speex/exc_8_128_table.c | speex/exc_8_128_table.c | kept (no evidence) | TU |
| speex/filters.c | speex/filters.c | PINNED | TU |
| speex/gain_table.c | speex/gain_table.c | kept (no evidence) | TU |
| speex/gain_table_lbr.c | speex/gain_table_lbr.c | kept (no evidence) | TU |
| speex/hexc_10_32_table.c | speex/hexc_10_32_table.c | kept (no evidence) | TU |
| speex/hexc_table.c | speex/hexc_table.c | kept (no evidence) | TU |
| speex/high_lsp_tables.c | speex/high_lsp_tables.c | kept (no evidence) | TU |
| speex/lbr_48k_tables.c | speex/lbr_48k_tables.c | kept (no evidence) | TU |
| speex/lpc.c | speex/lpc.c | PINNED | TU |
| speex/lsp.c | speex/lsp.c | PINNED | TU |
| speex/lsp_tables_nb.c | speex/lsp_tables_nb.c | kept (no evidence) | TU |
| speex/ltp.c | speex/ltp.c | PINNED | TU |
| speex/misc.c | speex/misc.c | PINNED | TU |
| speex/modes.c | speex/modes.c | PINNED | TU |
| speex/nb_celp.c | speex/nb_celp.c | PINNED | TU |
| speex/quant_lsp.c | speex/quant_lsp.c | PINNED | TU |
| speex/sb_celp.c | speex/sb_celp.c | PINNED | TU |
| speex/speex.c | speex/speex.c | PINNED | TU |
| speex/speex_callbacks.c | speex/speex_callbacks.c | PINNED | TU |
| speex/vbr.c | speex/vbr.c | PINNED | TU |
| speex/vq.c | speex/vq.c | PINNED | TU |
| stringed/loc_dvars.cpp | stringed/loc_dvars.cpp | kept (no evidence) | TU |
| stringed/stringed_hooks.cpp | stringed/stringed_hooks.cpp | PINNED | TU |
| stringed/stringed_ingame.cpp | stringed/stringed_ingame.cpp | PINNED | TU |
| stringed/stringed_interface.cpp | stringed/stringed_interface.cpp | PINNED | TU |
| universal/assertive.cpp | universal/assertive.cpp | PINNED | TU |
| universal/com_file_wrapper.cpp | universal/com_file_wrapper.cpp | kept (no evidence) | TU |
| universal/com_files.cpp | universal/com_files.cpp | PINNED | TU |
| universal/com_files_mp.cpp | universal/com_files_mp.cpp | kept (no evidence) | TU |
| universal/com_math.cpp | universal/com_math.cpp | PINNED | TU |
| universal/com_math.h | universal/com_math.h | PINNED | hdr |
| universal/com_memory.cpp | universal/com_memory.cpp | PINNED | TU |
| universal/com_playerprofile.cpp | qcommon/com_playerprofile.cpp | PINNED | TU |
| universal/com_shared.cpp | universal/com_shared.cpp | PINNED | TU |
| universal/com_sndalias.cpp | universal/com_sndalias.cpp | PINNED | TU |
| universal/com_sndalias_load_obj.cpp | universal/com_sndalias_load_obj.cpp | PINNED | TU |
| universal/dedicated_dvar.cpp | universal/dedicated_dvar.cpp | kept (no evidence) | TU |
| universal/dvar.cpp | universal/dvar.cpp | PINNED | TU |
| universal/dvar_cmds.cpp | qcommon/dvar_cmds.cpp | PINNED | TU |
| universal/memfile.cpp | universal/memfile.cpp | PINNED | TU |
| universal/q_parse.cpp | universal/q_parse.cpp | PINNED | TU |
| universal/q_shared.cpp | universal/q_shared.cpp | PINNED | TU |
| universal/q_shared.h | universal/q_shared.h | PINNED | hdr |
| universal/surfaceflags.cpp | universal/surfaceflags.cpp | PINNED | TU |
| unknown/after_assertive.cpp | unknown/after_assertive.cpp | kept (no evidence) | TU |
| unknown/after_bg_weapons_load_obj.cpp | unknown/after_bg_weapons_load_obj.cpp | kept (no evidence) | TU |
| unknown/after_cm_polylib.cpp | unknown/after_cm_polylib.cpp | kept (no evidence) | TU |
| unknown/after_com_memory.cpp | unknown/after_com_memory.cpp | kept (no evidence) | TU |
| unknown/after_com_sndalias_load_obj.cpp | unknown/after_com_sndalias_load_obj.cpp | kept (no evidence) | TU |
| unknown/after_dobj_management.cpp | unknown/after_dobj_management.cpp | kept (no evidence) | TU |
| unknown/after_g_load_utils.cpp | unknown/after_g_load_utils.cpp | kept (no evidence) | TU |
| unknown/after_g_misc_mp.cpp | unknown/after_g_misc_mp.cpp | kept (no evidence) | TU |
| unknown/after_g_mover_mp.cpp | unknown/after_g_mover_mp.cpp | kept (no evidence) | TU |
| unknown/after_msg_mp.cpp | unknown/after_msg_mp.cpp | kept (no evidence) | TU |
| unknown/after_scr_compiler.cpp | unknown/after_scr_compiler.cpp | kept (no evidence) | TU |
| unknown/after_scr_const_mp.cpp | unknown/after_scr_const_mp.cpp | kept (no evidence) | TU |
| unknown/after_scr_tempmemory.cpp | unknown/after_scr_tempmemory.cpp | kept (no evidence) | TU |
| unknown/after_scr_vm.cpp | unknown/after_scr_vm.cpp | kept (no evidence) | TU |
| unknown/after_xmodel_utils.cpp | unknown/after_xmodel_utils.cpp | kept (no evidence) | TU |
| unknown/empty_2.cpp | unknown/empty_2.cpp | kept (no evidence) | TU |
| unknown/empty_3.cpp | unknown/empty_3.cpp | kept (no evidence) | TU |
| unknown/empty_4.cpp | unknown/empty_4.cpp | kept (no evidence) | TU |
| unknown/empty_5.cpp | unknown/empty_5.cpp | kept (no evidence) | TU |
| unknown/empty_6.cpp | unknown/empty_6.cpp | kept (no evidence) | TU |
| unknown/unknown_b013f8.cpp | unknown/unknown_b013f8.cpp | kept (no evidence) | TU |
| win32/win_common.cpp | win32/win_common.cpp | kept (no evidence) | TU |
| win32/win_configure.cpp | win32/win_configure.cpp | kept (no evidence) | TU |
| win32/win_input.cpp | win32/win_input.cpp | kept (no evidence) | TU |
| win32/win_main.cpp | win32/win_main.cpp | kept (no evidence) | TU |
| win32/win_net.cpp | win32/win_net.cpp | PINNED | TU |
| win32/win_shared.cpp | win32/win_shared.cpp | PINNED | TU |
| win32/win_splash.cpp | win32/win_splash.cpp | kept (no evidence) | TU |
| win32/win_wndproc.cpp | win32/win_wndproc.cpp | kept (no evidence) | TU |
| xanim/dobj.cpp | xanim/dobj.cpp | PINNED | TU |
| xanim/r_xsurface_load_obj.cpp | gfx_d3d/r_xsurface_load_obj.cpp | PINNED | TU |
| xanim/xanim.cpp | xanim/xanim.cpp | PINNED | TU |
| xanim/xanim_load.cpp | xanim/xanim_load.cpp | kept (no evidence) | TU |
| xanim/xanim_public.h | xanim/xanim_public.h | PINNED | hdr |
| xanim/xmodel.cpp | xanim/xmodel.cpp | PINNED | TU |
| xanim/xmodel_load.cpp | xanim/xmodel_load.cpp | kept (no evidence) | TU |
| xanim/xmodel_load_obj.cpp | xanim/xmodel_load_obj.cpp | PINNED | TU |
| xanim/xmodel_utils.cpp | xanim/xmodel_utils.cpp | PINNED | TU |
| zlib/adler32.c | zlib/adler32.c | PINNED | TU |
| zlib/compress.c | zlib/compress.c | kept (no evidence) | TU |
| zlib/deflate.c | zlib/deflate.c | kept (no evidence) | TU |
| zlib/infblock.c | zlib/infblock.c | PINNED | TU |
| zlib/infcodes.c | zlib/infcodes.c | PINNED | TU |
| zlib/inffast.c | zlib/inffast.c | PINNED | TU |
| zlib/inflate.c | zlib/inflate.c | PINNED | TU |
| zlib/inftrees.c | zlib/inftrees.c | PINNED | TU |
| zlib/infutil.c | zlib/infutil.c | PINNED | TU |
| zlib/trees.c | zlib/trees.c | kept (no evidence) | TU |
| zlib/uncompr.c | zlib/uncompr.c | kept (no evidence) | TU |
| zlib/unzip.c | zlib/unzip.c | PINNED | TU |
| zlib/zutil.c | zlib/zutil.c | PINNED | TU |
