.686
.MODEL FLAT, C
EXTRN sub_100EFE7A:PROC
EXTRN fp_101D49CC:DWORD
EXTRN g_101D1BF8:DWORD
.CODE
FUN_10016df0 PROC
    push esi
    push edi
    xor edi, edi
L0:
    mov esi, dword ptr [edi + 0101DA564h]
    test esi, esi
    je L3
    mov al, byte ptr [esi + 10]
    lea edx, [esi + 12]
    push edx
    mov edx, dword ptr [esi + 4]
    test al, al
    mov eax, dword ptr [g_101D1BF8]
    mov ecx, dword ptr [eax]
    push edx
    push eax
    jne L1
    call dword ptr [ecx + 0x16c]
    jmp L2
L1:
    call dword ptr [ecx + 0x1a8]
L2:
    test eax, eax
    jge L3
    push eax
    push eax
    call sub_100EFE7A
    push eax
    mov eax, dword ptr [esi]
    push eax
    push 010194408h
    push 0
    call dword ptr [fp_101D49CC]
    add esp, 20
L3:
    add edi, 4
    cmp edi, 000000400h
    jb L0
    pop edi
    pop esi
    ret
FUN_10016df0 ENDP
END
