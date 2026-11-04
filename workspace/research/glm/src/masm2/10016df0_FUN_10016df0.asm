.686
.MODEL FLAT, C
EXTRN sub_10016E50:PROC
EXTRN sub_10016E51:PROC
EXTRN sub_10016E79:PROC
EXTRN sub_100EFE7A:PROC
EXTRN EXTRN fp_101D49CC:DWORD:DWORD
EXTRN EXTRN g_101D1BF8:DWORD:DWORD
.CODE
FUN_10016df0 PROC
    push push esi
    push push edi
    xor xor edi, edi
    mov mov esi, dword ptr [edi + 0101DA564h]
    test test esi, esi
    je sub_10016E50
    mov mov al, byte ptr [esi + 10]
    lea lea edx, [esi + 12]
    push push edx
    mov mov edx, dword ptr [esi + 4]
    test test al, al
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov ecx, dword ptr [eax]
    push push edx
    push push eax
    jne L0
    call call dword ptr [ecx + 016Ch]
    jmp sub_10016E50
    call call dword ptr [ecx + 01A8h]
    test test eax, eax
    jge sub_10016E79
    push push eax
    push push eax
    call sub_100EFE7A
    push push eax
    mov mov eax, dword ptr [esi]
    push push eax
    push push 010194408h
    push push 0
    call dword ptr [fp_101D49CC]
    add add esp, 20
L0:
    add add edi, 4
    cmp cmp edi, 0400h
    jb sub_10016E51
    pop pop edi
    pop pop esi
    ret ret
FUN_10016df0 ENDP
END
