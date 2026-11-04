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
EXTRN sub_10033B48:PROC
EXTRN EXTRN fp_101D49C8:DWORD:DWORD
EXTRN EXTRN g_1019BF40:DWORD:DWORD
EXTRN EXTRN g_101CE75C:DWORD:DWORD
EXTRN EXTRN g_101CE79C:DWORD:DWORD
EXTRN EXTRN g_101D1B5C:DWORD:DWORD
EXTRN EXTRN g_101D1B60:DWORD:DWORD
EXTRN EXTRN g_101D1B64:DWORD:DWORD
EXTRN EXTRN g_101D1B68:DWORD:DWORD
EXTRN EXTRN g_101D1B6C:DWORD:DWORD
EXTRN EXTRN g_101D1B70:DWORD:DWORD
EXTRN EXTRN g_101D1B74:DWORD:DWORD
EXTRN EXTRN g_101D1B78:DWORD:DWORD
EXTRN EXTRN g_101D1B7C:DWORD:DWORD
EXTRN EXTRN g_101D1B80:DWORD:DWORD
EXTRN EXTRN g_101D1B84:DWORD:DWORD
EXTRN EXTRN g_101D1B88:DWORD:DWORD
EXTRN EXTRN g_101D4968:DWORD:DWORD
EXTRN EXTRN g_1076671C:DWORD:DWORD
EXTRN EXTRN g_10766720:DWORD:DWORD
.CODE
FUN_100335d0 PROC
    push push ecx
    mov mov eax, dword ptr [g_101CE79C]
    mov mov cl, byte ptr [eax + 8]
    test test cl, cl
    jne L0
    push push 010197E70h
    push push 0
    call dword ptr [fp_101D49C8]
    push push 010197E20h
    push push 0
    call dword ptr [fp_101D49C8]
    add add esp, 16
    pop pop ecx
    ret ret
    push push 010197DECh
    push push 0
    call dword ptr [fp_101D49C8]
