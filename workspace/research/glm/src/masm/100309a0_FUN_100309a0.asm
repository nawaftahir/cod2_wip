.686
.MODEL FLAT, C
EXTRN sub_1003095F:PROC
EXTRN sub_1003096E:PROC
EXTRN sub_1003A8EF:PROC
EXTRN g_101CE830:DWORD
EXTRN g_1072D9D0:DWORD
EXTRN g_1072D9E0:DWORD
.CODE
FUN_100309a0 PROC
    push ebp
    mov ebp, esp
    and esp, 0FFFFFFF8h
    push ecx
    mov eax, dword ptr [g_1072D9D0]
    test eax, eax
    push esi
    jne L0
    mov eax, dword ptr [g_1072D9E0]
    test eax, eax
    je L1
L0:
    call sub_1003A8EF
L1:
    mov eax, dword ptr [g_101CE830]
    mov ecx, dword ptr [eax + 8]
    xor esi, esi
    test ecx, ecx
    jle L3
    lea ecx, [ecx]
L2:
    push 03F7F0000h
    push 03C400000h
    call sub_1003095F
    push 03F7D0000h
    push 03B800000h
    call sub_1003096E
    mov ecx, dword ptr [g_101CE830]
    mov eax, dword ptr [ecx + 8]
    add esp, 16
    inc esi
    cmp esi, eax
    jl L2
L3:
    mov ecx, dword ptr [ebp + 8]
    mov eax, dword ptr [ecx]
    movzx edx, word ptr [eax + 2]
    add edx, eax
    mov dword ptr [ecx], edx
    pop esi
    mov esp, ebp
    pop ebp
    ret
FUN_100309a0 ENDP
END
