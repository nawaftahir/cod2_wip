.686
.MODEL FLAT, C
EXTRN sub_100C173B:PROC
EXTRN sub_100C175D:PROC
EXTRN sub_100C1778:PROC
EXTRN sub_100C1793:PROC
EXTRN sub_100C17AE:PROC
EXTRN sub_100C17C9:PROC
EXTRN sub_100C17E8:PROC
EXTRN sub_100C1807:PROC
EXTRN sub_100C3AAE:PROC
EXTRN sub_100C781D:PROC
EXTRN sub_100C7838:PROC
EXTRN sub_100C7844:PROC
EXTRN sub_100C7853:PROC
EXTRN sub_100C786E:PROC
EXTRN sub_100C7871:PROC
EXTRN sub_100C788C:PROC
EXTRN sub_100C788D:PROC
EXTRN sub_100C78AC:PROC
EXTRN sub_100C78CF:PROC
EXTRN sub_100C7992:PROC
.CODE
FUN_100c768d PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 40
    mov mov eax, dword ptr [ecx + 0100h]
    mov mov eax, dword ptr [eax]
    push push esi
    push push edi
    mov mov edi, eax
    mov mov edx, 0FFFFFh
    and and eax, 0FFF00000h
    and and edi, edx
    cmp cmp eax, 070300000h
    mov mov dword ptr [ebp - 8], ecx
    je L0
    xor xor eax, eax
    inc inc eax
    jmp sub_100C7844
    mov mov eax, dword ptr [ecx + 0FCh]
    push push ebx
    mov mov ebx, dword ptr [ecx + 0100h]
    mov mov dword ptr [ebp - 4], eax
    push push 2
    lea lea eax, [ebp - 24]
    push push eax
    mov mov eax, edi
    and and eax, edx
    push push ebx
    or or eax, 020500000h
    push push eax
    call sub_100C3AAE
    mov mov ecx, dword ptr [ebp - 16]
    test test ecx, ecx
    je sub_100C7871
    and and dword ptr [ebp - 12], 0
    test test edi, edi
    jbe L1
    mov mov eax, dword ptr [ebx + 8]
    mov mov edx, dword ptr [ecx + 16]
    lea lea eax, [eax + edi*8]
    mov mov esi, dword ptr [eax]
    cmp cmp esi, dword ptr [edx]
    jne sub_100C788C
    inc inc dword ptr [ebp - 12]
    add add eax, 4
    add add edx, 4
    cmp cmp dword ptr [ebp - 12], edi
    jb L2
    push push dword ptr [ebp - 4]
    mov mov esi, dword ptr [ebx + 8]
    push push ebx
    mov mov eax, edi
    mov mov edi, dword ptr [ecx + 8]
    shl shl eax, 2
    push push ecx
    mov mov ecx, dword ptr [ebp - 8]
    lea lea edx, [eax + esi]
    add add eax, edi
    push push eax
    push push edi
    push push edx
    push push esi
    mov mov dword ptr [ebp - 36], edx
    mov mov dword ptr [ebp - 28], eax
    call sub_100C173B
    test test eax, eax
    jne L3
    xor xor eax, eax
    jmp sub_100C78CF
    push push dword ptr [ebp - 4]
    mov mov ecx, dword ptr [ebp - 8]
    push push ebx
    push push dword ptr [ebp - 16]
    push push dword ptr [ebp - 28]
    push push edi
    push push esi
    push push dword ptr [ebp - 36]
    call sub_100C175D
    test test eax, eax
    je sub_100C781D
    push push dword ptr [ebp - 4]
    mov mov ecx, dword ptr [ebp - 8]
    push push ebx
    push push dword ptr [ebp - 16]
    push push edi
    push push dword ptr [ebp - 28]
    push push dword ptr [ebp - 36]
    push push esi
    call sub_100C1778
    test test eax, eax
    je sub_100C7838
    push push dword ptr [ebp - 4]
L1:
    mov mov ecx, dword ptr [ebp - 8]
    push push ebx
    push push dword ptr [ebp - 16]
    push push edi
    push push dword ptr [ebp - 28]
    push push esi
    push push dword ptr [ebp - 36]
    call sub_100C1793
    test test eax, eax
    je sub_100C7853
    push push dword ptr [ebp - 4]
    mov mov ecx, dword ptr [ebp - 8]
    push push ebx
    push push dword ptr [ebp - 16]
    push push dword ptr [ebp - 36]
    push push esi
    push push dword ptr [ebp - 28]
    push push edi
    call sub_100C17AE
    test test eax, eax
    je sub_100C786E
    push push dword ptr [ebp - 4]
    mov mov ecx, dword ptr [ebp - 8]
    push push ebx
    push push dword ptr [ebp - 16]
    push push dword ptr [ebp - 36]
    push push esi
    push push edi
    push push dword ptr [ebp - 28]
    call sub_100C17C9
    test test eax, eax
    je sub_100C788D
    push push dword ptr [ebp - 4]
    mov mov ecx, dword ptr [ebp - 8]
    push push ebx
    push push dword ptr [ebp - 16]
    push push esi
    push push dword ptr [ebp - 36]
    push push dword ptr [ebp - 28]
    push push edi
    call sub_100C17E8
    test test eax, eax
    je sub_100C78AC
    push push dword ptr [ebp - 4]
    mov mov ecx, dword ptr [ebp - 8]
    push push ebx
    push push dword ptr [ebp - 16]
    push push esi
    push push dword ptr [ebp - 36]
    push push edi
    push push dword ptr [ebp - 28]
    call sub_100C1807
    jmp sub_100C7992
    xor xor eax, eax
    inc inc eax
    pop pop ebx
    pop pop edi
    pop pop esi
    leave leave
    ret ret
FUN_100c768d ENDP
END
