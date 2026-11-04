.686
.MODEL FLAT, C
EXTRN sub_1007D8B9:PROC
EXTRN sub_100813D5:PROC
EXTRN sub_1008141A:PROC
EXTRN sub_1008141D:PROC
EXTRN sub_10081423:PROC
EXTRN sub_10081424:PROC
EXTRN sub_10081428:PROC
EXTRN sub_10081429:PROC
EXTRN sub_10081430:PROC
EXTRN sub_10081442:PROC
EXTRN sub_10081457:PROC
EXTRN sub_10081472:PROC
EXTRN sub_1008149D:PROC
EXTRN sub_100814A9:PROC
EXTRN sub_100814D5:PROC
EXTRN sub_1008153A:PROC
EXTRN sub_10081542:PROC
EXTRN sub_1008154E:PROC
EXTRN sub_1008154F:PROC
EXTRN sub_1008155C:PROC
EXTRN sub_1008156D:PROC
EXTRN sub_10081593:PROC
EXTRN sub_100F869D:PROC
EXTRN sub_100F86AC:PROC
EXTRN sub_100F8731:PROC
EXTRN sub_100F8761:PROC
.CODE
FUN_100811b0 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 24
    push push ebx
    push push edi
    mov mov edi, dword ptr [ebp + 8]
    test test edi, edi
    mov mov ebx, ecx
    mov mov dword ptr [ebp - 12], ebx
    jge L1
    mov mov eax, dword ptr [ebp + 12]
    neg neg edi
    mov mov dword ptr [eax], edi
    xor xor eax, eax
    jmp sub_100813D5
    movsx movsx eax, byte ptr [edi]
    push push eax
    mov mov dword ptr [ebp - 16], edi
    call sub_100F869D
    test test eax, eax
    pop pop ecx
L0:
    je L3
    inc inc edi
    movsx movsx eax, byte ptr [edi]
    push push eax
L1:
    call sub_100F86AC
    test test eax, eax
    pop pop ecx
    jne L2
    mov mov dword ptr [ebp - 16], edi
    movsx movsx eax, byte ptr [edi]
    push push eax
    call sub_100F8731
    test test eax, eax
    pop pop ecx
    jne L5
    mov mov al, byte ptr [edi]
    cmp cmp al, 95
    je L6
    cmp cmp al, 36
    je L7
    mov mov eax, 08876086Ch
    jmp sub_1008141A
    mov mov dword ptr [ebp - 4], 1
    push push esi
    mov mov eax, dword ptr [ebp - 4]
    lea lea esi, [eax + edi]
    movsx movsx eax, byte ptr [esi]
    push push eax
    call sub_100F8761
    test test eax, eax
    pop pop ecx
    jne L9
    cmp cmp byte ptr [esi], 95
    jne L10
    inc inc dword ptr [ebp - 4]
    jmp L8
    mov mov eax, dword ptr [ebx + 16]
    mov mov edi, dword ptr [eax + 16]
    mov mov ecx, dword ptr [ebx + 8]
    mov mov eax, dword ptr [eax + 12]
    xor xor esi, esi
    and and dword ptr [ebp - 8], esi
    add add edi, ecx
    test test eax, eax
    mov mov dword ptr [ebp + 8], eax
