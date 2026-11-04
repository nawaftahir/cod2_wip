.686
.MODEL FLAT, C
EXTRN sub_100C9B7C:PROC
EXTRN sub_100C9BB0:PROC
.CODE
FUN_100b38fe PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 52
    push ebx
    push esi
    push edi
    mov edi, ecx
    mov eax, dword ptr [edi + 000000100h]
    mov ecx, dword ptr [eax + 12]
    mov esi, dword ptr [eax]
    mov ebx, dword ptr [eax + 8]
    mov edx, dword ptr [ebx]
    mov dword ptr [ebp - 4], ecx
    mov ecx, dword ptr [eax + 16]
    and esi, 0000FFFFFh
    lea eax, [ebx + esi*4]
    mov dword ptr [ebp - 12], eax
    mov eax, dword ptr [edi + 20]
    mov edx, dword ptr [eax + edx*4]
    mov dword ptr [ebp - 8], edx
    mov edx, dword ptr [ebp - 12]
    mov edx, dword ptr [edx]
    mov dword ptr [ebp - 16], ecx
    mov ecx, dword ptr [ecx]
    mov ecx, dword ptr [eax + ecx*4]
    mov eax, dword ptr [eax + edx*4]
    mov edx, dword ptr [ebp - 8]
    mov dword ptr [ebp - 20], eax
    mov eax, dword ptr [ecx + 4]
    cmp eax, dword ptr [edx + 4]
    jne L0
    mov eax, dword ptr [ecx + 12]
    cmp eax, dword ptr [edx + 12]
    je L1
L0:
    mov eax, dword ptr [ecx + 4]
    mov edx, dword ptr [ebp - 20]
    cmp eax, dword ptr [edx + 4]
    jne L5
    mov eax, dword ptr [ecx + 12]
    cmp eax, dword ptr [edx + 12]
    jne L5
L1:
    mov eax, dword ptr [edi]
    push 0
    push 0
    push 4
    lea ecx, [ebp - 52]
    push ecx
    push dword ptr [edi + 0000000FCh]
    mov ecx, edi
    call dword ptr [eax + 0x80]
    xor ecx, ecx
    cmp eax, ecx
    jl L7
    cmp dword ptr [ebp - 4], ecx
    mov dword ptr [ebp - 8], ecx
    jbe L4
    mov ecx, dword ptr [ebp - 16]
    mov eax, dword ptr [edi + 20]
    lea edx, [ebp - 36]
    sub ecx, edx
    mov dword ptr [ebp - 20], ecx
    jmp L3
L2:
    mov ecx, dword ptr [ebp - 20]
L3:
    mov edx, dword ptr [ebp - 8]
    shl edx, 2
    add ecx, edx
    mov ecx, dword ptr [ebp + ecx - 36]
    mov ecx, dword ptr [eax + ecx*4]
    mov ecx, dword ptr [ecx + 16]
    mov ecx, dword ptr [ebp + ecx*4 - 52]
    inc dword ptr [ebp - 8]
    mov dword ptr [ebp + edx - 36], ecx
    mov ecx, dword ptr [ebp - 8]
    cmp ecx, dword ptr [ebp - 4]
    jb L2
    xor ecx, ecx
L4:
    push ecx
    push ecx
    push 001000000h
    push ecx
    push esi
    push ecx
    push dword ptr [ebp - 12]
    lea eax, [ebp - 36]
    push ebx
    push dword ptr [ebp - 4]
    mov ecx, edi
    push eax
    push 2
    call sub_100C9B7C
    xor eax, eax
    push eax
    push eax
    push eax
    push eax
    push esi
    push ebx
    push dword ptr [ebp - 12]
    lea eax, [ebp - 36]
    push eax
    push dword ptr [ebp - 4]
    push dword ptr [ebp - 16]
    push 88
    jmp L6
L5:
    xor eax, eax
    push eax
    push eax
    push eax
    push eax
    push esi
    push eax
    push dword ptr [ebp - 12]
    push ebx
    push dword ptr [ebp - 4]
    push dword ptr [ebp - 16]
    push 10
L6:
    mov ecx, edi
    call sub_100C9BB0
L7:
    pop edi
    pop esi
    pop ebx
    leave
    ret
FUN_100b38fe ENDP
END
