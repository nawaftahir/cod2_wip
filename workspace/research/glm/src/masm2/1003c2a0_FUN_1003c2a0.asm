.686
.MODEL FLAT, C
EXTRN sub_1003C1B9:PROC
EXTRN sub_1003C433:PROC
EXTRN sub_1003D889:PROC
EXTRN sub_1003EADE:PROC
EXTRN EXTRN g_101CE644:DWORD:DWORD
EXTRN EXTRN g_101D4C6C:DWORD:DWORD
EXTRN EXTRN g_101D4C70:DWORD:DWORD
EXTRN EXTRN g_1072DDE0:DWORD:DWORD
EXTRN EXTRN g_1072DDE4:DWORD:DWORD
EXTRN EXTRN g_1072DDE8:DWORD:DWORD
EXTRN EXTRN g_1072DDEC:DWORD:DWORD
EXTRN EXTRN g_1072DEBE:DWORD:DWORD
EXTRN EXTRN g_10766680:DWORD:DWORD
EXTRN EXTRN g_10766684:DWORD:DWORD
EXTRN EXTRN g_10766688:DWORD:DWORD
EXTRN EXTRN g_1076668C:DWORD:DWORD
EXTRN EXTRN g_10766690:DWORD:DWORD
EXTRN EXTRN g_10766718:DWORD:DWORD
EXTRN EXTRN g_10766730:DWORD:DWORD
EXTRN EXTRN g_10766734:DWORD:DWORD
EXTRN EXTRN g_10766738:DWORD:DWORD
EXTRN EXTRN g_1076673C:DWORD:DWORD
EXTRN EXTRN g_10766740:DWORD:DWORD
EXTRN EXTRN g_10766744:DWORD:DWORD
EXTRN EXTRN g_10766748:DWORD:DWORD
EXTRN EXTRN g_107667B4:DWORD:DWORD
EXTRN EXTRN g_107667CC:DWORD:DWORD
.CODE
FUN_1003c2a0 PROC
    push push ebx
    push push edi
    xor xor eax, eax
    mov mov ecx, 085Ch
    mov mov edi, 010764680h
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov eax, dword ptr [g_101CE644]
    mov mov ecx, dword ptr [eax + 8]
    mov mov dl, byte ptr [ecx + 0101906B0h]
    mov mov byte ptr [g_1072DEBE], dl
    call sub_1003D889
    mov mov ecx, dword ptr [g_101D4C70]
    mov mov eax, 0E00E0007h
    mov mov dword ptr [g_1076668C], eax
    mov mov dword ptr [g_10766684], eax
    mov mov eax, dword ptr [g_101D4C6C]
    xor xor ebx, ebx
    mov mov dword ptr [g_1072DDE8], eax
    mov mov dword ptr [g_10766738], eax
    xor xor eax, eax
    mov mov dword ptr [g_10766688], 019128912h
    mov mov dword ptr [g_10766680], 018128812h
    mov mov dword ptr [g_10766690], ebx
    mov mov dword ptr [g_1072DDE0], ebx
    mov mov dword ptr [g_1072DDE4], ebx
    mov mov dword ptr [g_1072DDEC], ecx
    mov mov dword ptr [g_10766730], ebx
    mov mov dword ptr [g_10766734], ebx
    mov mov dword ptr [g_1076673C], ecx
    mov mov dword ptr [g_10766740], ebx
    mov mov dword ptr [g_10766744], 03F800000h
    mov mov dword ptr [g_10766718], 14
    call sub_1003EADE
    mov mov byte ptr [g_10766748], bl
    call sub_1003C1B9
    xor xor eax, eax
    mov mov ecx, 1
    mov mov dword ptr [eax*4 + 010766774h], ebx
    mov mov byte ptr [eax + 010766764h], cl
    inc inc eax
    cmp cmp eax, 16
    jl sub_1003C433
    mov mov dword ptr [g_107667B4], ecx
    or or eax, -1
    mov mov dword ptr [g_107667CC], eax
    mov mov ecx, 0400h
    mov mov edi, 010764680h
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov ecx, 0400h
    mov mov edi, 010765680h
    rep stosd rep stosd dword ptr es:[edi], eax
    pop pop edi
    pop pop ebx
    ret ret
FUN_1003c2a0 ENDP
END
