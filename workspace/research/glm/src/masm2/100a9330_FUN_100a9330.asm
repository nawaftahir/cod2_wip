.686
.MODEL FLAT, C
EXTRN sub_1008B2BB:PROC
EXTRN sub_1008B2DF:PROC
EXTRN sub_1008B2F7:PROC
EXTRN sub_100A6EF8:PROC
EXTRN sub_100A959F:PROC
EXTRN sub_100A95BD:PROC
EXTRN sub_100A95C4:PROC
EXTRN sub_100A95C8:PROC
EXTRN sub_100A95D0:PROC
EXTRN sub_100A9629:PROC
EXTRN sub_100A962F:PROC
EXTRN sub_100A963A:PROC
EXTRN sub_100A963E:PROC
EXTRN sub_100A9646:PROC
EXTRN sub_100A9648:PROC
EXTRN sub_100A964C:PROC
EXTRN sub_100A9663:PROC
EXTRN sub_100A96C1:PROC
EXTRN sub_100A96C4:PROC
EXTRN sub_100A96C5:PROC
EXTRN sub_100A96D0:PROC
EXTRN sub_100A96DB:PROC
EXTRN sub_100A96F0:PROC
EXTRN sub_100A9735:PROC
EXTRN sub_100A9780:PROC
EXTRN sub_100A97A4:PROC
.CODE
FUN_100a9330 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 12
    and and dword ptr [ebp - 4], 0
    cmp cmp dword ptr [ecx + 12], 0
    push push ebx
    push push esi
    push push edi
    jbe L2
    mov mov eax, dword ptr [ecx + 24]
    mov mov dword ptr [ebp - 8], eax
    mov mov edi, 011000000h
    mov mov eax, dword ptr [ebp - 4]
    mov mov dword ptr [ecx + 0FCh], eax
    mov mov eax, dword ptr [ebp - 8]
    mov mov esi, dword ptr [eax]
    test test esi, esi
    mov mov dword ptr [ecx + 0100h], esi
    je L4
    cmp cmp dword ptr [esi], 0
    je L6
    mov mov eax, dword ptr [esi]
    mov mov edx, eax
    and and eax, 0FFFFFh
    mov mov ebx, eax
    and and edx, 0FFF00000h
    mov mov eax, 060C00000h
    cmp cmp edx, eax
    ja L0
    je L11
    cmp cmp edx, 060200000h
    je L12
    cmp cmp edx, 060300000h
    je L13
    cmp cmp edx, 060700000h
    je L1
    cmp cmp edx, 060800000h
    jne L5
    xor xor eax, eax
    inc inc eax
    jmp sub_100A959F
    mov mov eax, dword ptr [ecx + 0C8h]
    and and eax, 0FFFFh
    cmp cmp eax, 0104h
    je L7
    xor xor edx, edx
    inc inc edx
    mov mov eax, edx
    jmp sub_100A95BD
    cmp cmp edx, 060D00000h
    je sub_100A95C4
    cmp cmp edx, 061100000h
    je sub_100A95C8
    cmp cmp edx, 061200000h
    je sub_100A95D0
    push push edx
    call sub_100A6EF8
    test test eax, eax
    jne L8
    cmp cmp edx, edi
    jne L9
    mov mov eax, dword ptr [esi + 8]
    sub sub edx, edi
    neg neg edx
    sbb sbb edx, edx
    and and edx, ebx
    mov mov eax, dword ptr [eax + edx*4]
    mov mov edx, dword ptr [ecx + 20]
    mov mov eax, dword ptr [edx + eax*4]
    cmp cmp dword ptr [eax + 60], 0
    je L10
    mov mov edx, dword ptr [ecx + 0C8h]
    and and edx, 0FFFFh
    cmp cmp edx, 0104h
    je L14
    mov mov eax, dword ptr [eax + 4]
L0:
    mov mov edx, dword ptr [ecx + 16]
    mov mov eax, dword ptr [edx + eax*4]
    test test byte ptr [eax + 4], 16
L1:
    jne sub_100A9663
    inc inc dword ptr [ebp - 4]
    mov mov eax, dword ptr [ebp - 4]
    add add dword ptr [ebp - 8], 4
    cmp cmp eax, dword ptr [ecx + 12]
    jb L3
    and and dword ptr [ebp - 4], 0
    cmp cmp dword ptr [ecx + 12], 0
    jbe sub_100A9629
    mov mov eax, dword ptr [ecx + 24]
    mov mov dword ptr [ebp - 12], eax
    mov mov eax, dword ptr [ebp - 4]
    mov mov dword ptr [ecx + 0FCh], eax
L2:
    mov mov eax, dword ptr [ebp - 12]
    mov mov eax, dword ptr [eax]
    xor xor edx, edx
    cmp cmp eax, edx
    mov mov dword ptr [ecx + 0100h], eax
    je sub_100A963A
    cmp cmp dword ptr [eax], edx
    je sub_100A963E
    cmp cmp dword ptr [eax + 4], edx
    mov mov dword ptr [ebp - 8], edx
    jbe sub_100A9646
L6:
    mov mov edi, dword ptr [ecx + 20]
    mov mov edx, dword ptr [eax + 8]
    mov mov esi, dword ptr [edx]
    mov mov esi, dword ptr [edi + esi*4]
    mov mov ebx, dword ptr [ecx + 080h]
    cmp cmp dword ptr [esi + 4], ebx
    jne sub_100A9648
    cmp cmp byte ptr [esi + 108], 5
    je sub_100A96F0
    inc inc dword ptr [ebp - 8]
    mov mov esi, dword ptr [ecx + 0100h]
    mov mov ebx, dword ptr [ebp - 8]
    add add edx, 4
    cmp cmp ebx, dword ptr [esi + 4]
    jb sub_100A964C
    inc inc dword ptr [ebp - 4]
    mov mov eax, dword ptr [ebp - 4]
    add add dword ptr [ebp - 12], 4
    cmp cmp eax, dword ptr [ecx + 12]
    jb sub_100A962F
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret
    xor xor eax, eax
    jmp sub_100A96C5
    xor xor eax, eax
    jmp sub_100A96C1
    push push 2
    jmp sub_100A96C4
    push push 3
    jmp sub_100A96D0
    push push 3
    pop pop eax
    xor xor edx, edx
    inc inc edx
    jmp sub_100A96DB
    push push 2
    pop pop eax
    xor xor edx, edx
    mov mov edi, dword ptr [ecx + 0C8h]
    and and edi, 0FFh
    push push edi
    push push dword ptr [edx*4 + 0101A4080h]
    push push dword ptr [eax*4 + 0101A4070h]
    push push 010116CECh
    push push 011B4h
    push push dword ptr [esi + 60]
    push push ecx
    call sub_1008B2BB
    add add esp, 28
    jmp sub_100A9780
    mov mov eax, dword ptr [ecx + 0C8h]
    and and eax, 0FFh
    push push eax
    push push 010116CBCh
    push push 011B4h
    push push dword ptr [esi + 60]
    push push ecx
    call sub_1008B2DF
    add add esp, 20
    jmp sub_100A97A4
    push push 010116C7Ch
L12:
    push push 011A0h
    push push dword ptr [eax + 60]
L13:
    push push ecx
L14:
    call sub_1008B2F7
    add add esp, 16
    mov mov eax, 080004005h
    jmp sub_100A9735
FUN_100a9330 ENDP
END
