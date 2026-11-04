.686
.MODEL FLAT, C
EXTRN sub_10067CAA:PROC
EXTRN sub_100681FF:PROC
EXTRN sub_10068204:PROC
EXTRN sub_10068210:PROC
EXTRN sub_10068236:PROC
EXTRN sub_10068262:PROC
.CODE
FUN_10068174 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push ecx
    push push ebx
    mov mov ebx, dword ptr [ebp + 8]
    push push edi
    mov mov edi, dword ptr [ecx + 4]
    cmp cmp ebx, edi
    mov mov dword ptr [ebp - 4], ecx
    jae sub_100681FF
    cmp cmp byte ptr [ebx], 48
    jne sub_10068204
    push push esi
    xor xor eax, eax
    xor xor ecx, ecx
    lea lea esi, [ebx + 1]
    jmp L0
    mov mov dl, byte ptr [esi]
    cmp cmp dl, 48
    jl L2
    cmp cmp dl, 55
    jg L3
    test test eax, 0E0000000h
    je L2
    xor xor ecx, ecx
    inc inc ecx
    movsx movsx edx, dl
    lea lea eax, [edx + eax*8 - 48]
    inc inc esi
    cmp cmp esi, edi
    jb L1
    mov mov edx, dword ptr [ebp + 12]
    test test edx, edx
    je sub_10068210
    mov mov dword ptr [edx], eax
    test test ecx, ecx
    je sub_10068236
    mov mov eax, dword ptr [ebp - 4]
    push push 01010CB38h
    push push 03EBh
    lea lea ecx, [eax + 8]
    push push ecx
    push push dword ptr [eax + 48]
    call sub_10067CAA
    add add esp, 16
    mov mov eax, esi
L2:
    sub sub eax, ebx
    pop pop esi
    jmp sub_10068262
L3:
    xor xor eax, eax
    pop pop edi
    pop pop ebx
    leave leave
    ret ret 8
FUN_10068174 ENDP
END