L0:
    fild fild dword ptr [g_10766720]
    mov mov ecx, dword ptr [g_101CE75C]
    mov mov edx, dword ptr [ecx + 8]
    mov mov eax, dword ptr [g_101D1B5C]
    add add esp, 8
    push push edx
    sub sub esp, 8
    fstp fstp dword ptr [esp + 4]
    fild fild dword ptr [g_1076671C]
    fstp fstp dword ptr [esp]
    call sub_10033126
    fmul fmul dword ptr [g_1019BF40]
    add add esp, 4
    fstp fstp qword ptr [esp]
    push push 010197DB8h
    push push 0
    call dword ptr [fp_101D49C8]
    fild fild dword ptr [g_10766720]
    mov mov eax, dword ptr [g_101CE75C]
    mov mov ecx, dword ptr [eax + 8]
    mov mov eax, dword ptr [g_101D1B60]
    add add esp, 16
    push push ecx
    sub sub esp, 8
    fstp fstp dword ptr [esp + 4]
    fild fild dword ptr [g_1076671C]
    fstp fstp dword ptr [esp]
    call sub_1003316B
    fmul fmul dword ptr [g_1019BF40]
    add add esp, 4
    fstp fstp qword ptr [esp]
    push push 010197D84h
    push push 0
    call dword ptr [fp_101D49C8]
    fild fild dword ptr [g_10766720]
    mov mov edx, dword ptr [g_101CE75C]
    mov mov eax, dword ptr [edx + 8]
    add add esp, 16
    push push eax
    mov mov eax, dword ptr [g_101D1B64]
    sub sub esp, 8
    fstp fstp dword ptr [esp + 4]
    fild fild dword ptr [g_1076671C]
    fstp fstp dword ptr [esp]
    call sub_100331B1
    fmul fmul dword ptr [g_1019BF40]
    add add esp, 4
    fstp fstp qword ptr [esp]
    push push 010197D50h
    push push 0
    call dword ptr [fp_101D49C8]
    fild fild dword ptr [g_10766720]
    mov mov ecx, dword ptr [g_101CE75C]
    mov mov edx, dword ptr [ecx + 8]
    mov mov eax, dword ptr [g_101D1B68]
    add add esp, 16
    push push edx
    sub sub esp, 8
    fstp fstp dword ptr [esp + 4]
    fild fild dword ptr [g_1076671C]
    fstp fstp dword ptr [esp]
    call sub_100331F7
    fmul fmul dword ptr [g_1019BF40]
    add add esp, 4
    fstp fstp qword ptr [esp]
    push push 010197D1Ch
    push push 0
    call dword ptr [fp_101D49C8]
    fild fild dword ptr [g_10766720]
    mov mov eax, dword ptr [g_101CE75C]
    mov mov ecx, dword ptr [eax + 8]
    mov mov eax, dword ptr [g_101D1B6C]
    add add esp, 16
    push push ecx
    sub sub esp, 8
    fstp fstp dword ptr [esp + 4]
    fild fild dword ptr [g_1076671C]
    fstp fstp dword ptr [esp]
    call sub_1003323C
    fmul fmul dword ptr [g_1019BF40]
    add add esp, 4
    fstp fstp qword ptr [esp]
    push push 010197CE8h
    push push 0
    call dword ptr [fp_101D49C8]
    fild fild dword ptr [g_10766720]
    mov mov edx, dword ptr [g_101CE75C]
    mov mov eax, dword ptr [edx + 8]
    add add esp, 16
    push push eax
    mov mov eax, dword ptr [g_101D1B70]
    sub sub esp, 8
    fstp fstp dword ptr [esp + 4]
    fild fild dword ptr [g_1076671C]
    fstp fstp dword ptr [esp]
    call sub_10033282
    fmul fmul dword ptr [g_1019BF40]
    add add esp, 4
    fstp fstp qword ptr [esp]
    push push 010197CB4h
    push push 0
    call dword ptr [fp_101D49C8]
    fild fild dword ptr [g_10766720]
    mov mov ecx, dword ptr [g_101CE75C]
    mov mov edx, dword ptr [ecx + 8]
    mov mov eax, dword ptr [g_101D1B74]
    add add esp, 16
    push push edx
    sub sub esp, 8
    fstp fstp dword ptr [esp + 4]
    fild fild dword ptr [g_1076671C]
    fstp fstp dword ptr [esp]
    call sub_100332C8
    fmul fmul dword ptr [g_1019BF40]
    add add esp, 4
    fstp fstp qword ptr [esp]
    push push 010197C80h
    push push 0
    call dword ptr [fp_101D49C8]
    fild fild dword ptr [g_10766720]
    mov mov eax, dword ptr [g_101CE75C]
    mov mov ecx, dword ptr [eax + 8]
    mov mov eax, dword ptr [g_101D1B78]
    add add esp, 16
    push push ecx
    sub sub esp, 8
    fstp fstp dword ptr [esp + 4]
    fild fild dword ptr [g_1076671C]
    fstp fstp dword ptr [esp]
    call sub_1003330D
    fmul fmul dword ptr [g_1019BF40]
    add add esp, 4
    fstp fstp qword ptr [esp]
    push push 010197C4Ch
    push push 0
    call dword ptr [fp_101D49C8]
    mov mov al, byte ptr [g_101D4968]
    add add esp, 16
    test test al, al
    je sub_10033B48
    mov mov edx, dword ptr [g_101CE75C]
    fild fild dword ptr [g_10766720]
    mov mov eax, dword ptr [edx + 8]
    push push eax
    mov mov eax, dword ptr [g_101D1B7C]
    sub sub esp, 8
    fstp fstp dword ptr [esp + 4]
    fild fild dword ptr [g_1076671C]
    fstp fstp dword ptr [esp]
    call sub_10033360
    fmul fmul dword ptr [g_1019BF40]
    add add esp, 4
    fstp fstp qword ptr [esp]
    push push 010197C18h
    push push 0
    call dword ptr [fp_101D49C8]
    fild fild dword ptr [g_10766720]
    mov mov ecx, dword ptr [g_101CE75C]
    mov mov edx, dword ptr [ecx + 8]
    mov mov eax, dword ptr [g_101D1B80]
    add add esp, 16
    push push edx
    sub sub esp, 8
    fstp fstp dword ptr [esp + 4]
    fild fild dword ptr [g_1076671C]
    fstp fstp dword ptr [esp]
    call sub_100333A6
    fmul fmul dword ptr [g_1019BF40]
    add add esp, 4
    fstp fstp qword ptr [esp]
    push push 010197BE4h
    push push 0
    call dword ptr [fp_101D49C8]
    add add esp, 16
    mov mov eax, dword ptr [g_101D1B84]
    push push 18
    push push eax
    call sub_100334DF
    fstp fstp qword ptr [esp]
    push push 010197BB0h
    push push 0
    call dword ptr [fp_101D49C8]
    mov mov ecx, dword ptr [g_101D1B88]
    push push 18
    push push ecx
    call sub_100334FD
    fstp fstp qword ptr [esp + 16]
    add add esp, 16
    push push 010197B7Ch
    push push 0
    call dword ptr [fp_101D49C8]
    mov mov edx, dword ptr [g_101D1B84]
    push push 9
    push push edx
    call sub_1003351F
    fstp fstp qword ptr [esp + 16]
    add add esp, 16
    push push 010197B48h
    push push 0
    call dword ptr [fp_101D49C8]
    mov mov eax, dword ptr [g_101D1B88]
    push push 9
    push push eax
    call sub_10033540
    fstp fstp qword ptr [esp + 16]
    add add esp, 16
    push push 010197B14h
    push push 0
    call dword ptr [fp_101D49C8]
    push push 010197DECh
    push push 0
    call dword ptr [fp_101D49C8]
    add add esp, 24
    pop pop ecx
    ret ret
FUN_100335d0 ENDP
END
