.686
.MODEL FLAT, C
EXTRN sub_1003C307:PROC
EXTRN sub_100EFE65:PROC
EXTRN EXTRN fp_101D49C8:DWORD:DWORD
EXTRN EXTRN g_101D1BF8:DWORD:DWORD
.CODE
FUN_10012198 PROC
    push push ebx
    push push esi
    push push edi
    mov mov ebx, 0107645BCh
    xor xor esi, esi
    lea lea edi, [ebx - 8]
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov edx, dword ptr [eax]
    push push edi
    push push 9
    push push eax
    call call dword ptr [edx + 01D8h]
    test test eax, eax
    jge L2
    push push eax
    push push eax
    call sub_100EFE65
    push push eax
    push push 010193CD8h
    push push 0
    call dword ptr [fp_101D49C8]
    add add esp, 16
    mov mov byte ptr [ebx + esi], 0
    inc inc esi
    add add edi, 4
    cmp cmp esi, 2
    jl L0
    add add ebx, 48
    cmp cmp ebx, 01076467Ch
    jl L1
    push push 010193CBCh
    push push 0
    call dword ptr [fp_101D49C8]
    add add esp, 8
    call sub_1003C307
    pop pop edi
    pop pop esi
    mov mov al, 1
    pop pop ebx
    ret ret
FUN_10012198 ENDP
END
