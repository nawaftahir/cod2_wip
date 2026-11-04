.686
.MODEL FLAT, C
EXTRN sub_10065102:PROC
EXTRN sub_10065159:PROC
EXTRN sub_1008289E:PROC
EXTRN sub_10082970:PROC
EXTRN sub_100831F8:PROC
EXTRN sub_100995F9:PROC
EXTRN sub_10099B07:PROC
EXTRN sub_1009A3D0:PROC
EXTRN sub_1009A489:PROC
EXTRN sub_1009EEA7:PROC
EXTRN g_1019BE20:DWORD
.CODE
FUN_1009f6b5 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 24
    push esi
    push edi
    mov edi, dword ptr [ebp + 8]
    test edi, edi
    mov esi, ecx
    je L9
    mov eax, dword ptr [edi + 24]
    imul eax, dword ptr [edi + 20]
    cmp eax, 1
    jne L8
    push dword ptr [edi + 16]
    call sub_10099B07
    test eax, eax
    je L8
    push edi
    mov ecx, esi
    call sub_1009A489
    test eax, eax
    je L1
    lea eax, [ebp - 24]
    push eax
    push edi
    mov ecx, esi
    call sub_1009EEA7
    test eax, eax
    jl L1
    lea eax, [edi + 48]
    push eax
    lea eax, [ebp - 24]
    push eax
    lea eax, [ebp - 8]
    push eax
    mov ecx, esi
    call sub_1009A3D0
    test eax, eax
    jl L1
    fld qword ptr [ebp - 8]
    fld qword ptr [g_1019BE20]
    fucompp
    fnstsw ax
    test ah, 68
    mov eax, dword ptr [ebp + 12]
    jp L0
    mov eax, dword ptr [ebp + 16]
L0:
    push eax
    call sub_1008289E
    jmp L10
L1:
    push 36
    call sub_10065102
    test eax, eax
    je L2
    mov ecx, eax
    call sub_100831F8
    mov esi, eax
    jmp L3
L2:
    xor esi, esi
L3:
    test esi, esi
    je L9
    mov dword ptr [esi + 16], 2
    mov eax, dword ptr [edi]
    mov ecx, edi
    call dword ptr [eax + 4]
    test eax, eax
    mov dword ptr [esi + 24], eax
    je L9
    mov ecx, dword ptr [ebp + 12]
    test ecx, ecx
    je L4
    mov eax, dword ptr [ecx]
    call dword ptr [eax + 4]
    test eax, eax
    mov dword ptr [esi + 28], eax
    je L9
L4:
    mov ecx, dword ptr [ebp + 16]
    test ecx, ecx
    je L5
    mov eax, dword ptr [ecx]
    call dword ptr [eax + 4]
    test eax, eax
    mov dword ptr [esi + 32], eax
    je L9
L5:
    push 20
    call sub_10065159
    test eax, eax
    je L6
    push 010114734h
    push 0
    push esi
    mov ecx, eax
    call sub_10082970
    jmp L7
L6:
    xor eax, eax
L7:
    test eax, eax
    je L9
    jmp L10
L8:
    push 01011499Ch
    push 000000BCBh
    add edi, 48
    push edi
    push esi
    call sub_100995F9
    add esp, 16
L9:
    xor eax, eax
L10:
    pop edi
    pop esi
    leave
    ret 12
FUN_1009f6b5 ENDP
END
