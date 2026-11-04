.686
.MODEL FLAT, C
EXTRN sub_1000D0D4:PROC
EXTRN sub_1000D0E9:PROC
EXTRN sub_1000D0FD:PROC
EXTRN EXTRN g_101D0A68:DWORD:DWORD
EXTRN EXTRN g_101D0A6C:DWORD:DWORD
EXTRN EXTRN g_101D0A70:DWORD:DWORD
.CODE
FUN_1000d090 PROC
    movzx movzx eax, al
    cmp cmp eax, 5
    ja sub_1000D0D4
    jmp jmp dword ptr [eax*4 + 01000D0D4h]
    mov mov eax, dword ptr [g_101D0A68]
    jmp L0
    mov mov eax, dword ptr [g_101D0A6C]
    jmp L1
    mov mov eax, dword ptr [g_101D0A70]
    test test eax, eax
    mov mov byte ptr [ecx + 1], 2
    jge sub_1000D0E9
    xor xor eax, eax
    mov mov byte ptr [ecx], al
    ret ret
    cmp cmp eax, 3
    jle sub_1000D0FD
    mov mov eax, 3
    mov mov byte ptr [ecx], al
    ret ret
    mov mov word ptr [ecx], 0
    ret ret
FUN_1000d090 ENDP
END
