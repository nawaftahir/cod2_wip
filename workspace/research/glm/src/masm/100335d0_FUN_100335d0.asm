.686
.MODEL FLAT, C
EXTRN sub_10033126:PROC
EXTRN sub_1003316B:PROC
EXTRN sub_100331B1:PROC
EXTRN sub_100331F7:PROC
EXTRN sub_1003323C:PROC
EXTRN sub_10033282:PROC
EXTRN sub_100332C8:PROC
EXTRN sub_1003330D:PROC
EXTRN sub_10033360:PROC
EXTRN sub_100333A6:PROC
EXTRN sub_100334DF:PROC
EXTRN sub_100334FD:PROC
EXTRN sub_1003351F:PROC
EXTRN sub_10033540:PROC
EXTRN fp_101D49C8:DWORD
EXTRN g_1019BF40:DWORD
EXTRN g_101CE75C:DWORD
EXTRN g_101CE79C:DWORD
EXTRN g_101D1B5C:DWORD
EXTRN g_101D1B60:DWORD
EXTRN g_101D1B64:DWORD
EXTRN g_101D1B68:DWORD
EXTRN g_101D1B6C:DWORD
EXTRN g_101D1B70:DWORD
EXTRN g_101D1B74:DWORD
EXTRN g_101D1B78:DWORD
EXTRN g_101D1B7C:DWORD
EXTRN g_101D1B80:DWORD
EXTRN g_101D1B84:DWORD
EXTRN g_101D1B88:DWORD
EXTRN g_101D4968:DWORD
EXTRN g_1076671C:DWORD
EXTRN g_10766720:DWORD
.CODE
FUN_100335d0 PROC
    push ecx
    mov eax, dword ptr [g_101CE79C]
    mov cl, byte ptr [eax + 8]
    test cl, cl
    jne L0
    push 010197E70h
    push 0
    call dword ptr [fp_101D49C8]
    push 010197E20h
    push 0
    call dword ptr [fp_101D49C8]
    add esp, 16
    pop ecx
    ret
