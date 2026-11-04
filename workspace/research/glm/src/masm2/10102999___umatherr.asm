.686
.MODEL FLAT, C
EXTRN sub_10102995:PROC
EXTRN sub_10102A3D:PROC
EXTRN sub_10102A76:PROC
EXTRN sub_10102CDC:PROC
EXTRN sub_10102D0F:PROC
EXTRN sub_10107524:PROC
.CODE
__umatherr PROC
    push push ebp
    mov mov ebp, esp
    sub sub esp, 32
    xor xor eax, eax
    mov mov ecx, dword ptr [eax*8 + 0101A5128h]
    cmp cmp ecx, dword ptr [ebp + 12]
    je L2
    inc inc eax
    cmp cmp eax, 29
    jl L1
    xor xor eax, eax
    test test eax, eax
    mov mov dword ptr [ebp - 28], eax
L0:
    je sub_10102A3D
    mov mov eax, dword ptr [ebp + 16]
    mov mov dword ptr [ebp - 24], eax
    mov mov eax, dword ptr [ebp + 20]
    mov mov dword ptr [ebp - 20], eax
    mov mov eax, dword ptr [ebp + 24]
    mov mov dword ptr [ebp - 16], eax
    mov mov eax, dword ptr [ebp + 28]
    push push esi
    mov mov esi, dword ptr [ebp + 8]
    mov mov dword ptr [ebp - 12], eax
    mov mov eax, dword ptr [ebp + 32]
    mov mov dword ptr [ebp - 8], eax
    mov mov eax, dword ptr [ebp + 36]
    push push 0FFFFh
    push push dword ptr [ebp + 40]
    mov mov dword ptr [ebp - 32], esi
    mov mov dword ptr [ebp - 4], eax
    call sub_10102CDC
    lea lea eax, [ebp - 32]
    push push eax
    call sub_10107524
    add add esp, 12
    test test eax, eax
    jne sub_10102A76
    push push esi
    call sub_10102995
    pop pop ecx
    fld fld qword ptr [ebp - 8]
    pop pop esi
    leave leave
    ret ret
    mov mov eax, dword ptr [eax*8 + 0101A512Ch]
    jmp L3
    push push 0FFFFh
    push push dword ptr [ebp + 40]
    call sub_10102D0F
    push push dword ptr [ebp + 8]
    call L0
    fld fld qword ptr [ebp + 32]
    add add esp, 12
    leave leave
L3:
    ret ret
__umatherr ENDP
END
