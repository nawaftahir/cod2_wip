.686
.MODEL FLAT, C
EXTRN sub_1003C1B9:PROC
EXTRN sub_1003D889:PROC
EXTRN sub_1003EADE:PROC
EXTRN g_101CE644:DWORD
EXTRN g_101D4C6C:DWORD
EXTRN g_101D4C70:DWORD
EXTRN g_1072DDE0:DWORD
EXTRN g_1072DDE4:DWORD
EXTRN g_1072DDE8:DWORD
EXTRN g_1072DDEC:DWORD
EXTRN g_1072DEBE:DWORD
EXTRN g_10766680:DWORD
EXTRN g_10766684:DWORD
EXTRN g_10766688:DWORD
EXTRN g_1076668C:DWORD
EXTRN g_10766690:DWORD
EXTRN g_10766718:DWORD
EXTRN g_10766730:DWORD
EXTRN g_10766734:DWORD
EXTRN g_10766738:DWORD
EXTRN g_1076673C:DWORD
EXTRN g_10766740:DWORD
EXTRN g_10766744:DWORD
EXTRN g_10766748:DWORD
EXTRN g_107667B4:DWORD
EXTRN g_107667CC:DWORD
.CODE
FUN_1003c2a0 PROC
    push ebx
    push edi
    xor eax, eax
    mov ecx, 00000085Ch
    mov edi, 010764680h
    rep stosd dword ptr es:[edi], eax
    mov eax, dword ptr [g_101CE644]
    mov ecx, dword ptr [eax + 8]
    mov dl, byte ptr [ecx + 0101906B0h]
    mov byte ptr [g_1072DEBE], dl
    call sub_1003D889
    mov ecx, dword ptr [g_101D4C70]
    mov eax, 0E00E0007h
    mov dword ptr [g_1076668C], eax
    mov dword ptr [g_10766684], eax
    mov eax, dword ptr [g_101D4C6C]
    xor ebx, ebx
    mov dword ptr [g_1072DDE8], eax
    mov dword ptr [g_10766738], eax
    xor eax, eax
    mov dword ptr [g_10766688], 019128912h
    mov dword ptr [g_10766680], 018128812h
    mov dword ptr [g_10766690], ebx
    mov dword ptr [g_1072DDE0], ebx
    mov dword ptr [g_1072DDE4], ebx
    mov dword ptr [g_1072DDEC], ecx
    mov dword ptr [g_10766730], ebx
    mov dword ptr [g_10766734], ebx
    mov dword ptr [g_1076673C], ecx
    mov dword ptr [g_10766740], ebx
    mov dword ptr [g_10766744], 03F800000h
    mov dword ptr [g_10766718], 14
    call sub_1003EADE
    mov byte ptr [g_10766748], bl
    call sub_1003C1B9
    xor eax, eax
    mov ecx, 1
L0:
    mov dword ptr [eax*4 + 010766774h], ebx
    mov byte ptr [eax + 010766764h], cl
    inc eax
    cmp eax, 16
    jl L0
    mov dword ptr [g_107667B4], ecx
    or eax, 0FFFFFFFFh
    mov dword ptr [g_107667CC], eax
    mov ecx, 000000400h
    mov edi, 010764680h
    rep stosd dword ptr es:[edi], eax
    mov ecx, 000000400h
    mov edi, 010765680h
    rep stosd dword ptr es:[edi], eax
    pop edi
    pop ebx
    ret
FUN_1003c2a0 ENDP
END
