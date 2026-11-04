.686
.MODEL FLAT, C
EXTRN sub_100083A8:PROC
EXTRN sub_100083B7:PROC
EXTRN sub_1001F72D:PROC
EXTRN sub_1001FACA:PROC
EXTRN sub_1001FFEA:PROC
EXTRN sub_100246CD:PROC
EXTRN sub_100246EA:PROC
EXTRN EXTRN g_101CE5EF:DWORD:DWORD
EXTRN EXTRN g_10678510:DWORD:DWORD
.CODE
FUN_10008330 PROC
    mov mov al, byte ptr [g_101CE5EF]
    test test al, al
    je sub_100083A8
    mov mov eax, dword ptr [g_10678510]
    push push esi
    push push edi
    mov mov edi, ebx
    mov mov esi, ebx
    imul imul edi, edi, 52
    imul imul esi, esi, 116
    add add esi, eax
    add add edi, 010678AC4h
    push push edi
    mov mov eax, esi
    call sub_1001FFEA
    mov mov eax, dword ptr [esi]
    add add esp, 4
    cmp cmp eax, 1
    jne sub_100083B7
    push push -1
    push push esi
    push push edi
    call sub_1001F72D
    add add esp, 12
    push push ebx
    mov mov dword ptr [edi + 12], 5
    call sub_100246CD
    add add esp, 4
    pop pop edi
    pop pop esi
    ret ret
    push push esi
    push push edi
    call sub_1001FACA
    add add esp, 8
    push push ebx
    mov mov dword ptr [edi + 12], 5
    call sub_100246EA
    add add esp, 4
    pop pop edi
    pop pop esi
    ret ret
FUN_10008330 ENDP
END
