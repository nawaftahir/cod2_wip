.686
.MODEL FLAT, C
EXTRN sub_100C5D24:PROC
EXTRN sub_100C72D0:PROC
EXTRN sub_100C72D9:PROC
EXTRN sub_100C7300:PROC
EXTRN sub_100C733A:PROC
EXTRN sub_100C7377:PROC
EXTRN sub_100C7392:PROC
EXTRN sub_100C73A1:PROC
EXTRN sub_100C73B2:PROC
EXTRN sub_100C73BA:PROC
EXTRN sub_100C73C2:PROC
EXTRN sub_100C73D0:PROC
EXTRN sub_100C73E0:PROC
EXTRN sub_100C73F8:PROC
EXTRN sub_100C741D:PROC
EXTRN EXTRN g_1010F7A8:DWORD:DWORD
.CODE
FUN_100c7166 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 16
    and and dword ptr [ecx + 015Ch], 0
    mov mov edx, dword ptr [ecx + 0100h]
    mov mov eax, dword ptr [edx]
    push push ebx
    push push esi
    mov mov esi, eax
    and and esi, 0FFF00000h
    cmp cmp esi, 020500000h
    push push edi
    jne L2
    and and eax, 0FFFFFh
    mov mov esi, eax
    mov mov eax, dword ptr [edx + 8]
    mov mov edi, dword ptr [eax]
    lea lea edx, [eax + esi*4]
    mov mov dword ptr [ebp - 8], esi
    mov mov esi, dword ptr [ecx + 20]
    mov mov edi, dword ptr [esi + edi*4]
    mov mov edi, dword ptr [edi + 4]
    mov mov dword ptr [ebp - 4], edx
    mov mov edx, dword ptr [ecx + 16]
    mov mov ebx, dword ptr [edx + edi*4]
    mov mov edi, 0100h
    test test dword ptr [ebx + 4], edi
    je L0
    mov mov edx, eax
    mov mov eax, dword ptr [ebp - 4]
    jmp L1
    mov mov ebx, dword ptr [ebp - 4]
    mov mov ebx, dword ptr [ebx]
    mov mov ebx, dword ptr [esi + ebx*4]
    mov mov ebx, dword ptr [ebx + 4]
    mov mov edx, dword ptr [edx + ebx*4]
    test test dword ptr [edx + 4], edi
    je sub_100C733A
    mov mov edx, dword ptr [ebp - 4]
    and and dword ptr [ebp - 16], 0
    cmp cmp dword ptr [ebp - 8], 0
    mov mov dword ptr [ebp - 12], edx
    mov mov edi, 020000h
    jbe sub_100C72D0
    mov mov ebx, dword ptr [ebp - 16]
    mov mov dword ptr [ebp - 4], eax
    sub sub dword ptr [ebp - 4], edx
    mov mov eax, dword ptr [ebp - 4]
    fld fld qword ptr [g_1010F7A8]
    mov mov eax, dword ptr [eax + edx]
    mov mov eax, dword ptr [esi + eax*4]
    fld fld qword ptr [eax + 32]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jp sub_100C7377
    mov mov eax, dword ptr [edx]
    mov mov eax, dword ptr [esi + eax*4]
    mov mov eax, dword ptr [eax + 60]
L0:
    and and eax, 01F0000h
    cmp cmp eax, edi
    je sub_100C7300
    test test byte ptr [ecx + 110], 8
    jne sub_100C7392
    inc inc ebx
    add add edx, 4
    cmp cmp ebx, dword ptr [ebp - 8]
    jb sub_100C72D9
    push push 0
    push push 0
    mov mov eax, 040000h
    push push eax
    push push dword ptr [ebp - 12]
    jmp sub_100C73A1
    cmp cmp esi, 020400000h
    jne sub_100C73B2
    mov mov edx, dword ptr [edx + 8]
    and and eax, 0FFFFFh
    mov mov dword ptr [ebp - 16], eax
    lea lea eax, [edx + eax*4]
    mov mov dword ptr [ebp - 8], 0
    mov mov edi, 020000h
    jbe sub_100C73BA
    mov mov dword ptr [ebp - 4], eax
    sub sub dword ptr [ebp - 4], edx
    mov mov esi, edx
    mov mov eax, dword ptr [esi]
L2:
    mov mov ebx, dword ptr [ebp - 4]
    cmp cmp eax, dword ptr [ebx + esi]
    jne sub_100C73E0
    mov mov ebx, dword ptr [ecx + 20]
    mov mov eax, dword ptr [ebx + eax*4]
    mov mov eax, dword ptr [eax + 60]
    and and eax, 01F0000h
    cmp cmp eax, edi
    je sub_100C73D0
    test test byte ptr [ecx + 110], 8
    jne sub_100C73F8
    inc inc dword ptr [ebp - 8]
    mov mov eax, dword ptr [ebp - 8]
    add add esi, 4
    cmp cmp eax, dword ptr [ebp - 16]
    jb sub_100C73C2
    push push 0
    push push 0
    mov mov eax, 040000h
    push push eax
    push push edx
    push push edi
    push push eax
    call sub_100C5D24
    jmp sub_100C741D
    xor xor eax, eax
    inc inc eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret
FUN_100c7166 ENDP
END
