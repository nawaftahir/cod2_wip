.686
.MODEL FLAT, C
EXTRN sub_100855D9:PROC
EXTRN sub_1008563C:PROC
EXTRN sub_100856ED:PROC
EXTRN sub_100C2F7C:PROC
EXTRN sub_100C2F7F:PROC
EXTRN sub_100C2F81:PROC
EXTRN sub_100C2F83:PROC
EXTRN sub_100C2F89:PROC
EXTRN sub_100C2F8D:PROC
EXTRN sub_100C2F8F:PROC
EXTRN sub_100C2F98:PROC
EXTRN sub_100C2FA0:PROC
EXTRN sub_100C2FA8:PROC
EXTRN sub_100C2FB0:PROC
EXTRN sub_100C2FB8:PROC
EXTRN sub_100C2FC4:PROC
EXTRN sub_100C3002:PROC
EXTRN sub_100C3044:PROC
EXTRN sub_100C3052:PROC
EXTRN sub_100C3061:PROC
.CODE
FUN_100c2e40 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 24
    push push ebx
    push push esi
    push push edi
    mov mov esi, ecx
    xor xor edi, edi
    cmp cmp dword ptr [esi + 12], edi
    mov mov dword ptr [ebp - 24], edi
    mov mov dword ptr [ebp - 12], edi
    jbe sub_100C2F8D
    mov mov eax, dword ptr [esi + 24]
    mov mov ecx, dword ptr [eax + edi*4]
    call sub_100855D9
    test test eax, eax
    je sub_100C2F89
    lea lea ebx, [edi + 1]
    cmp cmp ebx, dword ptr [esi + 12]
    mov mov dword ptr [ebp - 8], 1
    mov mov dword ptr [ebp - 20], ebx
    jae L1
    mov mov eax, dword ptr [esi + 24]
    mov mov edi, dword ptr [eax + ebx*4]
    mov mov ecx, edi
    call sub_1008563C
    test test eax, eax
    jne sub_100C2F7F
    mov mov eax, dword ptr [edi]
    and and eax, 0FFF00000h
    cmp cmp eax, 010000000h
    jne sub_100C2F89
    mov mov ecx, dword ptr [edi + 12]
    test test ecx, ecx
    jbe sub_100C2F81
    mov mov eax, dword ptr [edi + 8]
    mov mov edi, dword ptr [edi + 16]
    mov mov edx, dword ptr [esi + 20]
    mov mov dword ptr [ebp - 4], eax
    sub sub edi, eax
    mov mov dword ptr [ebp - 16], ecx
    mov mov ecx, dword ptr [ebp - 4]
    mov mov eax, dword ptr [edi + ecx]
    mov mov eax, dword ptr [edx + eax*4]
    mov mov ecx, dword ptr [ecx]
    mov mov ecx, dword ptr [edx + ecx*4]
    mov mov ebx, dword ptr [eax + 56]
    cmp cmp ebx, dword ptr [ecx + 56]
    jne sub_100C2F98
    mov mov ebx, dword ptr [eax + 60]
    cmp cmp ebx, dword ptr [ecx + 60]
    jne sub_100C2FA0
    mov mov ebx, dword ptr [eax + 4]
    cmp cmp ebx, dword ptr [ecx + 4]
    jne sub_100C2FA8
    mov mov ebx, dword ptr [eax + 12]
    cmp cmp ebx, dword ptr [ecx + 12]
    jne sub_100C2FB0
    mov mov ebx, dword ptr [eax + 8]
    cmp cmp ebx, dword ptr [ecx + 8]
    jne sub_100C2FB8
    mov mov eax, dword ptr [eax + 16]
    cmp cmp eax, dword ptr [ecx + 16]
    je sub_100C2FC4
    and and dword ptr [ebp - 8], 0
    add add dword ptr [ebp - 4], 4
    dec dec dword ptr [ebp - 16]
    jne sub_100C2F8F
    mov mov ebx, dword ptr [ebp - 20]
    inc inc ebx
    cmp cmp ebx, dword ptr [esi + 12]
    mov mov dword ptr [ebp - 20], ebx
    jb L0
    jmp sub_100C3002
    and and dword ptr [ebp - 8], 0
    cmp cmp dword ptr [ebp - 8], 0
    mov mov edi, dword ptr [ebp - 12]
    je sub_100C3044
    cmp cmp edi, dword ptr [esi + 12]
    mov mov dword ptr [ebp - 24], 1
    mov mov ebx, edi
    jae sub_100C3052
    mov mov eax, dword ptr [esi + 24]
    mov mov ecx, dword ptr [eax + ebx*4]
    call sub_100856ED
    test test eax, eax
    jne sub_100C3061
    mov mov eax, dword ptr [esi + 24]
    mov mov eax, dword ptr [eax + ebx*4]
    and and dword ptr [eax], 0
    inc inc ebx
    cmp cmp ebx, dword ptr [esi + 12]
    jb sub_100C3052
    inc inc edi
    cmp cmp edi, dword ptr [esi + 12]
    mov mov dword ptr [ebp - 12], edi
    jb sub_100C2F83
    cmp cmp dword ptr [ebp - 24], 0
    jne sub_100C2F7C
    pop pop edi
    pop pop esi
    xor xor eax, eax
L1:
    pop pop ebx
    leave leave
    ret ret
FUN_100c2e40 ENDP
END
