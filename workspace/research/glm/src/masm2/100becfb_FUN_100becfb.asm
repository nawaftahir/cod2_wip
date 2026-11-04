.686
.MODEL FLAT, C
EXTRN sub_10086249:PROC
EXTRN sub_100B9A11:PROC
EXTRN sub_100B9A42:PROC
EXTRN sub_100BEE71:PROC
EXTRN sub_100BEEA6:PROC
EXTRN sub_100BEEAF:PROC
EXTRN sub_100BEEB8:PROC
EXTRN sub_100BEED9:PROC
EXTRN sub_100BEEE7:PROC
EXTRN sub_100BEEF3:PROC
EXTRN sub_100BEF32:PROC
EXTRN sub_100BEF4D:PROC
EXTRN sub_100BEF77:PROC
EXTRN sub_100BEF7B:PROC
EXTRN sub_100BEF83:PROC
.CODE
FUN_100becfb PROC
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
    push push 010118D78h
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
    push push 010118DF8h
    push push dword ptr [esi + 0100h]
    mov mov ecx, esi
    mov mov dword ptr [ebp - 8], ebx
    call sub_100B9A42
    test test eax, eax
    jne sub_100BEEF3
    and and dword ptr [ebp - 4], eax
    test test edi, edi
    jbe sub_100BEE71
    mov mov eax, dword ptr [ebp - 4]
    shl shl eax, 2
    mov mov edx, dword ptr [ebp + eax - 0B8h]
    mov mov ecx, dword ptr [ebp + eax - 0A8h]
    cmp cmp edx, ecx
    jne sub_100BEEA6
    cmp cmp ecx, dword ptr [ebp + eax - 098h]
    jne sub_100BEEAF
    cmp cmp edx, dword ptr [ebp + eax - 088h]
    jne sub_100BEEB8
    inc inc dword ptr [ebp - 4]
    cmp cmp dword ptr [ebp - 4], edi
    jb sub_100BEE71
    mov mov edx, dword ptr [esi + 0100h]
    mov mov ecx, edi
    xor xor eax, eax
    and and ecx, 0FFFFFh
    cmp cmp dword ptr [ebp - 8], eax
    je sub_100BEED9
    or or ecx, 073700000h
    jmp sub_100BEEE7
    mov mov eax, ebx
    jmp sub_100BEF4D
    or or ecx, 073800000h
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
    jne sub_100BEF32
    mov mov eax, 08007000Eh
    jmp sub_100BEF77
    xor xor ecx, ecx
    test test edi, edi
    jbe sub_100BEF7B
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
    jb sub_100BEF83
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret
FUN_100becfb ENDP
END
