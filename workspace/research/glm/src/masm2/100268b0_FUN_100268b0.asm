.686
.MODEL FLAT, C
EXTRN sub_10012040:PROC
EXTRN sub_10025EBD:PROC
EXTRN sub_10026735:PROC
EXTRN sub_10026962:PROC
EXTRN sub_1002696B:PROC
EXTRN EXTRN fp_101D49DC:DWORD:DWORD
EXTRN EXTRN g_101CE668:DWORD:DWORD
EXTRN EXTRN g_101D4928:DWORD:DWORD
EXTRN EXTRN g_101D492A:DWORD:DWORD
EXTRN EXTRN g_101D4C94:DWORD:DWORD
.CODE
FUN_100268b0 PROC
    push push ebx
    movzx movzx ebx, word ptr [g_101D4928]
    imul imul ebx, ebx
    push push edi
    shl shl ebx, 2
    push push ebx
    call dword ptr [fp_101D49DC]
    movzx movzx edx, word ptr [g_101D4928]
    mov mov edi, eax
    mov mov eax, dword ptr [esp + 16]
    push push edi
    mov mov dword ptr [eax*4 + 010696BB0h], edi
    movzx movzx eax, word ptr [g_101D492A]
    push push 4
    push push edx
    push push edx
    mov mov ecx, eax
    call sub_10025EBD
    add add esp, 20
    call sub_10026735
    mov mov ecx, dword ptr [g_101CE668]
    mov mov eax, dword ptr [ecx + 8]
    test test eax, eax
    jle sub_10026962
    mov mov al, byte ptr [g_101D4C94]
    test test al, al
    je sub_1002696B
    call sub_10012040
    pop pop edi
    pop pop ebx
    ret ret
FUN_100268b0 ENDP
END
