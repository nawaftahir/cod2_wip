.686
.MODEL FLAT, C
EXTRN sub_10082E47:PROC
EXTRN sub_10082E4F:PROC
EXTRN sub_1009962B:PROC
EXTRN sub_10099804:PROC
EXTRN sub_10099B46:PROC
EXTRN sub_10099B7C:PROC
EXTRN sub_10099BAF:PROC
EXTRN sub_10099BE5:PROC
EXTRN sub_10099D9F:PROC
EXTRN sub_10099DB1:PROC
EXTRN sub_1009A22A:PROC
EXTRN sub_1009A242:PROC
EXTRN sub_1009B960:PROC
.CODE
FUN_1009b99e PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 00000024Ch
    cmp dword ptr [ebp + 24], 0
    push ebx
    push esi
    push edi
    mov dword ptr [ebp - 4], ecx
    jne L19
    mov esi, dword ptr [ebp + 16]
    test esi, esi
    je L19
    cmp dword ptr [ebp + 20], 0
    je L3
    lea ecx, [ebp - 40]
    call sub_10082E47
    lea ecx, [ebp - 76]
    call sub_10082E4F
    cmp dword ptr [esi + 4], 9
    push 4
    pop ebx
    je L0
    push dword ptr [ebp + 16]
    mov ecx, dword ptr [ebp - 4]
    xor edi, edi
    inc edi
    lea esi, [ebp - 40]
    mov dword ptr [ebp - 24], ebx
    mov dword ptr [ebp - 16], edi
    call sub_10099BAF
    push dword ptr [ebp + 16]
    mov ecx, dword ptr [ebp - 4]
    mov dword ptr [ebp - 12], eax
    call sub_10099B46
    test eax, eax
    je L0
    mov dword ptr [ebp - 24], edi
L0:
    mov edi, dword ptr [ebp + 20]
    cmp dword ptr [edi + 4], 9
    je L1
    push dword ptr [ebp + 20]
    mov ecx, dword ptr [ebp - 4]
    lea edi, [ebp - 76]
    mov dword ptr [ebp - 60], ebx
    mov dword ptr [ebp - 52], 1
    call sub_10099BE5
    push dword ptr [ebp + 20]
    mov ecx, dword ptr [ebp - 4]
    mov dword ptr [ebp - 48], eax
    call sub_10099B7C
    test eax, eax
    je L1
    xor edx, edx
    inc edx
    mov dword ptr [ebp - 60], edx
    jmp L2
L1:
    xor edx, edx
    inc edx
L2:
    mov ecx, dword ptr [esi + 16]
    cmp ecx, ebx
    je L17
    mov eax, dword ptr [edi + 16]
    cmp eax, ebx
    je L17
    test ecx, ecx
    je L12
    cmp ecx, edx
    jne L8
    test eax, eax
    je L19
    cmp eax, edx
    jne L5
    mov eax, dword ptr [esi + 28]
    cmp eax, dword ptr [edi + 28]
    jbe L19
L3:
    mov edi, 010114ADCh
L4:
    push dword ptr [ebp + 16]
    mov ebx, dword ptr [ebp - 4]
    mov esi, 0000000FFh
    push esi
    lea eax, [ebp - 00000014Ch]
    push eax
    mov ecx, ebx
    call sub_10099D9F
    push dword ptr [ebp + 20]
    lea eax, [ebp - 00000024Ch]
    push esi
    push eax
    mov ecx, ebx
    call sub_10099DB1
    cmp dword ptr [ebp + 12], 0
    lea eax, [ebp - 00000014Ch]
    push eax
    lea eax, [ebp - 00000024Ch]
    push eax
    push edi
    jne L20
    push 010114AB8h
    push 000000BC9h
    push dword ptr [ebp + 8]
    push ebx
    call sub_1009962B
    add esp, 28
    jmp L21
