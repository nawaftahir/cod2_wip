.686
.MODEL FLAT, C
EXTRN sub_1001F72D:PROC
EXTRN sub_1001FACA:PROC
EXTRN sub_1001FFEA:PROC
EXTRN sub_100246CD:PROC
EXTRN sub_100246EA:PROC
EXTRN g_101CE5EF:DWORD
EXTRN g_10678510:DWORD
.CODE
FUN_10008330 PROC
    mov al, byte ptr [g_101CE5EF]
    test al, al
    je L1
    mov eax, dword ptr [g_10678510]
    push esi
    push edi
    mov edi, ebx
    mov esi, ebx
    imul edi, edi, 52
    imul esi, esi, 116
    add esi, eax
    add edi, 010678AC4h
    push edi
    mov eax, esi
    call sub_1001FFEA
    mov eax, dword ptr [esi]
    add esp, 4
    cmp eax, 1
    jne L0
    push -1
    push esi
    push edi
    call sub_1001F72D
    add esp, 12
    push ebx
    mov dword ptr [edi + 12], 5
    call sub_100246CD
    add esp, 4
    pop edi
    pop esi
    ret
L0:
    push esi
    push edi
    call sub_1001FACA
    add esp, 8
    push ebx
    mov dword ptr [edi + 12], 5
    call sub_100246EA
    add esp, 4
    pop edi
    pop esi
L1:
    ret
FUN_10008330 ENDP
END
