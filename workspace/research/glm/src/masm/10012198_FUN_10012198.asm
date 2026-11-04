.686
.MODEL FLAT, C
EXTRN sub_1003C307:PROC
EXTRN sub_100EFE65:PROC
EXTRN fp_101D49C8:DWORD
EXTRN g_101D1BF8:DWORD
.CODE
FUN_10012198 PROC
    push ebx
    push esi
    push edi
    mov ebx, 0107645BCh
L0:
    xor esi, esi
    lea edi, [ebx - 8]
L1:
    mov eax, dword ptr [g_101D1BF8]
    mov edx, dword ptr [eax]
    push edi
    push 9
    push eax
    call dword ptr [edx + 0x1d8]
    test eax, eax
    jge L2
    push eax
    push eax
    call sub_100EFE65
    push eax
    push 010193CD8h
    push 0
    call dword ptr [fp_101D49C8]
    add esp, 16
L2:
    mov byte ptr [ebx + esi], 0
    inc esi
    add edi, 4
    cmp esi, 2
    jl L1
    add ebx, 48
    cmp ebx, 01076467Ch
    jl L0
    push 010193CBCh
    push 0
    call dword ptr [fp_101D49C8]
    add esp, 8
    call sub_1003C307
    pop edi
    pop esi
    mov al, 1
    pop ebx
    ret
FUN_10012198 ENDP
END
