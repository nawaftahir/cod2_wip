.686
.MODEL FLAT, C
EXTRN sub_100F5EFA:PROC
EXTRN sub_100F7C2F:PROC
EXTRN sub_100F7D4E:PROC
EXTRN sub_100FA263:PROC
EXTRN sub_100FA2F1:PROC
EXTRN sub_100FCF12:PROC
EXTRN sub_100FCF2A:PROC
EXTRN sub_100FE9DB:PROC
EXTRN sub_1010041D:PROC
EXTRN sub_1010042E:PROC
EXTRN sub_10100C20:PROC
EXTRN sub_10100EA7:PROC
EXTRN g_101A4732:DWORD
EXTRN g_101A50D0:DWORD
EXTRN g_101ADD9C:DWORD
EXTRN g_101ADDA0:DWORD
.CODE
__expandlocale PROC
    push ebp
    mov ebp, esp
    sub esp, 000000094h
    mov eax, dword ptr [g_101A50D0]
    push esi
    mov esi, dword ptr [ebp + 8]
    xor edx, edx
    cmp esi, edx
    mov dword ptr [ebp - 4], eax
    jne L0
    xor eax, eax
    jmp L12
L0:
    cmp byte ptr [esi], 67
    jne L2
    cmp byte ptr [esi + 1], 0
    jne L2
    mov eax, dword ptr [ebp + 12]
    mov ecx, dword ptr [ebp + 16]
    cmp ecx, edx
    mov byte ptr [eax], 67
    mov byte ptr [eax + 1], 0
    je L1
    mov word ptr [ecx], dx
    mov word ptr [ecx + 2], dx
    mov word ptr [ecx + 4], dx
L1:
    mov ecx, dword ptr [ebp + 20]
    cmp ecx, edx
    je L12
    mov dword ptr [ecx], edx
    jmp L12
L2:
    push ebx
    push edi
    push esi
    call sub_100FA263
    mov edi, 000000082h
    cmp eax, edi
    pop ecx
    mov ebx, 0101A46B0h
    jae L3
    push esi
    push 0101A4738h
    call sub_1010041D
    test eax, eax
    pop ecx
    pop ecx
    je L8
    push esi
    push ebx
    call sub_1010042E
    test eax, eax
    pop ecx
    pop ecx
    je L8
L3:
    lea eax, [ebp - 000000094h]
    push esi
    push eax
    call sub_100F7C2F
    test eax, eax
    pop ecx
    pop ecx
    jne L4
    lea eax, [ebp - 000000094h]
    push eax
    push 0101ADD98h
    push eax
    call sub_10100C20
    add esp, 12
    test eax, eax
    jne L5
L4:
    xor eax, eax
    jmp L11
L5:
    movzx eax, word ptr [g_101ADD9C]
    mov dword ptr [g_101ADDA0], eax
    lea eax, [ebp - 000000094h]
    push eax
    push 0101A4738h
    call sub_100F7D4E
    cmp byte ptr [esi], 0
    pop ecx
    pop ecx
    je L6
    push esi
    call sub_100FA2F1
    cmp eax, edi
    pop ecx
    jb L7
L6:
    mov esi, 01019166Eh
L7:
    push edi
    push esi
    push ebx
    mov byte ptr [g_101A4732], 0
    call sub_100F5EFA
    add esp, 12
L8:
    cmp dword ptr [ebp + 16], 0
    je L9
    push 6
    push 0101ADD98h
    push dword ptr [ebp + 16]
    call sub_100FCF12
    add esp, 12
L9:
    cmp dword ptr [ebp + 20], 0
    je L10
    push 4
    push 0101ADDA0h
    push dword ptr [ebp + 20]
    call sub_100FCF2A
    add esp, 12
L10:
    mov esi, 0101A4738h
    push esi
    push dword ptr [ebp + 12]
    call sub_100FE9DB
    pop ecx
    pop ecx
    mov eax, esi
L11:
    pop edi
    pop ebx
L12:
    mov ecx, dword ptr [ebp - 4]
    pop esi
    call sub_10100EA7
    leave
    ret
__expandlocale ENDP
END
