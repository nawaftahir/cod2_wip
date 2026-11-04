.686
.MODEL FLAT, C
.CODE
_strcspn PROC
    push ebp
    mov ebp, esp
    push esi
    xor eax, eax
    push eax
    push eax
    push eax
    push eax
    push eax
    push eax
    push eax
    push eax
    mov edx, dword ptr [ebp + 12]
    lea ecx, [ecx]
L0:
    mov al, byte ptr [edx]
    or al, al
    je L1
    add edx, 1
    bts dword ptr [esp], eax
    jmp L0
L1:
    mov esi, dword ptr [ebp + 8]
    or ecx, 0FFFFFFFFh
    lea ecx, [ecx]
L2:
    add ecx, 1
    mov al, byte ptr [esi]
    or al, al
    je L3
    add esi, 1
    bt dword ptr [esp], eax
    jae L2
L3:
    mov eax, ecx
    add esp, 32
    pop esi
    leave
    ret
_strcspn ENDP
END
