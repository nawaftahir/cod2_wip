.686
.MODEL FLAT, C
EXTRN sub_10065090:PROC
EXTRN sub_1006510D:PROC
EXTRN sub_100828D9:PROC
EXTRN sub_10082923:PROC
EXTRN sub_1008328E:PROC
EXTRN sub_1009A5E2:PROC
EXTRN sub_1009C146:PROC
EXTRN sub_1009C180:PROC
EXTRN sub_1009C197:PROC
EXTRN sub_1009C1A4:PROC
EXTRN sub_1009C1A5:PROC
EXTRN sub_1009C1B1:PROC
EXTRN sub_1009C1B3:PROC
EXTRN sub_1009C1B7:PROC
EXTRN sub_1009C1BC:PROC
EXTRN sub_1009C1EE:PROC
EXTRN sub_1009C202:PROC
.CODE
FUN_1009c04f PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push ecx
    push push ecx
    push push ebx
    push push esi
    mov mov esi, dword ptr [ebp + 8]
    push push edi
    mov mov dword ptr [ebp - 8], ecx
    jmp L0
    mov mov esi, dword ptr [esi + 8]
    cmp cmp dword ptr [esi + 4], 3
    jne L1
    push push 80
    call sub_10065090
    xor xor edi, edi
    cmp cmp eax, edi
    je L2
    add add esi, 16
    push push esi
    push push 1
    push push edi
    push push edi
    push push edi
    push push edi
    mov mov ecx, eax
    call sub_1008328E
    mov mov ebx, eax
    mov mov dword ptr [ebp - 4], ebx
    jmp L3
    mov mov dword ptr [ebp - 4], edi
    mov mov ebx, edi
    cmp cmp ebx, edi
    je sub_1009C180
    mov mov ecx, dword ptr [ebp + 12]
    cmp cmp ecx, edi
    je L4
    mov mov eax, dword ptr [ecx]
    call call dword ptr [eax + 4]
    cmp cmp eax, edi
    mov mov dword ptr [ebx + 32], eax
    je sub_1009C197
    mov mov eax, dword ptr [ebx + 32]
    cmp cmp eax, edi
    lea lea esi, [ebx + 16]
    mov mov dword ptr [ebp + 8], eax
    jne sub_1009C146
    mov mov ecx, dword ptr [ebp - 8]
    push push ebx
    call sub_1009A5E2
    mov mov eax, ebx
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 8
    mov mov eax, dword ptr [ebp + 8]
    mov mov ebx, dword ptr [eax + 8]
    cmp cmp ebx, edi
    je sub_1009C1B1
    cmp cmp dword ptr [ebx + 4], 13
    jne sub_1009C1B7
    cmp cmp dword ptr [ebx + 16], edi
    je sub_1009C1BC
    push push 20
    call sub_1006510D
    cmp cmp eax, edi
    je sub_1009C1A5
    push push 010114AF0h
    push push edi
    push push edi
    mov mov ecx, eax
    call sub_10082923
    jmp sub_1009C1B7
    xor xor eax, eax
    cmp cmp eax, edi
    mov mov dword ptr [esi], eax
    je sub_1009C1EE
    push push dword ptr [ebx + 16]
    call sub_100828D9
    mov mov ecx, dword ptr [esi]
    mov mov dword ptr [ecx + 8], eax
    mov mov esi, dword ptr [esi]
    cmp cmp dword ptr [esi + 8], edi
    je sub_1009C202
    mov mov eax, dword ptr [ebp + 8]
    add add esi, 12
    mov mov eax, dword ptr [eax + 12]
    cmp cmp eax, edi
    mov mov dword ptr [ebp + 8], eax
    jne sub_1009C1B1
    mov mov ebx, dword ptr [ebp - 4]
    jmp sub_1009C1A4
    xor xor eax, eax
    jmp sub_1009C1B3
FUN_1009c04f ENDP
END
