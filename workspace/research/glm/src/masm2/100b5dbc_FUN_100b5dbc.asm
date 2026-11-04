.686
.MODEL FLAT, C
EXTRN sub_1008B156:PROC
EXTRN sub_1008B181:PROC
EXTRN sub_1008B1DD:PROC
EXTRN sub_100B5F05:PROC
EXTRN sub_100B5F0D:PROC
EXTRN sub_100B5F15:PROC
EXTRN sub_100B5F2C:PROC
EXTRN sub_100B5F30:PROC
EXTRN sub_100B5F35:PROC
EXTRN sub_100B5F3A:PROC
EXTRN sub_100B5F3D:PROC
EXTRN sub_100B5F57:PROC
EXTRN sub_100B5F5B:PROC
EXTRN sub_100B5F60:PROC
EXTRN sub_100B5F65:PROC
EXTRN sub_100B5F83:PROC
EXTRN sub_100B5FCF:PROC
EXTRN sub_100B6003:PROC
.CODE
FUN_100b5dbc PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 40
    push push ebx
    mov mov ebx, ecx
    xor xor edx, edx
    xor xor eax, eax
    cmp cmp dword ptr [ebx + 0158h], edx
    jne sub_100B5F15
    cmp cmp dword ptr [ebx + 8], edx
    push push edi
    lea lea edi, [ebp - 40]
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    mov mov dword ptr [ebp - 12], edx
    mov mov dword ptr [ebp - 16], edx
    mov mov dword ptr [ebp - 8], edx
    mov mov dword ptr [ebp - 20], edx
    stosd stosd dword ptr es:[edi], eax
    mov mov dword ptr [ebp - 4], edx
    jbe L1
    mov mov edi, 011BCh
    push push esi
    mov mov eax, dword ptr [ebx + 20]
    mov mov ecx, dword ptr [ebp - 4]
    mov mov esi, dword ptr [eax + ecx*4]
    mov mov eax, dword ptr [esi + 4]
    mov mov ecx, dword ptr [ebx + 16]
    mov mov eax, dword ptr [ecx + eax*4]
    test test byte ptr [eax + 4], 32
    je sub_100B5F05
    push push dword ptr [esi + 108]
    mov mov eax, dword ptr [ebx]
    mov mov ecx, ebx
    call call dword ptr [eax + 84]
    push push dword ptr [esi + 108]
    mov mov dword ptr [ebp - 24], eax
    mov mov eax, dword ptr [ebx]
    mov mov ecx, ebx
    call call dword ptr [eax + 88]
    mov mov ecx, dword ptr [ebp - 24]
    dec dec ecx
    je sub_100B5F0D
    sub sub ecx, 4
    je L0
    sub sub ecx, 7
    jne sub_100B5F2C
    test test eax, eax
    jne sub_100B5F30
    cmp cmp dword ptr [esi + 16], eax
    jbe sub_100B5F35
    cmp cmp dword ptr [ebp - 12], eax
    jne sub_100B5F3A
    push push 010117D54h
    push push edi
    push push dword ptr [esi + 96]
    push push ebx
    call sub_1008B156
    xor xor eax, eax
    add add esp, 16
    inc inc eax
    mov mov dword ptr [ebp - 12], eax
    mov mov dword ptr [ebp - 8], eax
    jmp sub_100B5F57
    test test eax, eax
    jne sub_100B5F5B
    cmp cmp dword ptr [esi + 16], eax
    jbe sub_100B5F60
    cmp cmp dword ptr [ebp - 16], eax
    jne sub_100B5F65
    push push 010115C44h
    push push edi
    push push dword ptr [esi + 96]
    push push ebx
    call sub_1008B181
    xor xor eax, eax
    add add esp, 16
    inc inc eax
    mov mov dword ptr [ebp - 16], eax
    jmp sub_100B5F3D
    test test eax, eax
    jne sub_100B5F83
    mov mov eax, dword ptr [esi + 16]
    mov mov dword ptr [ebp + eax*4 - 40], 1
    mov mov eax, dword ptr [esi + 96]
    mov mov dword ptr [ebp - 20], eax
    inc inc dword ptr [ebp - 4]
    mov mov eax, dword ptr [ebp - 4]
    cmp cmp eax, dword ptr [ebx + 8]
    jb L2
    xor xor edx, edx
    pop pop esi
    xor xor ecx, ecx
    xor xor eax, eax
    pop pop edi
    cmp cmp dword ptr [ebp + eax*4 - 40], edx
    je sub_100B5FCF
    inc inc ecx
    inc inc eax
    cmp cmp eax, 4
    jb sub_100B5FCF
    cmp cmp ecx, 4
    je sub_100B6003
    push push 010115C00h
    push push 011BDh
    push push dword ptr [ebp - 20]
    push push ebx
    call sub_1008B1DD
    add add esp, 16
    mov mov dword ptr [ebp - 8], 1
    mov mov eax, dword ptr [ebp - 8]
    neg neg eax
    sbb sbb eax, eax
L1:
    and and eax, 080004005h
    pop pop ebx
    leave leave
    ret ret
FUN_100b5dbc ENDP
END
