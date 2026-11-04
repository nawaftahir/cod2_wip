.686
.MODEL FLAT, C
EXTRN sub_100243D0:PROC
EXTRN g_101CE654:DWORD
EXTRN g_101D1B9C:DWORD
.CODE
FUN_10024610 PROC
    mov ecx, dword ptr [g_101CE654]
    mov dword ptr [eax + 12], 5
    mov dl, byte ptr [ecx + 8]
    test dl, dl
    je L2
    push ebx
    push ebp
    mov ebp, dword ptr [eax + 4]
    mov ecx, dword ptr [ebp + 24]
    mov eax, dword ptr [ebp + 28]
    xor ebx, ebx
    test ecx, ecx
    jle L1
    push esi
    push edi
    lea edi, [eax + eax*2]
    shl edi, 2
    lea ecx, [ecx]
L0:
    mov edx, dword ptr [g_101D1B9C]
    mov eax, dword ptr [edx + 20]
    mov ecx, dword ptr [eax + edi + 8]
    movzx esi, word ptr [eax + edi + 4]
    add eax, edi
    mov eax, dword ptr [eax]
    push ecx
    mov ecx, dword ptr [esp + 24]
    call sub_100243D0
    mov eax, dword ptr [ebp + 24]
    add esp, 4
    inc ebx
    add edi, 12
    cmp ebx, eax
    jl L0
    pop edi
    pop esi
L1:
    pop ebp
    pop ebx
L2:
    ret
FUN_10024610 ENDP
END
