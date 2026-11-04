.686
.MODEL FLAT, C
EXTRN sub_100650BD:PROC
EXTRN sub_1008275E:PROC
EXTRN sub_10082AD6:PROC
EXTRN sub_100F792F:PROC
.CODE
FUN_1009a9f3 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ebx
    push esi
    push edi
    mov edi, dword ptr [ebp + 8]
    test edi, edi
    mov dword ptr [ebp - 4], ecx
    je L4
    cmp dword ptr [edi + 4], 3
    jne L4
    lea ebx, [edi + 16]
    cmp dword ptr [ebx], 10
    jne L4
    mov esi, dword ptr [ebp + 12]
    test esi, esi
    je L4
    cmp dword ptr [esi + 4], 3
    jne L4
    cmp dword ptr [esi + 16], 10
    jne L4
    push 48
    call sub_100650BD
    test eax, eax
    je L0
    push ebx
    mov ecx, eax
    call sub_10082AD6
    mov dword ptr [ebp + 8], eax
    jmp L1
L0:
    and dword ptr [ebp + 8], 0
L1:
    cmp dword ptr [ebp + 8], 0
    je L4
    mov eax, dword ptr [edi + 24]
    mov ebx, dword ptr [esi + 24]
    mov dword ptr [ebp + 12], eax
    lea ecx, [eax + 1]
L2:
    mov dl, byte ptr [eax]
    inc eax
    test dl, dl
    jne L2
    sub eax, ecx
    mov ecx, eax
    mov eax, ebx
    lea esi, [eax + 1]
L3:
    mov dl, byte ptr [eax]
    inc eax
    test dl, dl
    jne L3
    sub eax, esi
    lea edi, [eax + ecx + 1]
    mov eax, dword ptr [ebp - 4]
    mov ecx, dword ptr [eax + 4]
    push 1
    push edi
    call sub_1008275E
    mov esi, eax
    test esi, esi
    je L4
    push ebx
    push dword ptr [ebp + 12]
    push 010194930h
    push edi
    push esi
    call sub_100F792F
    mov eax, dword ptr [ebp + 8]
    mov byte ptr [esi + edi - 1], 0
    add esp, 20
    mov dword ptr [eax + 24], esi
    jmp L5
L4:
    xor eax, eax
L5:
    pop edi
    pop esi
    pop ebx
    leave
    ret 8
FUN_1009a9f3 ENDP
END
