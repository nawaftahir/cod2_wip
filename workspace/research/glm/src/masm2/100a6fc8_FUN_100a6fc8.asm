.686
.MODEL FLAT, C
EXTRN sub_1008B20F:PROC
EXTRN sub_100A70B3:PROC
EXTRN sub_100A70BB:PROC
EXTRN sub_100A70BD:PROC
EXTRN sub_100A70C0:PROC
EXTRN sub_100A70CA:PROC
EXTRN sub_100A70CD:PROC
EXTRN sub_100A70DD:PROC
EXTRN sub_100A710E:PROC
EXTRN sub_100A7156:PROC
.CODE
FUN_100a6fc8 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 16
    mov mov eax, dword ptr [ecx + 76]
    cmp cmp eax, dword ptr [ecx + 0224h]
    push push ebx
    push push esi
    push push edi
    mov mov dword ptr [ebp - 12], eax
    jae sub_100A70BD
    mov mov edx, dword ptr [ecx + 0230h]
    lea lea eax, [edx + eax*4]
    mov mov dword ptr [ebp - 8], eax
    mov mov eax, dword ptr [ebp - 8]
    mov mov esi, dword ptr [eax]
    test test esi, esi
    je L1
    mov mov eax, dword ptr [esi]
    test test eax, eax
    je L2
    mov mov edx, dword ptr [esi + 16]
    mov mov edx, dword ptr [edx]
    mov mov edi, dword ptr [ecx + 20]
    mov mov edx, dword ptr [edi + edx*4]
    mov mov edx, dword ptr [edx + 4]
    cmp cmp edx, dword ptr [ecx + 084h]
    jne L0
    and and eax, 0FFF00000h
    cmp cmp eax, 010000000h
    je sub_100A70C0
    and and dword ptr [ebp - 4], 0
    cmp cmp dword ptr [esi + 4], 0
    jbe sub_100A70CA
    mov mov ebx, dword ptr [esi + 8]
    mov mov eax, dword ptr [ebx]
    mov mov eax, dword ptr [edi + eax*4]
    mov mov edx, dword ptr [eax + 60]
    mov mov dword ptr [ebp - 16], edx
    jmp sub_100A70B3
    mov mov eax, dword ptr [edi + edx*4]
    mov mov edx, dword ptr [eax + 56]
    cmp cmp edx, -1
    jne sub_100A70BB
    cmp cmp byte ptr [eax + 108], 3
    jne sub_100A70DD
    mov mov eax, dword ptr [eax + 60]
    or or eax, dword ptr [ebp - 16]
    test test ah, 2
    je sub_100A710E
    inc inc dword ptr [ebp - 4]
    mov mov eax, dword ptr [ebp - 4]
    add add ebx, 4
    cmp cmp eax, dword ptr [esi + 4]
    jb sub_100A70CD
    inc inc dword ptr [ebp - 12]
    mov mov eax, dword ptr [ebp - 12]
    add add dword ptr [ebp - 8], 4
L0:
    cmp cmp eax, dword ptr [ecx + 0224h]
    jb L3
    jmp sub_100A7156
    mov mov eax, dword ptr [ecx + 0C8h]
    and and eax, 0FFh
    push push eax
    push push 010116B68h
    push push 01263h
    push push dword ptr [esi + 60]
    push push ecx
L1:
    call sub_1008B20F
    add add esp, 20
    pop pop edi
    pop pop esi
    xor xor eax, eax
    pop pop ebx
L3:
    leave leave
    ret ret
FUN_100a6fc8 ENDP
END