L4:
    jbe L12
    mov mov eax, dword ptr [ebp + 8]
    mov mov ecx, dword ptr [ebp - 8]
    push push dword ptr [ebp - 4]
    lea lea esi, [eax + ecx]
    shr shr esi, 1
    lea lea eax, [esi + esi*4]
    mov mov ebx, dword ptr [edi + eax*4]
    mov mov eax, dword ptr [ebp - 12]
    add add ebx, dword ptr [eax + 8]
    mov mov eax, dword ptr [ebp - 16]
    call sub_1007D8B9
    test test eax, eax
    je L14
    jge L13
    lea lea eax, [esi + 1]
    mov mov dword ptr [ebp - 8], eax
    jmp L15
    mov mov dword ptr [ebp + 8], esi
    mov mov eax, dword ptr [ebp + 8]
    cmp cmp dword ptr [ebp - 8], eax
    jb L11
    mov mov ebx, dword ptr [ebp - 12]
    mov mov eax, dword ptr [ebp + 8]
    cmp cmp dword ptr [ebp - 8], eax
    jne L16
    mov mov eax, 08876086Ch
    jmp sub_100814A9
    lea lea eax, [esi + esi*4]
    lea lea eax, [edi + eax*4]
    mov mov ecx, dword ptr [eax]
    add add ecx, dword ptr [ebx + 8]
    test test esi, esi
    mov mov dword ptr [ebp - 24], ecx
    je sub_10081423
    add add eax, -20
    mov mov dword ptr [ebp - 20], eax
    mov mov eax, dword ptr [eax]
    add add eax, dword ptr [ebx + 8]
    cmp cmp ecx, eax
    je sub_10081424
    mov mov dword ptr [ebp - 12], eax
    mov mov dword ptr [ebp - 8], ecx
    mov mov eax, dword ptr [ebp - 8]
    mov mov al, byte ptr [eax]
    mov mov edx, dword ptr [ebp - 12]
    mov mov byte ptr [ebp + 11], al
    cmp cmp al, byte ptr [edx]
    jne sub_10081430
    test test al, al
    je sub_10081430
    mov mov eax, dword ptr [ebp - 8]
    mov mov al, byte ptr [eax + 1]
    mov mov byte ptr [ebp + 11], al
    cmp cmp al, byte ptr [edx + 1]
    jne sub_10081442
    add add dword ptr [ebp - 8], 2
    add add dword ptr [ebp - 12], 2
    test test al, al
    jne sub_1008141D
    xor xor eax, eax
    jmp sub_10081457
    sbb sbb eax, eax
    sbb sbb eax, -1
    test test eax, eax
    jne sub_10081472
    mov mov eax, dword ptr [ebp - 20]
    dec dec esi
    sub sub eax, 20
    test test esi, esi
    mov mov dword ptr [ebp - 20], eax
    jne sub_10081429
    mov mov ecx, dword ptr [ebp - 16]
    mov mov eax, dword ptr [ebp - 4]
    add add eax, ecx
    push push 0
    mov mov dword ptr [ebp - 20], eax
    push push eax
    mov mov eax, dword ptr [ebx + 20]
    mov mov ecx, dword ptr [eax + esi*4]
    call L0
    test test eax, eax
    je sub_10081428
    lea lea ecx, [esi + esi*4]
    lea lea edi, [edi + ecx*4]
    jmp sub_100814D5
    mov mov edi, dword ptr [ebp + 8]
    mov mov ecx, dword ptr [ebp + 12]
    mov mov dword ptr [ecx], eax
    add add eax, 36
    mov mov dword ptr [ebp + 12], eax
    mov mov eax, dword ptr [ebx + 16]
    inc inc esi
    add add edi, 20
    cmp cmp esi, dword ptr [eax + 12]
    mov mov dword ptr [ebp + 8], edi
    jae sub_1008155C
    mov mov eax, dword ptr [edi]
    add add eax, dword ptr [ebx + 8]
L14:
    mov mov edi, dword ptr [ebp - 24]
    cmp cmp edi, eax
    je sub_1008154F
    mov mov dl, byte ptr [edi]
    mov mov cl, dl
    cmp cmp dl, byte ptr [eax]
    jne sub_1008154E
    test test cl, cl
    je sub_1008154E
    mov mov dl, byte ptr [edi + 1]
    mov mov cl, dl
    cmp cmp dl, byte ptr [eax + 1]
    jne sub_1008155C
    inc inc edi
    inc inc edi
    inc inc eax
    inc inc eax
    test test cl, cl
    jne sub_10081542
    xor xor eax, eax
    jmp sub_1008156D
    sbb sbb eax, eax
    sbb sbb eax, -1
    test test eax, eax
    jne sub_10081593
    mov mov eax, dword ptr [ebx + 20]
L16:
    mov mov ecx, dword ptr [eax + esi*4]
    push push 0
    push push dword ptr [ebp - 20]
    call L4
    test test eax, eax
    jne sub_1008153A
    jmp sub_1008149D
    xor xor eax, eax
    pop pop esi
    pop pop edi
    pop pop ebx
    leave leave
    ret ret 8
FUN_100811b0 ENDP
END
