.686
.MODEL FLAT, C
.CODE
_strpbrk PROC
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
    mov edi, edi
L2:
    mov al, byte ptr [esi]
    or al, al
    je L3
    add esi, 1
    bt dword ptr [esp], eax
    jae L2
    lea eax, [esi - 1]
L3:
    add esp, 32
    pop esi
    leave
    ret
_strpbrk ENDP
END
