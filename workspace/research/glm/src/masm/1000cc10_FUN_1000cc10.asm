.686
.MODEL FLAT, C
EXTRN sub_1000CB9F:PROC
EXTRN fp_101D49D4:DWORD
.CODE
FUN_1000cc10 PROC
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 12]
    push esi
    mov eax, ebp
    push edi
    lea ecx, [eax + 1]
    lea ecx, [ecx]
L0:
    mov dl, byte ptr [eax]
    inc eax
    test dl, dl
    jne L0
    sub eax, ecx
    lea esi, [eax + 1]
    lea eax, [esi + 36]
    push eax
    call dword ptr [fp_101D49D4]
    mov ebx, eax
    mov al, byte ptr [esp + 28]
    mov ecx, esi
    mov edx, ecx
    shr ecx, 2
    lea edi, [ebx + 36]
    mov dword ptr [ebx + 32], edi
    mov esi, ebp
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, edx
    mov dl, byte ptr [esp + 36]
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov cl, byte ptr [esp + 32]
    add esp, 4
    mov esi, ebp
    mov byte ptr [ebx + 30], al
    mov byte ptr [ebx + 10], cl
    mov byte ptr [ebx + 12], dl
    call sub_1000CB9F
    pop edi
    pop esi
    mov dword ptr [eax*4 + 0101CEA68h], ebx
    pop ebp
    mov eax, ebx
    pop ebx
    ret
FUN_1000cc10 ENDP
END
