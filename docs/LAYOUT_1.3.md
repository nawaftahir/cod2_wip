# 1.3 layout gap report (tools/layout13.py)

Retail span = classify13-assigned bytes per TU; ours = cmp13.json fn bytes. Missing = retail - ours (negative = we have extra).
Retail .text 1580723 B, ours 1577260 B, total missing 26946 B.

## TUs by missing bytes

| TU | retail addr | retail B (fns) | ours B (fns) | matched B | missing B |
|---|---|---|---|---|---|
| record_dsound.obj | 4bae80 | 8797 (58) | 1415 (9) | 0 | 7382 |
| libwww (HT*.c, 95 TUs) | 547f20 | 193901 (1852) | 187016 (1645) | 53719 | 6885 |
| cpu_disp.obj | 580f62 | 2703 (12) | 279 (3) | 0 | 2424 |
| cl_console_mp.obj | 403630 | 15360 (94) | 13319 (88) | 391 | 2041 |
| inittime.obj | 5873e5 | 3389 (6) | 1366 (3) | 400 | 2023 |
| com_memory.obj | 40db30 | 4894 (78) | 2945 (55) | 120 | 1949 |
| WSOCK32.dll | 547a14 | 1865 (26) | 156 (26) | 144 | 1709 |
| cl_ui_pc_mp.obj | 4b52f0 | 3030 (20) | 1350 (6) | 0 | 1680 |
| abort.obj | 57dd90 | 1495 (9) | 23 (1) | 0 | 1472 |
| intrncvt.obj | 589fa5 | 2275 (14) | 1124 (14) | 896 | 1151 |
| strdup.obj | 586b90 | 968 (5) | 43 (1) | 43 | 925 |
| win_main.obj | 448720 | 6764 (48) | 5899 (42) | 454 | 865 |
| read.obj | 5830d4 | 1474 (5) | 646 (2) | 0 | 828 |
| floor_pentium4.obj | 57aff0 | 1117 (3) | 289 (2) | 0 | 828 |
| cg_scoreboard_mp.obj | 4d8db0 | 8267 (30) | 7525 (29) | 139 | 742 |
| common.obj | 431ca0 | 15408 (101) | 14716 (89) | 864 | 692 |
| CIL | 48c870 | 691 (6) | 0 (0) | 0 | 691 |
| cfout.obj | 58babf | 775 (4) | 294 (2) | 186 | 481 |
| ulldvrm.obj | 587190 | 597 (2) | 149 (1) | 149 | 448 |
| cl_keys_mp.obj | 409b00 | 8747 (40) | 8303 (34) | 80 | 444 |
| ftol2.obj | 57f114 | 540 (8) | 117 (1) | 117 | 423 |
| cl_main_mp.obj | 4034a0 | 26245 (141) | 25838 (111) | 34 | 407 |
| tolower.obj | 57b4ee | 618 (4) | 242 (3) | 208 | 376 |
| powhlp.obj | 590dc7 | 834 (7) | 464 (2) | 0 | 370 |
| 87tran.obj | 590aa0 | 807 (3) | 519 (1) | 0 | 288 |
| a_env.obj | 58630d | 574 (2) | 290 (1) | 0 | 284 |
| calloc.obj | 57d8c7 | 470 (6) | 187 (1) | 0 | 283 |
| FxPrimitives.obj | 493540 | 22682 (222) | 22403 (193) | 10676 | 279 |
| wsetenv.obj | 58d97d | 1168 (4) | 894 (3) | 97 | 274 |
| ui_shared_obj.obj | 542fc0 | 13022 (144) | 12758 (128) | 4992 | 264 |
| cm_trace.obj | 41b6f0 | 14131 (46) | 13872 (41) | 368 | 259 |
| cl_cgame_mp.obj | 4011e0 | 8291 (94) | 8055 (92) | 90 | 236 |
| scr_compiler.obj | 46aa00 | 39251 (217) | 39016 (198) | 2364 | 235 |
| dvar_cmds.obj | 439860 | 4672 (29) | 4443 (27) | 0 | 229 |
| cl_cin_mp.obj | 4034b0 | 451 (18) | 225 (8) | 0 | 226 |
| dvar.obj | 4359a0 | 15143 (144) | 14932 (127) | 1572 | 211 |
| crtmbox.obj | 58b83f | 448 (2) | 249 (1) | 0 | 199 |
| mss_auto.obj | 547070 | 225 (7) | 32 (2) | 0 | 193 |
| play.obj | 4ba270 | 355 (16) | 167 (6) | 77 | 188 |
| cl_ui_mp.obj | 414f00 | 2856 (34) | 2668 (27) | 145 | 188 |
| hooks.obj | 58ed7f | 308 (3) | 122 (3) | 0 | 186 |
| ceil_pentium4.obj | 57a800 | 464 (2) | 285 (2) | 0 | 179 |
| frnd.obj | 589929 | 183 (3) | 17 (1) | 17 | 166 |
| scr_variable.obj | 449310 | 19318 (190) | 19157 (165) | 380 | 161 |
| com_files_mp.obj | 43aba0 | 7586 (31) | 7427 (28) | 28 | 159 |
| sv_main_mp.obj | 45a260 | 9488 (22) | 9340 (24) | 209 | 148 |
| com_math.obj | 425d10 | 24749 (181) | 24608 (173) | 6707 | 141 |
| g_client_script_cmd_mp.obj | 5299f0 | 17633 (65) | 17497 (62) | 49 | 136 |
| closeall.obj | 5859c7 | 291 (2) | 155 (1) | 0 | 136 |
| sv_client_mp.obj | 452c10 | 14692 (48) | 14564 (42) | 254 | 128 |
| strupr.obj | 58ce80 | 400 (2) | 276 (1) | 0 | 124 |
| memset.obj | 585b80 | 214 (3) | 96 (1) | 96 | 118 |
| setenv.obj | 58ac29 | 756 (4) | 643 (3) | 97 | 113 |
| cg_event_mp.obj | 4e03f0 | 5990 (9) | 5886 (7) | 232 | 104 |
| wincrt0.obj | 57dab5 | 731 (3) | 628 (4) | 0 | 103 |
| ui_shared_mp.obj | 534510 | 36826 (177) | 36723 (159) | 5170 | 103 |
| xanim_load.obj | 48edb0 | 4640 (9) | 4547 (7) | 40 | 93 |
| dosmap.obj | 57f330 | 226 (5) | 133 (3) | 0 | 93 |
| win_input.obj | 462580 | 1269 (22) | 1181 (16) | 0 | 88 |
| cmd.obj | 420a80 | 3038 (39) | 2952 (34) | 369 | 86 |

