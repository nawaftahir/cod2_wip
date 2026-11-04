.686
.MODEL FLAT, C
EXTRN sub_10012040:PROC
EXTRN sub_10025EBD:PROC
EXTRN sub_10026735:PROC
EXTRN fp_101D49DC:DWORD
EXTRN g_101CE668:DWORD
EXTRN g_101D4928:DWORD
EXTRN g_101D492A:DWORD
EXTRN g_101D4C94:DWORD
.CODE
FUN_100268b0 PROC
    push ebx
    movzx ebx, word ptr [g_101D4928]
    imul ebx, ebx
    push edi
    shl ebx, 2
    push ebx
    call dword ptr [fp_101D49DC]
    movzx edx, word ptr [g_101D4928]
    mov edi, eax
    mov eax, dword ptr [esp + 16]
    push edi
    mov dword ptr [eax*4 + 010696BB0h], edi
    movzx eax, word ptr [g_101D492A]
    push 4
    push edx
    push edx
    mov ecx, eax
    call sub_10025EBD
    add esp, 20
    call sub_10026735
    mov ecx, dword ptr [g_101CE668]
    mov eax, dword ptr [ecx + 8]
    test eax, eax
    jle L0
    mov al, byte ptr [g_101D4C94]
    test al, al
    je L0
    call sub_10012040
L0:
    pop edi
    pop ebx
    ret
FUN_100268b0 ENDP
END
