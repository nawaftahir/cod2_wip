.686
.MODEL FLAT, C
EXTRN sub_1007D8B9:PROC
EXTRN sub_100811E3:PROC
EXTRN sub_10081257:PROC
EXTRN sub_100F869D:PROC
EXTRN sub_100F86AC:PROC
EXTRN sub_100F8731:PROC
EXTRN sub_100F8761:PROC
.CODE
FUN_100811b0 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 24
    push ebx
    push edi
    mov edi, dword ptr [ebp + 8]
    test edi, edi
    mov ebx, ecx
    mov dword ptr [ebp - 12], ebx
    jge L0
    mov eax, dword ptr [ebp + 12]
    neg edi
    mov dword ptr [eax], edi
    xor eax, eax
    jmp L30
L0:
    movsx eax, byte ptr [edi]
    push eax
    mov dword ptr [ebp - 16], edi
    call sub_100F869D
    test eax, eax
    pop ecx
    je L2
L1:
    inc edi
    movsx eax, byte ptr [edi]
    push eax
    call sub_100F86AC
    test eax, eax
    pop ecx
    jne L1
    mov dword ptr [ebp - 16], edi
L2:
    movsx eax, byte ptr [edi]
    push eax
    call sub_100F8731
    test eax, eax
    pop ecx
    jne L3
    mov al, byte ptr [edi]
    cmp al, 95
    je L3
    cmp al, 36
    je L3
    mov eax, 08876086Ch
    jmp L30
L3:
    mov dword ptr [ebp - 4], 1
    push esi
L4:
    mov eax, dword ptr [ebp - 4]
    lea esi, [eax + edi]
    movsx eax, byte ptr [esi]
    push eax
    call sub_100F8761
    test eax, eax
    pop ecx
    jne L5
    cmp byte ptr [esi], 95
    jne L6
L5:
    inc dword ptr [ebp - 4]
    jmp L4
L6:
    mov eax, dword ptr [ebx + 16]
    mov edi, dword ptr [eax + 16]
    mov ecx, dword ptr [ebx + 8]
    mov eax, dword ptr [eax + 12]
    xor esi, esi
    and dword ptr [ebp - 8], esi
    add edi, ecx
    test eax, eax
    mov dword ptr [ebp + 8], eax
    jbe L11
L7:
    mov eax, dword ptr [ebp + 8]
    mov ecx, dword ptr [ebp - 8]
    push dword ptr [ebp - 4]
    lea esi, [eax + ecx]
    shr esi, 1
    lea eax, [esi + esi*4]
    mov ebx, dword ptr [edi + eax*4]
    mov eax, dword ptr [ebp - 12]
    add ebx, dword ptr [eax + 8]
    mov eax, dword ptr [ebp - 16]
    call sub_1007D8B9
    test eax, eax
    je L10
    jge L8
    lea eax, [esi + 1]
    mov dword ptr [ebp - 8], eax
    jmp L9
L8:
    mov dword ptr [ebp + 8], esi
L9:
    mov eax, dword ptr [ebp + 8]
    cmp dword ptr [ebp - 8], eax
    jb L7
L10:
    mov ebx, dword ptr [ebp - 12]
L11:
    mov eax, dword ptr [ebp + 8]
    cmp dword ptr [ebp - 8], eax
    jne L13
L12:
    mov eax, 08876086Ch
    jmp L29
L13:
    lea eax, [esi + esi*4]
    lea eax, [edi + eax*4]
    mov ecx, dword ptr [eax]
    add ecx, dword ptr [ebx + 8]
    test esi, esi
    mov dword ptr [ebp - 24], ecx
    je L20
    add eax, -20
    mov dword ptr [ebp - 20], eax
L14:
    mov eax, dword ptr [eax]
    add eax, dword ptr [ebx + 8]
    cmp ecx, eax
    je L19
    mov dword ptr [ebp - 12], eax
    mov dword ptr [ebp - 8], ecx
L15:
    mov eax, dword ptr [ebp - 8]
    mov al, byte ptr [eax]
    mov edx, dword ptr [ebp - 12]
    mov byte ptr [ebp + 11], al
    cmp al, byte ptr [edx]
    jne L17
    test al, al
    je L16
    mov eax, dword ptr [ebp - 8]
    mov al, byte ptr [eax + 1]
    mov byte ptr [ebp + 11], al
    cmp al, byte ptr [edx + 1]
    jne L17
    add dword ptr [ebp - 8], 2
    add dword ptr [ebp - 12], 2
    test al, al
    jne L15
L16:
    xor eax, eax
    jmp L18
L17:
    sbb eax, eax
    sbb eax, -1
L18:
    test eax, eax
    jne L20
L19:
    mov eax, dword ptr [ebp - 20]
    dec esi
    sub eax, 20
    test esi, esi
    mov dword ptr [ebp - 20], eax
    jne L14
L20:
    mov ecx, dword ptr [ebp - 16]
    mov eax, dword ptr [ebp - 4]
    add eax, ecx
    push 0
    mov dword ptr [ebp - 20], eax
    push eax
    mov eax, dword ptr [ebx + 20]
    mov ecx, dword ptr [eax + esi*4]
    call sub_100811E3
    test eax, eax
    je L12
    lea ecx, [esi + esi*4]
    lea edi, [edi + ecx*4]
    jmp L22
L21:
    mov edi, dword ptr [ebp + 8]
L22:
    mov ecx, dword ptr [ebp + 12]
    mov dword ptr [ecx], eax
    add eax, 36
    mov dword ptr [ebp + 12], eax
    mov eax, dword ptr [ebx + 16]
    inc esi
    add edi, 20
    cmp esi, dword ptr [eax + 12]
    mov dword ptr [ebp + 8], edi
    jae L28
    mov eax, dword ptr [edi]
    add eax, dword ptr [ebx + 8]
    mov edi, dword ptr [ebp - 24]
    cmp edi, eax
    je L27
L23:
    mov dl, byte ptr [edi]
    mov cl, dl
    cmp dl, byte ptr [eax]
    jne L25
    test cl, cl
    je L24
    mov dl, byte ptr [edi + 1]
    mov cl, dl
    cmp dl, byte ptr [eax + 1]
    jne L25
    inc edi
    inc edi
    inc eax
    inc eax
    test cl, cl
    jne L23
L24:
    xor eax, eax
    jmp L26
L25:
    sbb eax, eax
    sbb eax, -1
L26:
    test eax, eax
    jne L28
L27:
    mov eax, dword ptr [ebx + 20]
    mov ecx, dword ptr [eax + esi*4]
    push 0
    push dword ptr [ebp - 20]
    call sub_10081257
    test eax, eax
    jne L21
    jmp L12
L28:
    xor eax, eax
L29:
    pop esi
L30:
    pop edi
    pop ebx
    leave
    ret 8
FUN_100811b0 ENDP
END
