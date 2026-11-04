.686
.MODEL FLAT, C
EXTRN sub_10035FE5:PROC
EXTRN sub_10036158:PROC
EXTRN sub_100363FA:PROC
EXTRN EXTRN g_101CE758:DWORD:DWORD
EXTRN EXTRN g_101D1B9C:DWORD:DWORD
.CODE
FUN_10036320 PROC
    push push ecx
    mov mov eax, dword ptr [g_101D1B9C]
    test test eax, eax
    je L0
    mov mov eax, dword ptr [g_101CE758]
    mov mov cl, byte ptr [eax + 8]
    test test cl, cl
    jne L1
    cmp cmp dword ptr [esi], 0
    jne L2
    xor xor al, al
    pop pop ecx
    ret ret
    mov mov eax, dword ptr [esp + 8]
    push push edi
    lea lea ecx, [esp + 4]
    push push ecx
    push push edx
    mov mov edx, dword ptr [esp + 24]
    mov mov ecx, esi
    call sub_10035FE5
    mov mov eax, dword ptr [esi + 4]
    mov mov edi, dword ptr [esp + 12]
    movzx movzx eax, word ptr [eax + edi*8 + 6]
    mov mov edx, dword ptr [esi + 12]
    lea lea ecx, [eax + eax*2]
    mov mov eax, dword ptr [esp + 28]
    push push 03F800000h
    lea lea ecx, [edx + ecx*8]
    call sub_10036158
    mov mov ecx, dword ptr [esi + 4]
    mov mov dl, byte ptr [ecx + edi*8 + 4]
    add add esp, 12
    mov mov al, 1
    test test al, dl
    pop pop edi
    je sub_100363FA
    mov mov dword ptr [ebx], 03F800000h
    pop pop ecx
    ret ret
    mov mov dword ptr [ebx], 0
    pop pop ecx
    ret ret
FUN_10036320 ENDP
END
