.686
.MODEL FLAT, C
EXTRN sub_100C9AF3:PROC
EXTRN sub_100C9B1A:PROC
.CODE
FUN_100caeda PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 20
    push ebx
    push esi
    mov esi, ecx
    mov eax, dword ptr [esi + 000000100h]
    mov ecx, dword ptr [eax + 16]
    mov edx, dword ptr [esi + 20]
    push edi
    mov edi, dword ptr [eax]
    mov eax, dword ptr [ecx]
    mov eax, dword ptr [edx + eax*4]
    mov edx, dword ptr [esi + 000000088h]
    and edi, 0000FFFFFh
    xor ebx, ebx
    cmp edx, dword ptr [eax + 4]
    mov dword ptr [ebp - 4], ecx
    je L0
    mov eax, dword ptr [esi]
    push ebx
    push ebx
    push edi
    lea ecx, [ebp - 20]
    push ecx
    push dword ptr [esi + 0000000FCh]
    mov ecx, esi
    call dword ptr [eax + 0x80]
    cmp eax, ebx
    jl L2
    lea eax, [ebp - 20]
    mov dword ptr [ebp - 4], eax
    mov ecx, eax
L0:
    mov eax, dword ptr [esi + 000000100h]
    push ebx
    push ebx
    push ebx
    push ebx
    push edi
    push ebx
    push ebx
    push dword ptr [eax + 8]
    push edi
    push ecx
    push 36
    mov ecx, esi
    call sub_100C9AF3
    cmp eax, ebx
    jl L2
    lea eax, [ebp - 20]
    cmp dword ptr [ebp - 4], eax
    jne L1
    push ebx
    push ebx
    push ebx
    push ebx
    push edi
    push ebx
    push ebx
    push eax
    mov eax, dword ptr [esi + 000000100h]
    push edi
    push dword ptr [eax + 16]
    mov ecx, esi
    push 1
    call sub_100C9B1A
    cmp eax, ebx
    jl L2
L1:
    xor eax, eax
L2:
    pop edi
    pop esi
    pop ebx
    leave
    ret
FUN_100caeda ENDP
END