L5:
    cmp eax, 2
    jne L12
    mov eax, dword ptr [edi + 24]
    cmp eax, edx
    jne L6
    mov ecx, dword ptr [esi + 28]
    cmp ecx, dword ptr [edi + 28]
    ja L3
L6:
    mov edi, dword ptr [edi + 28]
    cmp edi, edx
    jne L7
    cmp dword ptr [esi + 28], eax
    ja L3
L7:
    cmp eax, edx
    je L19
    cmp edi, edx
    je L19
    imul eax, edi
    cmp eax, dword ptr [esi + 28]
    jmp L15
L8:
    cmp ecx, 2
    jne L13
    test eax, eax
    je L19
    cmp eax, edx
    jne L11
    mov eax, dword ptr [esi + 24]
    cmp eax, edx
    jne L9
    mov ecx, dword ptr [esi + 28]
    cmp ecx, dword ptr [edi + 28]
    ja L3
L9:
    mov esi, dword ptr [esi + 28]
    cmp esi, edx
    jne L10
    cmp eax, dword ptr [edi + 28]
    ja L3
L10:
    cmp eax, edx
    je L19
    cmp esi, edx
    je L19
    imul eax, esi
    cmp eax, dword ptr [edi + 28]
    jmp L15
L11:
    cmp eax, 2
    jne L12
    mov eax, dword ptr [esi + 24]
    cmp eax, dword ptr [edi + 24]
    ja L3
    mov eax, dword ptr [esi + 28]
    cmp eax, dword ptr [edi + 28]
    jbe L19
    jmp L3
L12:
    cmp eax, 3
    je L3
    jmp L19
L13:
    cmp ecx, 3
    jne L19
    cmp eax, ecx
    jne L3
    mov edi, dword ptr [edi + 20]
    cmp edi, 13
    je L19
    cmp edi, 15
    jne L14
    mov esi, dword ptr [esi + 20]
    cmp esi, edi
    je L19
    cmp esi, 16
    je L19
    cmp esi, 17
    je L19
    cmp esi, 18
    je L19
    cmp esi, 19
    jmp L15
L14:
    cmp edi, 20
    jne L16
    mov esi, dword ptr [esi + 20]
    cmp esi, edi
    je L19
    cmp esi, 21
    je L19
    cmp esi, 22
    je L19
    cmp esi, 23
    je L19
    cmp esi, 24
L15:
    jne L3
    jmp L19
L16:
    cmp dword ptr [esi + 20], edi
    jmp L15
L17:
    mov ebx, dword ptr [esi + 28]
    mov eax, dword ptr [edi + 28]
    imul ebx, dword ptr [esi + 24]
    imul eax, dword ptr [edi + 24]
    cmp ebx, eax
    ja L3
    xor esi, esi
    test ebx, ebx
    jbe L19
L18:
    mov ecx, dword ptr [ebp - 4]
    lea eax, [ebp - 40]
    push eax
    push esi
    push dword ptr [ebp + 16]
    call sub_1009A22A
    test eax, eax
    jl L3
    mov ecx, dword ptr [ebp - 4]
    lea eax, [ebp - 76]
    push eax
    push esi
    push dword ptr [ebp + 20]
    call sub_1009A242
    test eax, eax
    jl L3
    mov ecx, dword ptr [ebp - 4]
    push 1
    lea eax, [ebp - 76]
    push eax
    lea eax, [ebp - 40]
    push eax
    call sub_1009B960
    test eax, eax
    je L3
    inc esi
    cmp esi, ebx
    jb L18
L19:
    mov edi, 01019166Eh
    jmp L4
L20:
    push dword ptr [ebp + 12]
    push 010114A8Ch
    push 000000BC9h
    push dword ptr [ebp + 8]
    push ebx
    call sub_10099804
    add esp, 32
L21:
    pop edi
    pop esi
    pop ebx
    leave
    ret 20
FUN_1009b99e ENDP
END