L0:
    push 010197DECh
    push 0
    call dword ptr [fp_101D49C8]
    fild dword ptr [g_10766720]
    mov ecx, dword ptr [g_101CE75C]
    mov edx, dword ptr [ecx + 8]
    mov eax, dword ptr [g_101D1B5C]
    add esp, 8
    push edx
    sub esp, 8
    fstp dword ptr [esp + 4]
    fild dword ptr [g_1076671C]
    fstp dword ptr [esp]
    call sub_10033126
    fmul dword ptr [g_1019BF40]
    add esp, 4
    fstp qword ptr [esp]
    push 010197DB8h
    push 0
    call dword ptr [fp_101D49C8]
    fild dword ptr [g_10766720]
    mov eax, dword ptr [g_101CE75C]
    mov ecx, dword ptr [eax + 8]
    mov eax, dword ptr [g_101D1B60]
    add esp, 16
    push ecx
    sub esp, 8
    fstp dword ptr [esp + 4]
    fild dword ptr [g_1076671C]
    fstp dword ptr [esp]
    call sub_1003316B
    fmul dword ptr [g_1019BF40]
    add esp, 4
    fstp qword ptr [esp]
    push 010197D84h
    push 0
    call dword ptr [fp_101D49C8]
    fild dword ptr [g_10766720]
    mov edx, dword ptr [g_101CE75C]
    mov eax, dword ptr [edx + 8]
    add esp, 16
    push eax
    mov eax, dword ptr [g_101D1B64]
    sub esp, 8
    fstp dword ptr [esp + 4]
    fild dword ptr [g_1076671C]
    fstp dword ptr [esp]
    call sub_100331B1
    fmul dword ptr [g_1019BF40]
    add esp, 4
    fstp qword ptr [esp]
    push 010197D50h
    push 0
    call dword ptr [fp_101D49C8]
    fild dword ptr [g_10766720]
    mov ecx, dword ptr [g_101CE75C]
    mov edx, dword ptr [ecx + 8]
    mov eax, dword ptr [g_101D1B68]
    add esp, 16
    push edx
    sub esp, 8
    fstp dword ptr [esp + 4]
    fild dword ptr [g_1076671C]
    fstp dword ptr [esp]
    call sub_100331F7
    fmul dword ptr [g_1019BF40]
    add esp, 4
    fstp qword ptr [esp]
    push 010197D1Ch
    push 0
    call dword ptr [fp_101D49C8]
    fild dword ptr [g_10766720]
    mov eax, dword ptr [g_101CE75C]
    mov ecx, dword ptr [eax + 8]
    mov eax, dword ptr [g_101D1B6C]
    add esp, 16
    push ecx
    sub esp, 8
    fstp dword ptr [esp + 4]
    fild dword ptr [g_1076671C]
    fstp dword ptr [esp]
    call sub_1003323C
    fmul dword ptr [g_1019BF40]
    add esp, 4
    fstp qword ptr [esp]
    push 010197CE8h
    push 0
    call dword ptr [fp_101D49C8]
    fild dword ptr [g_10766720]
    mov edx, dword ptr [g_101CE75C]
    mov eax, dword ptr [edx + 8]
    add esp, 16
    push eax
    mov eax, dword ptr [g_101D1B70]
    sub esp, 8
    fstp dword ptr [esp + 4]
    fild dword ptr [g_1076671C]
    fstp dword ptr [esp]
    call sub_10033282
    fmul dword ptr [g_1019BF40]
    add esp, 4
    fstp qword ptr [esp]
    push 010197CB4h
    push 0
    call dword ptr [fp_101D49C8]
    fild dword ptr [g_10766720]
    mov ecx, dword ptr [g_101CE75C]
    mov edx, dword ptr [ecx + 8]
    mov eax, dword ptr [g_101D1B74]
    add esp, 16
    push edx
    sub esp, 8
    fstp dword ptr [esp + 4]
    fild dword ptr [g_1076671C]
    fstp dword ptr [esp]
    call sub_100332C8
    fmul dword ptr [g_1019BF40]
    add esp, 4
    fstp qword ptr [esp]
    push 010197C80h
    push 0
    call dword ptr [fp_101D49C8]
    fild dword ptr [g_10766720]
    mov eax, dword ptr [g_101CE75C]
    mov ecx, dword ptr [eax + 8]
    mov eax, dword ptr [g_101D1B78]
    add esp, 16
    push ecx
    sub esp, 8
    fstp dword ptr [esp + 4]
    fild dword ptr [g_1076671C]
    fstp dword ptr [esp]
    call sub_1003330D
    fmul dword ptr [g_1019BF40]
    add esp, 4
    fstp qword ptr [esp]
    push 010197C4Ch
    push 0
    call dword ptr [fp_101D49C8]
    mov al, byte ptr [g_101D4968]
    add esp, 16
    test al, al
    je L1
    mov edx, dword ptr [g_101CE75C]
    fild dword ptr [g_10766720]
    mov eax, dword ptr [edx + 8]
    push eax
    mov eax, dword ptr [g_101D1B7C]
    sub esp, 8
    fstp dword ptr [esp + 4]
    fild dword ptr [g_1076671C]
    fstp dword ptr [esp]
    call sub_10033360
    fmul dword ptr [g_1019BF40]
    add esp, 4
    fstp qword ptr [esp]
    push 010197C18h
    push 0
    call dword ptr [fp_101D49C8]
    fild dword ptr [g_10766720]
    mov ecx, dword ptr [g_101CE75C]
    mov edx, dword ptr [ecx + 8]
    mov eax, dword ptr [g_101D1B80]
    add esp, 16
    push edx
    sub esp, 8
    fstp dword ptr [esp + 4]
    fild dword ptr [g_1076671C]
    fstp dword ptr [esp]
    call sub_100333A6
    fmul dword ptr [g_1019BF40]
    add esp, 4
    fstp qword ptr [esp]
    push 010197BE4h
    push 0
    call dword ptr [fp_101D49C8]
    add esp, 16
L1:
    mov eax, dword ptr [g_101D1B84]
    push 18
    push eax
    call sub_100334DF
    fstp qword ptr [esp]
    push 010197BB0h
    push 0
    call dword ptr [fp_101D49C8]
    mov ecx, dword ptr [g_101D1B88]
    push 18
    push ecx
    call sub_100334FD
    fstp qword ptr [esp + 16]
    add esp, 16
    push 010197B7Ch
    push 0
    call dword ptr [fp_101D49C8]
    mov edx, dword ptr [g_101D1B84]
    push 9
    push edx
    call sub_1003351F
    fstp qword ptr [esp + 16]
    add esp, 16
    push 010197B48h
    push 0
    call dword ptr [fp_101D49C8]
    mov eax, dword ptr [g_101D1B88]
    push 9
    push eax
    call sub_10033540
    fstp qword ptr [esp + 16]
    add esp, 16
    push 010197B14h
    push 0
    call dword ptr [fp_101D49C8]
    push 010197DECh
    push 0
    call dword ptr [fp_101D49C8]
    add esp, 24
    pop ecx
    ret
FUN_100335d0 ENDP
END
