.686
.MODEL FLAT, C
EXTRN sub_10102995:PROC
EXTRN sub_101029BA:PROC
EXTRN sub_10102CDC:PROC
EXTRN sub_10102D0F:PROC
EXTRN sub_10107524:PROC
.CODE
__umatherr PROC
    push ebp
    mov ebp, esp
    sub esp, 32
    xor eax, eax
L0:
    mov ecx, dword ptr [eax*8 + 0101A5128h]
    cmp ecx, dword ptr [ebp + 12]
    je L3
    inc eax
    cmp eax, 29
    jl L0
    xor eax, eax
L1:
    test eax, eax
    mov dword ptr [ebp - 28], eax
    je L4
    mov eax, dword ptr [ebp + 16]
    mov dword ptr [ebp - 24], eax
    mov eax, dword ptr [ebp + 20]
    mov dword ptr [ebp - 20], eax
    mov eax, dword ptr [ebp + 24]
    mov dword ptr [ebp - 16], eax
    mov eax, dword ptr [ebp + 28]
    push esi
    mov esi, dword ptr [ebp + 8]
    mov dword ptr [ebp - 12], eax
    mov eax, dword ptr [ebp + 32]
    mov dword ptr [ebp - 8], eax
    mov eax, dword ptr [ebp + 36]
    push 00000FFFFh
    push dword ptr [ebp + 40]
    mov dword ptr [ebp - 32], esi
    mov dword ptr [ebp - 4], eax
    call sub_10102CDC
    lea eax, [ebp - 32]
    push eax
    call sub_10107524
    add esp, 12
    test eax, eax
    jne L2
    push esi
    call sub_10102995
    pop ecx
L2:
    fld qword ptr [ebp - 8]
    pop esi
    leave
    ret
L3:
    mov eax, dword ptr [eax*8 + 0101A512Ch]
    jmp L1
L4:
    push 00000FFFFh
    push dword ptr [ebp + 40]
    call sub_10102D0F
    push dword ptr [ebp + 8]
    call sub_101029BA
    fld qword ptr [ebp + 32]
    add esp, 12
    leave
    ret
__umatherr ENDP
END
