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
EXTRN sub_1009F7E4:PROC
EXTRN sub_1009F7EB:PROC
EXTRN sub_1009F7F0:PROC
EXTRN sub_1009F7F4:PROC
EXTRN sub_1009F7FD:PROC
EXTRN sub_1009F84B:PROC
EXTRN sub_1009F863:PROC
EXTRN sub_1009F871:PROC
EXTRN sub_1009F87D:PROC
EXTRN sub_1009F892:PROC
EXTRN sub_1009F8A4:PROC
EXTRN sub_1009F8A5:PROC
EXTRN sub_1009F8B7:PROC
EXTRN sub_1009F8B8:PROC
EXTRN sub_1009F8DA:PROC
EXTRN sub_1009F8DE:PROC
EXTRN EXTRN g_1019BE20:DWORD:DWORD
.CODE
FUN_1009f6b5 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 24
    push push esi
    push push edi
    mov mov edi, dword ptr [ebp + 8]
    test test edi, edi
    mov mov esi, ecx
    je sub_1009F7EB
    mov mov eax, dword ptr [edi + 24]
    imul imul eax, dword ptr [edi + 20]
    cmp cmp eax, 1
    jne sub_1009F7E4
    push push dword ptr [edi + 16]
    call sub_10099B07
    test test eax, eax
    je sub_1009F7F4
    push push edi
    mov mov ecx, esi
    call sub_1009A489
    test test eax, eax
    je L0
    lea lea eax, [ebp - 24]
    push push eax
    push push edi
    mov mov ecx, esi
    call sub_1009EEA7
    test test eax, eax
    jl L1
    lea lea eax, [edi + 48]
    push push eax
    lea lea eax, [ebp - 24]
    push push eax
    lea lea eax, [ebp - 8]
    push push eax
    mov mov ecx, esi
    call sub_1009A3D0
    test test eax, eax
    jl L2
    fld fld qword ptr [ebp - 8]
    fld fld qword ptr [g_1019BE20]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    mov mov eax, dword ptr [ebp + 12]
    jp L3
    mov mov eax, dword ptr [ebp + 16]
    push push eax
    call sub_1008289E
    jmp sub_1009F863
    push push 36
    call sub_10065102
    test test eax, eax
    je sub_1009F7F0
    mov mov ecx, eax
    call sub_100831F8
    mov mov esi, eax
    jmp sub_1009F7FD
    xor xor esi, esi
    test test esi, esi
    je sub_1009F87D
    mov mov dword ptr [esi + 16], 2
    mov mov eax, dword ptr [edi]
    mov mov ecx, edi
    call call dword ptr [eax + 4]
    test test eax, eax
    mov mov dword ptr [esi + 24], eax
    je sub_1009F892
    mov mov ecx, dword ptr [ebp + 12]
    test test ecx, ecx
    je sub_1009F84B
    mov mov eax, dword ptr [ecx]
    call call dword ptr [eax + 4]
    test test eax, eax
    mov mov dword ptr [esi + 28], eax
    je sub_1009F8A5
    mov mov ecx, dword ptr [ebp + 16]
    test test ecx, ecx
    je sub_1009F871
    mov mov eax, dword ptr [ecx]
    call call dword ptr [eax + 4]
    test test eax, eax
    mov mov dword ptr [esi + 32], eax
    je sub_1009F8B8
    push push 20
    call sub_10065159
    test test eax, eax
    je sub_1009F8A4
    push push 010114734h
    push push 0
    push push esi
L2:
    mov mov ecx, eax
    call sub_10082970
    jmp sub_1009F8B7
    xor xor eax, eax
    test test eax, eax
    je sub_1009F8DA
    jmp sub_1009F8DE
    push push 01011499Ch
    push push 0BCBh
    add add edi, 48
    push push edi
    push push esi
    call sub_100995F9
    add add esp, 16
    xor xor eax, eax
    pop pop edi
    pop pop esi
    leave leave
    ret ret 12
FUN_1009f6b5 ENDP
END
