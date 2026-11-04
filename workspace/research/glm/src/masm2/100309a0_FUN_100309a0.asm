.686
.MODEL FLAT, C
EXTRN sub_1003095F:PROC
EXTRN sub_1003096E:PROC
EXTRN sub_10030A2C:PROC
EXTRN sub_10030A2F:PROC
EXTRN sub_1003A8EF:PROC
EXTRN EXTRN g_101CE830:DWORD:DWORD
EXTRN EXTRN g_1072D9D0:DWORD:DWORD
EXTRN EXTRN g_1072D9E0:DWORD:DWORD
.CODE
FUN_100309a0 PROC
    push push ebp
    mov mov ebp, esp
    and and esp, -8
    push push ecx
    mov mov eax, dword ptr [g_1072D9D0]
    test test eax, eax
    push push esi
    jne L0
    mov mov eax, dword ptr [g_1072D9E0]
    test test eax, eax
    je L1
    call sub_1003A8EF
    mov mov eax, dword ptr [g_101CE830]
    mov mov ecx, dword ptr [eax + 8]
    xor xor esi, esi
    test test ecx, ecx
L0:
    jle sub_10030A2C
    lea lea ecx, [ecx]
    push push 03F7F0000h
    push push 03C400000h
    call sub_1003095F
    push push 03F7D0000h
    push push 03B800000h
    call sub_1003096E
    mov mov ecx, dword ptr [g_101CE830]
    mov mov eax, dword ptr [ecx + 8]
    add add esp, 16
    inc inc esi
    cmp cmp esi, eax
    jl sub_10030A2F
    mov mov ecx, dword ptr [ebp + 8]
    mov mov eax, dword ptr [ecx]
    movzx movzx edx, word ptr [eax + 2]
    add add edx, eax
    mov mov dword ptr [ecx], edx
    pop pop esi
    mov mov esp, ebp
    pop pop ebp
    ret ret
FUN_100309a0 ENDP
END
