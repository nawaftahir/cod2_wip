.686
.MODEL FLAT, C
EXTRN sub_10082E53:PROC
EXTRN sub_10082E5B:PROC
EXTRN sub_10099B59:PROC
EXTRN sub_10099B9D:PROC
EXTRN sub_10099BBE:PROC
EXTRN sub_10099C00:PROC
EXTRN sub_10099F00:PROC
EXTRN sub_1009A1ED:PROC
EXTRN sub_1009A205:PROC
EXTRN sub_1009A255:PROC
EXTRN sub_1009A26D:PROC
.CODE
FUN_1009b666 PROC
L0:
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 76
    push ebx
    push esi
    mov esi, dword ptr [ebp + 8]
    xor eax, eax
    cmp dword ptr [ebp + 16], eax
    push edi
    mov dword ptr [ebp - 4], ecx
    je L4
    cmp esi, eax
    je L28
L1:
    cmp dword ptr [ebp + 12], eax
    jne L5
L2:
    xor eax, eax
L3:
    pop edi
    pop esi
    pop ebx
    leave
    ret 12
L4:
    cmp esi, eax
    jne L1
    cmp dword ptr [ebp + 12], eax
    jne L2
    jmp L28
L5:
    lea ecx, [ebp - 76]
    call sub_10082E53
    lea ecx, [ebp - 40]
    call sub_10082E5B
    cmp dword ptr [esi + 4], 9
    push 4
    pop ebx
    jne L6
    mov edi, esi
    jmp L7
L6:
    mov ecx, dword ptr [ebp - 4]
    push esi
    lea edi, [ebp - 76]
    mov dword ptr [ebp - 60], ebx
    mov dword ptr [ebp - 52], 1
    call sub_10099BBE
    cmp dword ptr [ebp + 16], 0
    mov dword ptr [ebp - 48], eax
    je L7
    mov ecx, dword ptr [ebp - 4]
    push esi
    call sub_10099B59
    test eax, eax
    je L7
    mov dword ptr [ebp - 60], 1
L7:
    mov eax, dword ptr [ebp + 12]
    cmp dword ptr [eax + 4], 9
    jne L8
    mov esi, eax
    jmp L9
L8:
    push dword ptr [ebp + 12]
    mov ecx, dword ptr [ebp - 4]
    lea esi, [ebp - 40]
    mov dword ptr [ebp - 24], ebx
    mov dword ptr [ebp - 16], 1
    call sub_10099C00
    cmp dword ptr [ebp + 16], 0
    mov dword ptr [ebp - 12], eax
    je L9
    push dword ptr [ebp + 12]
    mov ecx, dword ptr [ebp - 4]
    call sub_10099B9D
    test eax, eax
    je L9
    mov dword ptr [ebp - 24], 1
L9:
    mov ecx, dword ptr [edi + 16]
    cmp ecx, ebx
    je L24
    mov eax, dword ptr [esi + 16]
    cmp eax, ebx
    je L24
    test ecx, ecx
    jne L11
    cmp eax, 3
    je L2
    xor edx, edx
    inc edx
L10:
    mov eax, edx
    jmp L3
L11:
    xor edx, edx
    inc edx
    cmp ecx, edx
    jne L14
    test eax, eax
    je L10
    cmp eax, edx
    je L18
    cmp eax, 2
    jne L19
    mov eax, dword ptr [esi + 24]
    cmp eax, edx
    jne L12
    mov ecx, dword ptr [edi + 28]
    cmp ecx, dword ptr [esi + 28]
    ja L2
L12:
    mov esi, dword ptr [esi + 28]
    cmp esi, edx
    jne L13
    cmp dword ptr [edi + 28], eax
    ja L2
L13:
    cmp eax, edx
    je L10
    cmp esi, edx
    je L10
    imul eax, esi
    cmp eax, dword ptr [edi + 28]
    jmp L23
