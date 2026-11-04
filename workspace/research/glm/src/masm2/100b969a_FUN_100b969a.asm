.686
.MODEL FLAT, C
EXTRN sub_100B9777:PROC
EXTRN sub_100B97AD:PROC
EXTRN sub_100B97B6:PROC
EXTRN sub_100B97B9:PROC
EXTRN sub_100B97BE:PROC
EXTRN sub_100B97C2:PROC
EXTRN sub_100B97C7:PROC
EXTRN sub_100B97CA:PROC
EXTRN sub_100B97CC:PROC
EXTRN sub_100B97D8:PROC
EXTRN sub_100B97DA:PROC
EXTRN sub_100B97E1:PROC
EXTRN sub_100B97E9:PROC
.CODE
FUN_100b969a PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    mov mov eax, dword ptr [ebp + 16]
    mov mov eax, dword ptr [eax + 20]
    mov mov ecx, dword ptr [ebp + 8]
    push push ebx
    mov mov ebx, dword ptr [eax + ecx*4]
    mov mov ecx, dword ptr [ebp + 12]
    mov mov eax, dword ptr [eax + ecx*4]
    push push esi
    push push edi
    mov mov edi, dword ptr [ebx + 96]
    mov mov ecx, dword ptr [edi + 32]
    test test ecx, ecx
    mov mov dword ptr [ebp + 16], eax
    mov mov eax, dword ptr [eax + 96]
    mov mov esi, 01019166Eh
    jne L0
    mov mov ecx, esi
    mov mov edx, dword ptr [eax + 32]
    test test edx, edx
    je L1
    mov mov esi, edx
    mov mov al, byte ptr [ecx]
    mov mov dl, al
    cmp cmp al, byte ptr [esi]
    jne L3
    test test dl, dl
    je L3
    mov mov al, byte ptr [ecx + 1]
    mov mov dl, al
    cmp cmp al, byte ptr [esi + 1]
    jne L4
    inc inc ecx
    inc inc ecx
    inc inc esi
    inc inc esi
    test test dl, dl
    jne L2
    xor xor ecx, ecx
    jmp L5
    sbb sbb ecx, ecx
    sbb sbb ecx, -1
    test test ecx, ecx
    jle L6
    xor xor eax, eax
    inc inc eax
    jmp sub_100B97DA
    jge sub_100B9777
    or or eax, -1
    jmp sub_100B97E1
    mov mov eax, dword ptr [ebp + 16]
    mov mov eax, dword ptr [eax + 96]
    mov mov eax, dword ptr [eax + 20]
    mov mov esi, dword ptr [eax + 24]
    mov mov eax, dword ptr [edi + 20]
    mov mov ecx, dword ptr [eax + 24]
    mov mov al, byte ptr [ecx]
    mov mov dl, al
    cmp cmp al, byte ptr [esi]
    jne sub_100B97CA
    test test dl, dl
    je sub_100B97CA
    mov mov al, byte ptr [ecx + 1]
L2:
    mov mov dl, al
    cmp cmp al, byte ptr [esi + 1]
    jne sub_100B97D8
    inc inc ecx
    inc inc ecx
    inc inc esi
    inc inc esi
    test test dl, dl
    jne sub_100B97BE
    xor xor ecx, ecx
    jmp sub_100B97E9
    sbb sbb ecx, ecx
    sbb sbb ecx, -1
    test test ecx, ecx
L4:
    jg sub_100B97AD
    jl sub_100B97B6
    mov mov eax, dword ptr [ebp + 16]
    mov mov ecx, dword ptr [eax + 96]
    cmp cmp edi, ecx
    ja sub_100B97B9
    jb sub_100B97C2
    mov mov ecx, dword ptr [ebx + 116]
    mov mov edx, dword ptr [eax + 116]
    cmp cmp ecx, edx
    jb sub_100B97CC
    ja sub_100B97C7
    mov mov ecx, dword ptr [ebx + 16]
    mov mov edx, dword ptr [eax + 16]
    cmp cmp edx, ecx
    ja sub_100B97D8
    sbb sbb eax, eax
    neg neg eax
    pop pop edi
    pop pop esi
    pop pop ebx
    pop pop ebp
    ret ret 12
FUN_100b969a ENDP
END
