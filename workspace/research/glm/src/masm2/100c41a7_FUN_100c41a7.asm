.686
.MODEL FLAT, C
EXTRN sub_1008B1A4:PROC
EXTRN sub_1008B1F3:PROC
EXTRN sub_100C42FB:PROC
EXTRN sub_100C42FD:PROC
EXTRN sub_100C430C:PROC
EXTRN sub_100C4319:PROC
EXTRN sub_100C4326:PROC
EXTRN sub_100C434F:PROC
EXTRN sub_100C4376:PROC
EXTRN sub_100C439C:PROC
EXTRN sub_100C43A9:PROC
EXTRN sub_100C43C5:PROC
EXTRN sub_100C43E0:PROC
EXTRN sub_100C441A:PROC
EXTRN sub_100C441E:PROC
.CODE
FUN_100c41a7 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push ecx
    push push ecx
    push push ebx
    push push esi
    xor xor ebx, ebx
    mov mov esi, ecx
    mov mov ecx, dword ptr [ebp + 20]
    cmp cmp ecx, ebx
    push push edi
    mov mov dword ptr [ebp - 8], ebx
    mov mov dword ptr [ebp - 4], ebx
    je L0
    mov mov dword ptr [ecx], ebx
    mov mov edi, dword ptr [ebp + 8]
    mov mov eax, dword ptr [edi + 4]
    cmp cmp dword ptr [esi + 088h], eax
    jne L2
    mov mov eax, dword ptr [edi + 12]
    cmp cmp eax, dword ptr [esi + 44]
    mov mov dword ptr [ebp - 8], ebx
    mov mov dword ptr [ebp - 4], eax
    jb L1
    push push 01011A2A8h
    push push 01199h
    jmp L4
    mov mov ecx, dword ptr [esi + 80]
    cmp cmp ecx, ebx
    je L5
    cmp cmp eax, ecx
    jb sub_100C42FB
    sub sub eax, ecx
    mov mov dword ptr [ebp - 4], eax
    mov mov dword ptr [ebp - 8], 3
    jmp sub_100C430C
    cmp cmp dword ptr [esi + 08Ch], eax
    jne L3
    mov mov eax, dword ptr [edi + 12]
    cmp cmp eax, 1
    mov mov dword ptr [ebp - 8], 3
L1:
    mov mov dword ptr [ebp - 4], eax
    jb sub_100C4326
    push push 01011A280h
    push push 0119Ch
    jmp sub_100C4319
    cmp cmp dword ptr [esi + 084h], eax
    jne sub_100C42FD
    mov mov eax, dword ptr [esi]
    push push ecx
    lea lea ecx, [ebp - 8]
    push push ecx
    lea lea ecx, [ebp - 4]
    push push ecx
    push push edi
    mov mov ecx, esi
    call call dword ptr [eax + 084h]
    test test eax, eax
    jge sub_100C434F
    mov mov eax, 080004005h
    jmp sub_100C43A9
    cmp cmp dword ptr [esi + 090h], eax
    jne sub_100C439C
    mov mov eax, dword ptr [edi + 12]
    cmp cmp eax, dword ptr [esi + 52]
    mov mov dword ptr [ebp - 8], 19
    mov mov dword ptr [ebp - 4], eax
    jb sub_100C4376
    push push 01011A254h
    push push 011C5h
    mov mov eax, dword ptr [esi + 0100h]
    push push dword ptr [eax + 60]
    push push esi
    call sub_1008B1A4
    mov mov eax, 088760B59h
    jmp sub_100C43E0
    mov mov eax, dword ptr [ebp - 4]
    mov mov ecx, dword ptr [ebp + 12]
    cmp cmp ecx, ebx
    je sub_100C43C5
    mov mov edx, dword ptr [ebp - 8]
    mov mov ebx, edx
    or or ebx, -8
    shl shl ebx, 20
    and and edx, 24
    or or ebx, edx
    shl shl ebx, 8
    and and eax, 07FFh
    or or ebx, eax
    mov mov dword ptr [ecx], ebx
    xor xor ebx, ebx
    push push dword ptr [ebp + 16]
    mov mov eax, dword ptr [esi]
    push push edi
    mov mov ecx, esi
    call call dword ptr [eax + 124]
    cmp cmp eax, ebx
    jl sub_100C441A
    xor xor eax, eax
    jmp sub_100C441E
    push push 01011A224h
    push push ebx
    push push ebx
    push push esi
    call sub_1008B1F3
    mov mov eax, 080004005h
    add add esp, 16
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 16
FUN_100c41a7 ENDP
END
