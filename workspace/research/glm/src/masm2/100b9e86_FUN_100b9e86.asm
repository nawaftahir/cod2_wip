.686
.MODEL FLAT, C
EXTRN sub_1008657F:PROC
EXTRN sub_10086593:PROC
EXTRN sub_1008B1F7:PROC
EXTRN sub_100B9E6A:PROC
EXTRN sub_100BA03C:PROC
EXTRN sub_100BA043:PROC
EXTRN sub_100BA044:PROC
EXTRN sub_100BA04C:PROC
EXTRN sub_100BA068:PROC
EXTRN sub_100BA071:PROC
EXTRN sub_100BA08A:PROC
EXTRN sub_100BA09D:PROC
EXTRN sub_100BA0D3:PROC
.CODE
FUN_100b9e86 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 020Ch
    push push ebx
    push push esi
    push push edi
    xor xor edi, edi
    mov mov esi, ecx
    xor xor bl, bl
    cmp cmp dword ptr [esi + 8], edi
    mov mov byte ptr [ebp - 1], bl
    mov mov dword ptr [ebp - 8], edi
    jbe L3
    mov mov eax, dword ptr [esi + 20]
    mov mov ecx, dword ptr [ebp - 8]
    mov mov ecx, dword ptr [eax + ecx*4]
    mov mov eax, dword ptr [ecx + 4]
    mov mov edx, dword ptr [esi + 16]
    mov mov eax, dword ptr [edx + eax*4]
    mov mov eax, dword ptr [eax + 4]
    test test al, 16
    je L0
    test test ah, 2
    je L1
    test test al, 32
    je L4
    mov mov eax, dword ptr [esi]
    push push edi
    push push ecx
    mov mov ecx, esi
    call call dword ptr [eax + 4]
    test test eax, eax
    jge L5
    lea lea eax, [ebp - 8]
    push push eax
    mov mov ecx, esi
    call sub_100B9E6A
    mov mov byte ptr [ebp - 1], 1
    mov mov bl, byte ptr [ebp - 1]
    inc inc dword ptr [ebp - 8]
    mov mov eax, dword ptr [ebp - 8]
    cmp cmp eax, dword ptr [esi + 8]
    jb L2
    test test bl, bl
    je L7
    mov mov eax, 080004005h
    jmp sub_100BA071
    cmp cmp dword ptr [esi + 8], edi
    mov mov dword ptr [ebp - 8], edi
    jbe sub_100BA071
    mov mov ecx, dword ptr [ebp - 8]
    mov mov eax, dword ptr [esi + 20]
    mov mov edi, dword ptr [eax + ecx*4]
    mov mov edx, dword ptr [edi + 4]
    mov mov ecx, dword ptr [esi + 16]
    mov mov ecx, dword ptr [ecx + edx*4]
    mov mov ecx, dword ptr [ecx + 4]
    test test cl, 16
    je L8
    test test ch, 2
    je L9
    test test cl, 32
    je sub_100BA08A
    mov mov ecx, dword ptr [ebp - 8]
    inc inc ecx
    mov mov dword ptr [ebp - 12], ecx
    mov mov ecx, dword ptr [esi + 8]
    cmp cmp dword ptr [ebp - 12], ecx
    jae sub_100BA09D
    mov mov ecx, dword ptr [ebp - 12]
    lea lea eax, [eax + ecx*4]
    mov mov ebx, dword ptr [eax]
    cmp cmp dword ptr [ebx + 4], edx
    jne sub_100BA03C
    mov mov ecx, dword ptr [ebx + 112]
    cmp cmp ecx, dword ptr [edi + 112]
    jne sub_100BA044
    mov mov ecx, dword ptr [ebx + 108]
    cmp cmp ecx, dword ptr [edi + 108]
L6:
    jne sub_100BA04C
    mov mov ecx, dword ptr [edi]
    xor xor ecx, dword ptr [ebx]
    test test ecx, 01000000h
    jne sub_100BA068
    inc inc dword ptr [ebp - 12]
    mov mov ecx, dword ptr [ebp - 12]
    add add eax, 4
    cmp cmp ecx, dword ptr [esi + 8]
    jb sub_100BA043
    jmp sub_100BA0D3
    push push 0100h
    lea lea eax, [ebp - 020Ch]
    push push eax
    push push edi
    mov mov ecx, esi
    call sub_1008657F
    push push 0100h
    lea lea eax, [ebp - 010Ch]
    push push eax
    push push ebx
    mov mov ecx, esi
    call sub_10086593
    lea lea eax, [ebp - 010Ch]
    push push eax
    lea lea eax, [ebp - 020Ch]
    push push eax
    push push 010119D18h
    push push 01195h
    push push dword ptr [edi + 104]
    push push esi
    call sub_1008B1F7
    add add esp, 24
    lea lea eax, [ebp - 8]
    push push eax
    mov mov ecx, esi
    call L6
    mov mov byte ptr [ebp - 1], 1
    mov mov bl, byte ptr [ebp - 1]
    inc inc dword ptr [ebp - 8]
    mov mov eax, dword ptr [ebp - 8]
    cmp cmp eax, dword ptr [esi + 8]
    jb sub_100BA071
    neg neg bl
    sbb sbb ebx, ebx
    and and ebx, 080004005h
    mov mov eax, ebx
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret
FUN_100b9e86 ENDP
END
