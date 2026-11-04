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
EXTRN sub_1010A8FC:PROC
EXTRN sub_1010A91E:PROC
EXTRN g_101A4684:DWORD
.CODE
__strlwr PROC
    push 24
    push 0101825A8h
    call sub_100FB61C
    xor ebx, ebx
    mov dword ptr [ebp - 36], ebx
    call sub_100FB12A
    mov esi, dword ptr [eax + 100]
    mov dword ptr [ebp - 28], esi
    cmp esi, dword ptr [g_101A4684]
    je L0
    call sub_100F7CE1
    mov esi, eax
    mov dword ptr [ebp - 28], esi
L0:
    mov eax, dword ptr [esi + 20]
    cmp eax, ebx
    jne L3
    mov eax, dword ptr [ebp + 8]
    mov edx, eax
    cmp byte ptr [eax], bl
    je sub_1010A8E1
L1:
    mov cl, byte ptr [edx]
    cmp cl, 65
    jl L2
    cmp cl, 90
    jg L2
    add cl, 32
    mov byte ptr [edx], cl
L2:
    inc edx
    cmp byte ptr [edx], bl
    jne L1
    jmp sub_1010A8FC
L3:
    push 1
    push dword ptr [esi + 4]
    push ebx
    push ebx
    push -1
    push dword ptr [ebp + 8]
    push 000000100h
    push eax
    call sub_100FD1BD
    add esp, 32
    mov dword ptr [ebp - 32], eax
    cmp eax, ebx
    je sub_1010A91E
    mov dword ptr [ebp - 4], ebx
    add eax, 3
    and eax, 0FFFFFFFCh
    call sub_100F88C0
    mov dword ptr [ebp - 24], esp
    mov edi, esp
    mov dword ptr [ebp - 40], edi
    or dword ptr [ebp - 4], 0FFFFFFFFh
    jmp L4
    xor eax, eax
    inc eax
    ret
    mov esp, dword ptr [ebp - 24]
    call sub_10106083
    xor ebx, ebx
    xor edi, edi
    or dword ptr [ebp - 4], 0FFFFFFFFh
    mov esi, dword ptr [ebp - 28]
L4:
    cmp edi, ebx
    jne L5
    push dword ptr [ebp - 32]
    call sub_100FC525
    pop ecx
    mov edi, eax
    mov dword ptr [ebp - 36], 1
    cmp edi, ebx
    je L6
L5:
    push 1
    push dword ptr [esi + 4]
    push dword ptr [ebp - 32]
    push edi
    push -1
    push dword ptr [ebp + 8]
    push 000000100h
    push dword ptr [esi + 20]
    call sub_100FD233
    add esp, 32
    test eax, eax
    je L6
    push edi
    push dword ptr [ebp + 8]
    call sub_100FE98A
    pop ecx
    pop ecx
__strlwr ENDP
END
