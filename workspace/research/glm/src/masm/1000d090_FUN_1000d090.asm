.686
.MODEL FLAT, C
EXTRN g_101D0A68:DWORD
EXTRN g_101D0A6C:DWORD
EXTRN g_101D0A70:DWORD
.CODE
FUN_1000d090 PROC
    movzx eax, al
    cmp eax, 5
    ja L3
    jmp dword ptr [eax*4 + 0x1000d0d4]
    mov eax, dword ptr [g_101D0A68]
    jmp L0
    mov eax, dword ptr [g_101D0A6C]
    jmp L0
    mov eax, dword ptr [g_101D0A70]
L0:
    test eax, eax
    mov byte ptr [ecx + 1], 2
    jge L1
    xor eax, eax
    mov byte ptr [ecx], al
    ret
L1:
    cmp eax, 3
    jle L2
    mov eax, 3
L2:
    mov byte ptr [ecx], al
    ret
L3:
    mov word ptr [ecx], 0
    ret
FUN_1000d090 ENDP
END
