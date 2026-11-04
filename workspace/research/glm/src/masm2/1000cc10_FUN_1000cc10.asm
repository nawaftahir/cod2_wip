.686
.MODEL FLAT, C
EXTRN sub_1000CB9F:PROC
EXTRN EXTRN fp_101D49D4:DWORD:DWORD
.CODE
FUN_1000cc10 PROC
    push push ebx
    push push ebp
    mov mov ebp, dword ptr [esp + 12]
    push push esi
    mov mov eax, ebp
    push push edi
    lea lea ecx, [eax + 1]
    lea lea ecx, [ecx]
    mov mov dl, byte ptr [eax]
    inc inc eax
    test test dl, dl
    jne L0
    sub sub eax, ecx
    lea lea esi, [eax + 1]
    lea lea eax, [esi + 36]
    push push eax
    call dword ptr [fp_101D49D4]
    mov mov ebx, eax
    mov mov al, byte ptr [esp + 28]
    mov mov ecx, esi
    mov mov edx, ecx
    shr shr ecx, 2
    lea lea edi, [ebx + 36]
    mov mov dword ptr [ebx + 32], edi
    mov mov esi, ebp
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, edx
    mov mov dl, byte ptr [esp + 36]
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov cl, byte ptr [esp + 32]
    add add esp, 4
    mov mov esi, ebp
    mov mov byte ptr [ebx + 30], al
    mov mov byte ptr [ebx + 10], cl
    mov mov byte ptr [ebx + 12], dl
    call sub_1000CB9F
    pop pop edi
    pop pop esi
    mov mov dword ptr [eax*4 + 0101CEA68h], ebx
    pop pop ebp
    mov mov eax, ebx
    pop pop ebx
    ret ret
FUN_1000cc10 ENDP
END
