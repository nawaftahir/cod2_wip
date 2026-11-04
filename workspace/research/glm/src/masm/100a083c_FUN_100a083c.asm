.686
.MODEL FLAT, C
EXTRN sub_100650A5:PROC
EXTRN sub_100650CC:PROC
EXTRN sub_10065127:PROC
EXTRN sub_100828B5:PROC
EXTRN sub_100828BB:PROC
EXTRN sub_10082937:PROC
EXTRN sub_10082CB8:PROC
EXTRN sub_10082E5F:PROC
EXTRN sub_10099686:PROC
EXTRN sub_1009ACD9:PROC
EXTRN sub_100A08D0:PROC
.CODE
FUN_100a083c PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 20
    push ebx
    push esi
    xor esi, esi
    cmp dword ptr [ebp + 12], esi
    push edi
    mov dword ptr [ebp - 4], ecx
    mov dword ptr [ebp - 16], esi
    lea edi, [ebp - 16]
    je L19
    jmp L1
L0:
    mov edi, dword ptr [ebp - 20]
L1:
    mov eax, dword ptr [ebp + 12]
    cmp dword ptr [eax + 8], esi
    je L19
    push 20
    call sub_100650A5
    cmp eax, esi
    je L2
    push 010114734h
    push esi
    push esi
    mov ecx, eax
    call sub_100828BB
    jmp L3
L2:
    xor eax, eax
L3:
    cmp eax, esi
    mov dword ptr [edi], eax
    je L19
    push 48
    call sub_100650CC
    cmp eax, esi
    je L4
    push esi
    push esi
    push esi
    push esi
    mov ecx, eax
    call sub_10082CB8
    mov ebx, eax
    jmp L5
L4:
    xor ebx, ebx
L5:
    cmp ebx, esi
    je L19
    mov eax, dword ptr [edi]
    mov dword ptr [eax + 8], ebx
    mov eax, dword ptr [edi]
    add eax, 12
    cmp dword ptr [ebp + 8], esi
    mov dword ptr [ebp - 20], eax
    mov dword ptr [ebp - 8], 1
    mov dword ptr [ebp - 12], esi
    je L6
    push dword ptr [ebp + 8]
    call sub_100828B5
    cmp eax, esi
    mov dword ptr [ebx + 24], eax
    je L19
L6:
    mov eax, dword ptr [ebp + 12]
    mov edi, dword ptr [eax + 8]
    jmp L13
L7:
    push 24
    call sub_10065127
    cmp eax, esi
    je L8
    mov ecx, eax
    call sub_10082E5F
    jmp L9
L8:
    xor eax, eax
L9:
    cmp eax, esi
    je L19
    mov ecx, dword ptr [ebx + 24]
    mov dword ptr [eax + 16], ecx
    mov dword ptr [ebx + 24], eax
    mov ecx, dword ptr [edi + 12]
    cmp ecx, esi
    lea esi, [eax + 20]
    je L10
    push esi
    push ecx
    mov ecx, dword ptr [ebp - 4]
    call sub_100A08D0
    test eax, eax
    jge L12
    mov dword ptr [ebp - 12], 000000BF2h
    jmp L11
L10:
    mov dword ptr [ebp - 12], 000000C00h
L11:
    mov dword ptr [esi], 1
L12:
    mov eax, dword ptr [esi]
    imul eax, dword ptr [ebp - 8]
    mov edi, dword ptr [edi + 8]
    mov dword ptr [ebp - 8], eax
    xor esi, esi
L13:
    cmp dword ptr [edi + 4], 3
    jne L7
    push edi
    call sub_10082937
    cmp eax, esi
    mov dword ptr [ebx + 20], eax
    je L19
    mov ecx, dword ptr [ebp - 12]
    mov eax, 000000BF2h
    add edi, 16
    sub ecx, eax
    je L17
    sub ecx, 14
    je L16
    cmp dword ptr [ebp - 8], 1
    jb L15
    cmp dword ptr [ebp - 8], 000010000h
    ja L15
    mov ecx, dword ptr [ebp - 4]
    push 1
    push ebx
    call sub_1009ACD9
    test eax, eax
    jl L19
    mov eax, dword ptr [ebp + 12]
    mov eax, dword ptr [eax + 12]
    cmp eax, esi
    mov dword ptr [ebp + 12], eax
    jne L0
    mov eax, dword ptr [ebp - 16]
L14:
    pop edi
    pop esi
    pop ebx
    leave
    ret 8
L15:
    push dword ptr [edi + 8]
    push 0101151B4h
    push 000000BF3h
    jmp L18
L16:
    push dword ptr [edi + 8]
    push 010115184h
    push 000000C00h
    jmp L18
L17:
    push dword ptr [edi + 8]
    push 010115148h
    push eax
L18:
    push edi
    push dword ptr [ebp - 4]
    call sub_10099686
    add esp, 20
L19:
    xor eax, eax
    jmp L14
FUN_100a083c ENDP
END
