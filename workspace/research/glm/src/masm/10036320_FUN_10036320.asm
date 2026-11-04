.686
.MODEL FLAT, C
EXTRN sub_10035FE5:PROC
EXTRN sub_10036158:PROC
EXTRN g_101CE758:DWORD
EXTRN g_101D1B9C:DWORD
.CODE
FUN_10036320 PROC
    push ecx
    mov eax, dword ptr [g_101D1B9C]
    test eax, eax
    je L0
    mov eax, dword ptr [g_101CE758]
    mov cl, byte ptr [eax + 8]
    test cl, cl
    jne L1
L0:
    cmp dword ptr [esi], 0
    jne L2
L1:
    xor al, al
    pop ecx
    ret
L2:
    mov eax, dword ptr [esp + 8]
    push edi
    lea ecx, [esp + 4]
    push ecx
    push edx
    mov edx, dword ptr [esp + 24]
    mov ecx, esi
    call sub_10035FE5
    mov eax, dword ptr [esi + 4]
    mov edi, dword ptr [esp + 12]
    movzx eax, word ptr [eax + edi*8 + 6]
    mov edx, dword ptr [esi + 12]
    lea ecx, [eax + eax*2]
    mov eax, dword ptr [esp + 28]
    push 03F800000h
    lea ecx, [edx + ecx*8]
    call sub_10036158
    mov ecx, dword ptr [esi + 4]
    mov dl, byte ptr [ecx + edi*8 + 4]
    add esp, 12
    mov al, 1
    test al, dl
    pop edi
    je L3
    mov dword ptr [ebx], 03F800000h
    pop ecx
    ret
L3:
    mov dword ptr [ebx], 0
    pop ecx
    ret
FUN_10036320 ENDP
END
