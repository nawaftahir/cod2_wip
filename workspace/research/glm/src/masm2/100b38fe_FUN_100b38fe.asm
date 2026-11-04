.686
.MODEL FLAT, C
EXTRN sub_100B3A6B:PROC
EXTRN sub_100B3A81:PROC
EXTRN sub_100B3A82:PROC
EXTRN sub_100B3A8D:PROC
EXTRN sub_100B3A90:PROC
EXTRN sub_100B3ACC:PROC
EXTRN sub_100B3B3E:PROC
EXTRN sub_100C9B7C:PROC
EXTRN sub_100C9BB0:PROC
.CODE
FUN_100b38fe PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 52
    push push ebx
    push push esi
    push push edi
    mov mov edi, ecx
    mov mov eax, dword ptr [edi + 0100h]
    mov mov ecx, dword ptr [eax + 12]
    mov mov esi, dword ptr [eax]
    mov mov ebx, dword ptr [eax + 8]
    mov mov edx, dword ptr [ebx]
    mov mov dword ptr [ebp - 4], ecx
    mov mov ecx, dword ptr [eax + 16]
    and and esi, 0FFFFFh
    lea lea eax, [ebx + esi*4]
    mov mov dword ptr [ebp - 12], eax
    mov mov eax, dword ptr [edi + 20]
    mov mov edx, dword ptr [eax + edx*4]
    mov mov dword ptr [ebp - 8], edx
    mov mov edx, dword ptr [ebp - 12]
    mov mov edx, dword ptr [edx]
    mov mov dword ptr [ebp - 16], ecx
    mov mov ecx, dword ptr [ecx]
    mov mov ecx, dword ptr [eax + ecx*4]
    mov mov eax, dword ptr [eax + edx*4]
    mov mov edx, dword ptr [ebp - 8]
    mov mov dword ptr [ebp - 20], eax
    mov mov eax, dword ptr [ecx + 4]
    cmp cmp eax, dword ptr [edx + 4]
    jne L0
    mov mov eax, dword ptr [ecx + 12]
    cmp cmp eax, dword ptr [edx + 12]
    je L1
    mov mov eax, dword ptr [ecx + 4]
    mov mov edx, dword ptr [ebp - 20]
    cmp cmp eax, dword ptr [edx + 4]
    jne sub_100B3A81
    mov mov eax, dword ptr [ecx + 12]
    cmp cmp eax, dword ptr [edx + 12]
    jne sub_100B3A8D
    mov mov eax, dword ptr [edi]
    push push 0
    push push 0
    push push 4
    lea lea ecx, [ebp - 52]
    push push ecx
    push push dword ptr [edi + 0FCh]
    mov mov ecx, edi
    call call dword ptr [eax + 080h]
    xor xor ecx, ecx
    cmp cmp eax, ecx
    jl sub_100B3ACC
    cmp cmp dword ptr [ebp - 4], ecx
    mov mov dword ptr [ebp - 8], ecx
    jbe sub_100B3A82
    mov mov ecx, dword ptr [ebp - 16]
    mov mov eax, dword ptr [edi + 20]
    lea lea edx, [ebp - 36]
    sub sub ecx, edx
    mov mov dword ptr [ebp - 20], ecx
    jmp sub_100B3A6B
    mov mov ecx, dword ptr [ebp - 20]
    mov mov edx, dword ptr [ebp - 8]
    shl shl edx, 2
    add add ecx, edx
    mov mov ecx, dword ptr [ebp + ecx - 36]
    mov mov ecx, dword ptr [eax + ecx*4]
    mov mov ecx, dword ptr [ecx + 16]
    mov mov ecx, dword ptr [ebp + ecx*4 - 52]
    inc inc dword ptr [ebp - 8]
    mov mov dword ptr [ebp + edx - 36], ecx
    mov mov ecx, dword ptr [ebp - 8]
    cmp cmp ecx, dword ptr [ebp - 4]
    jb sub_100B3A90
    xor xor ecx, ecx
    push push ecx
    push push ecx
    push push 01000000h
    push push ecx
    push push esi
    push push ecx
    push push dword ptr [ebp - 12]
    lea lea eax, [ebp - 36]
    push push ebx
    push push dword ptr [ebp - 4]
    mov mov ecx, edi
    push push eax
    push push 2
    call sub_100C9B7C
    xor xor eax, eax
    push push eax
    push push eax
    push push eax
    push push eax
    push push esi
    push push ebx
    push push dword ptr [ebp - 12]
    lea lea eax, [ebp - 36]
    push push eax
    push push dword ptr [ebp - 4]
    push push dword ptr [ebp - 16]
    push push 88
    jmp sub_100B3B3E
    xor xor eax, eax
    push push eax
    push push eax
    push push eax
    push push eax
    push push esi
    push push eax
    push push dword ptr [ebp - 12]
    push push ebx
    push push dword ptr [ebp - 4]
    push push dword ptr [ebp - 16]
    push push 10
    mov mov ecx, edi
    call sub_100C9BB0
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret
FUN_100b38fe ENDP
END
