.686
.MODEL FLAT, C
EXTRN sub_10086249:PROC
EXTRN sub_100B9A11:PROC
EXTRN sub_100B9A42:PROC
EXTRN sub_100C04E8:PROC
EXTRN sub_100C051D:PROC
EXTRN sub_100C0526:PROC
EXTRN sub_100C052F:PROC
EXTRN sub_100C0550:PROC
EXTRN sub_100C055E:PROC
EXTRN sub_100C056A:PROC
EXTRN sub_100C05A9:PROC
EXTRN sub_100C05C4:PROC
EXTRN sub_100C05EE:PROC
EXTRN sub_100C05F2:PROC
EXTRN sub_100C05FA:PROC
.CODE
FUN_100c0372 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 0F8h
    push push ebx
    push push esi
    push push edi
    mov mov esi, ecx
    mov mov eax, dword ptr [esi + 0100h]
    mov mov edi, dword ptr [eax]
    xor xor ecx, ecx
    mov mov dword ptr [ebp - 4], ecx
    mov mov dword ptr [ebp - 24], ecx
    xor xor ebx, ebx
    mov mov dword ptr [ebp - 8], ecx
    inc inc ebx
    push push ebx
    and and edi, 0FFFFFh
    push push edi
    lea lea ecx, [ebp - 24]
    push push ecx
    lea lea ecx, [ebp - 0B8h]
    push push ecx
    lea lea ecx, [ebp - 4]
    push push ecx
    lea lea ecx, [ebp - 0F8h]
    push push ecx
    push push 0101191F8h
    push push eax
    mov mov ecx, esi
    mov mov dword ptr [ebp - 20], ebx
    mov mov dword ptr [ebp - 16], 2
    mov mov dword ptr [ebp - 12], 3
    call sub_100B9A11
    cmp cmp eax, ebx
    jne L0
    push push ebx
    push push edi
    lea lea eax, [ebp - 24]
    push push eax
    lea lea eax, [ebp - 0B8h]
    push push eax
    lea lea eax, [ebp - 4]
    push push eax
    lea lea eax, [ebp - 0F8h]
    push push eax
    push push 010119278h
    push push dword ptr [esi + 0100h]
    mov mov ecx, esi
    mov mov dword ptr [ebp - 8], ebx
    call sub_100B9A42
    test test eax, eax
    jne sub_100C056A
    and and dword ptr [ebp - 4], eax
    test test edi, edi
    jbe sub_100C04E8
    mov mov eax, dword ptr [ebp - 4]
    shl shl eax, 2
    mov mov edx, dword ptr [ebp + eax - 0B8h]
    mov mov ecx, dword ptr [ebp + eax - 0A8h]
    cmp cmp edx, ecx
    jne sub_100C051D
    cmp cmp ecx, dword ptr [ebp + eax - 098h]
    jne sub_100C0526
    cmp cmp edx, dword ptr [ebp + eax - 088h]
    jne sub_100C052F
    inc inc dword ptr [ebp - 4]
    cmp cmp dword ptr [ebp - 4], edi
    jb sub_100C04E8
    mov mov edx, dword ptr [esi + 0100h]
    mov mov ecx, edi
    xor xor eax, eax
    and and ecx, 0FFFFFh
    cmp cmp dword ptr [ebp - 8], eax
    je sub_100C0550
    or or ecx, 074400000h
    jmp sub_100C055E
    mov mov eax, ebx
    jmp sub_100C05C4
    or or ecx, 074500000h
    push push ecx
    fldz fldz
    push push ecx
    fstp fstp qword ptr [esp]
    push push eax
    mov mov dword ptr [edx], ecx
    push push eax
    push push dword ptr [esi + 120]
    mov mov ecx, esi
    call sub_10086249
    cmp cmp eax, -1
    mov mov dword ptr [ebp - 8], eax
    jne sub_100C05A9
    mov mov eax, 08007000Eh
    jmp sub_100C05EE
    xor xor ecx, ecx
    test test edi, edi
    jbe sub_100C05F2
    mov mov eax, edi
    shl shl eax, 2
    mov mov dword ptr [ebp - 4], eax
    mov mov eax, dword ptr [esi + 0100h]
    mov mov eax, dword ptr [eax + 8]
    mov mov edx, dword ptr [ebp + ecx*4 - 0B8h]
    mov mov ebx, dword ptr [ebp - 4]
    add add dword ptr [ebp - 4], 4
    mov mov dword ptr [eax + ecx*4], edx
    mov mov eax, dword ptr [esi + 0100h]
    mov mov eax, dword ptr [eax + 8]
    mov mov edx, dword ptr [ebp - 8]
    inc inc ecx
    cmp cmp ecx, edi
    mov mov dword ptr [ebx + eax], edx
    jb sub_100C05FA
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret
FUN_100c0372 ENDP
END