L14:
    cmp ecx, 2
    jne L20
    test eax, eax
    je L10
    cmp eax, edx
    jne L17
    mov eax, dword ptr [edi + 24]
    cmp eax, edx
    jne L15
    mov ecx, dword ptr [edi + 28]
    cmp ecx, dword ptr [esi + 28]
    ja L2
L15:
    mov edi, dword ptr [edi + 28]
    cmp edi, edx
    jne L16
    cmp eax, dword ptr [esi + 28]
    ja L2
L16:
    cmp eax, edx
    je L10
    cmp edi, edx
    je L10
    imul eax, edi
    cmp eax, dword ptr [esi + 28]
    jmp L23
L17:
    cmp eax, 2
    jne L19
    mov eax, dword ptr [edi + 24]
    cmp eax, dword ptr [esi + 24]
    ja L2
L18:
    mov eax, dword ptr [edi + 28]
    cmp eax, dword ptr [esi + 28]
    jbe L10
    jmp L2
L19:
    cmp eax, 3
    jne L10
    jmp L2
L20:
    cmp ecx, 3
    jne L10
    cmp eax, ecx
    jne L2
    mov esi, dword ptr [esi + 20]
    cmp esi, 13
    je L10
    cmp esi, 15
    jne L21
    mov edi, dword ptr [edi + 20]
    cmp edi, esi
    je L10
    cmp edi, 16
    je L10
    cmp edi, 17
    je L10
    cmp edi, 18
    je L10
    cmp edi, 19
    jmp L23
L21:
    cmp esi, 20
    jne L22
    mov edi, dword ptr [edi + 20]
    cmp edi, esi
    je L10
    cmp edi, 21
    je L10
    cmp edi, 22
    je L10
    cmp edi, 23
    je L10
    cmp edi, 24
    jmp L23
L22:
    cmp dword ptr [edi + 20], esi
L23:
    je L10
    jmp L2
L24:
    mov ebx, dword ptr [edi + 28]
    mov eax, dword ptr [esi + 28]
    imul ebx, dword ptr [edi + 24]
    imul eax, dword ptr [esi + 24]
    cmp dword ptr [ebp + 16], 0
    je L26
    cmp ebx, eax
    ja L2
    xor esi, esi
    test ebx, ebx
    jbe L28
L25:
    mov ecx, dword ptr [ebp - 4]
    lea eax, [ebp - 76]
    push eax
    push esi
    push dword ptr [ebp + 8]
    call sub_1009A1ED
    test eax, eax
    jl L2
    mov ecx, dword ptr [ebp - 4]
    lea eax, [ebp - 40]
    push eax
    push esi
    push dword ptr [ebp + 12]
    call sub_1009A205
    test eax, eax
    jl L2
    mov ecx, dword ptr [ebp - 4]
    push 1
    lea eax, [ebp - 40]
    push eax
    lea eax, [ebp - 76]
    push eax
    call L0
    test eax, eax
    je L2
    inc esi
    cmp esi, ebx
    jb L25
    jmp L28
L26:
    cmp ecx, dword ptr [esi + 16]
    jne L2
    cmp ebx, eax
    jne L2
    xor esi, esi
    test ebx, ebx
    jbe L28
L27:
    mov ecx, dword ptr [ebp - 4]
    lea eax, [ebp - 76]
    push eax
    push esi
    push dword ptr [ebp + 8]
    call sub_1009A255
    test eax, eax
    jl L2
    mov ecx, dword ptr [ebp - 4]
    lea eax, [ebp - 40]
    push eax
    push esi
    push dword ptr [ebp + 12]
    call sub_1009A26D
    test eax, eax
    jl L2
    mov ecx, dword ptr [ebp - 4]
    lea eax, [ebp - 40]
    push eax
    lea eax, [ebp - 76]
    push eax
    call sub_10099F00
    test eax, eax
    je L2
    inc esi
    cmp esi, ebx
    jb L27
L28:
    xor eax, eax
    inc eax
    jmp L3
FUN_1009b666 ENDP
END