## TUs out of retail order (by first fn address; outside longest in-order run)

cl_main_mp.obj, scr_vm.obj, FxScheduler.obj, com_memory.obj, q_shared.obj, snd.obj, win_threads.obj, win_common.obj, win_main.obj, scr_variable.obj, win_shared.obj, cg_newDraw_mp.obj, misc.obj, g_scr_main_mp.obj, g_utils_mp.obj, setlocal.obj, stringed_hooks.obj, snd_driver.obj, win_input.obj, scr_yacc.obj, xmodel.obj, bg_weapons.obj, cg_main_mp.obj, pbsv.obj, pbmd5.obj, WINMM.dll, cg_ents_mp.obj, g_combat_mp.obj, g_mover_mp.obj, ui_main_mp.obj, fpinit.obj, mss_auto.obj, WSOCK32.dll, vsnprint.obj, unlink.obj, adj_fdiv.obj, wincrt0.obj, crt0msg.obj, winxfltr.obj, wincmdln.obj, stdenvp.obj, stdargv.obj, a_env.obj, _stricmp.obj, a_map.obj, a_cmp.obj, secfail.obj, crtmbox.obj, ismbbyte.obj, stricmp.obj, strnicmp.obj, chsize.obj, _strnicm.obj, wsetenv.obj, 87tran.obj

## TUs only in ours (no retail pairing)

87triga.obj, ADVAPI32.dll, DSOUND.dll, GDI32.dll, KERNEL32.dll, SGML.obj, SHELL32.dll, USER32.dll, a_str.obj, ceil.obj, chkstk.obj, crt0fp.obj, ctime.obj, ctype.obj, d3d9.dll, dl_main.obj, drive.obj, fgets.obj, floor.obj, fp8.obj, fputc.obj, fputs.obj, getpid.obj, initctyp.obj, initmon.obj, initnum.obj, initsect.obj, lconv.obj, lowhelpr.obj, mbsrchr.obj, md5.obj, memcpy.obj, memmove.obj, module, msize.obj, mss32.dll, open.obj, pow_pentium4.obj, purevirt.obj, rmdir.obj, rmtmp.obj, sehsupp.obj, setmode.obj, strgtold.obj, strncpy.obj, surfaceflags.obj, unhandld.obj, vfprintf.obj, vsprintf.obj, winsig.obj

## Fns out of order inside a TU (unique-hit fns; see fnorder.py)

| TU | moved fns | examples |
|---|---|---|
| scr_compiler.obj | 1 | ?EmitExpression@@YAXTsval_u@@P |
