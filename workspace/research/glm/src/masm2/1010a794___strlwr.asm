.686
.MODEL FLAT, C
EXTRN sub_100F7CE1:PROC
EXTRN sub_100F88C0:PROC
EXTRN sub_100FB12A:PROC
EXTRN sub_100FB61C:PROC
EXTRN sub_100FC525:PROC
EXTRN sub_100FD1BD:PROC
EXTRN sub_100FD233:PROC
EXTRN sub_100FE98A:PROC
EXTRN sub_10106083:PROC
EXTRN sub_1010A8E1:PROC
EXTRN sub_1010A8E7:PROC
EXTRN sub_1010A8FC:PROC
EXTRN sub_1010A91C:PROC
EXTRN sub_1010A91E:PROC
EXTRN sub_1010A95F:PROC
EXTRN sub_1010A981:PROC
EXTRN EXTRN g_101A4684:DWORD:DWORD
.CODE
__strlwr PROC
    push push 24
    push push 0101825A8h
    call sub_100FB61C
    xor xor ebx, ebx
    mov mov dword ptr [ebp - 36], ebx
    call sub_100FB12A
    mov mov esi, dword ptr [eax + 100]
    mov mov dword ptr [ebp - 28], esi
    cmp cmp esi, dword ptr [g_101A4684]
    je L0
    call sub_100F7CE1
    mov mov esi, eax
    mov mov dword ptr [ebp - 28], esi
    mov mov eax, dword ptr [esi + 20]
    cmp cmp eax, ebx
    jne L1
    mov mov eax, dword ptr [ebp + 8]
    mov mov edx, eax
    cmp cmp byte ptr [eax], bl
    je sub_1010A8E1
    mov mov cl, byte ptr [edx]
    cmp cmp cl, 65
    jl L3
    cmp cmp cl, 90
    jg L4
    add add cl, 32
    mov mov byte ptr [edx], cl
    inc inc edx
    cmp cmp byte ptr [edx], bl
    jne L2
    jmp sub_1010A8FC
    push push 1
    push push dword ptr [esi + 4]
    push push ebx
    push push ebx
    push push -1
    push push dword ptr [ebp + 8]
    push push 0100h
    push push eax
    call sub_100FD1BD
    add add esp, 32
    mov mov dword ptr [ebp - 32], eax
    cmp cmp eax, ebx
    je sub_1010A91E
    mov mov dword ptr [ebp - 4], ebx
    add add eax, 3
    and and eax, -4
    call sub_100F88C0
    mov mov dword ptr [ebp - 24], esp
    mov mov edi, esp
    mov mov dword ptr [ebp - 40], edi
    or or dword ptr [ebp - 4], -1
L3:
    jmp sub_1010A8E7
    xor xor eax, eax
    inc inc eax
L4:
    ret ret
    mov mov esp, dword ptr [ebp - 24]
    call sub_10106083
    xor xor ebx, ebx
    xor xor edi, edi
    or or dword ptr [ebp - 4], -1
    mov mov esi, dword ptr [ebp - 28]
    cmp cmp edi, ebx
    jne sub_1010A91C
    push push dword ptr [ebp - 32]
    call sub_100FC525
    pop pop ecx
    mov mov edi, eax
    mov mov dword ptr [ebp - 36], 1
    cmp cmp edi, ebx
    je sub_1010A95F
    push push 1
    push push dword ptr [esi + 4]
    push push dword ptr [ebp - 32]
    push push edi
    push push -1
    push push dword ptr [ebp + 8]
    push push 0100h
    push push dword ptr [esi + 20]
    call sub_100FD233
    add add esp, 32
    test test eax, eax
    je sub_1010A981
    push push edi
    push push dword ptr [ebp + 8]
    call sub_100FE98A
    pop pop ecx
    pop pop ecx
__strlwr ENDP
END
