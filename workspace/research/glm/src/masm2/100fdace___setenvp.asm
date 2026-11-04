.686
.MODEL FLAT, C
EXTRN sub_100F8567:PROC
EXTRN sub_100F858C:PROC
EXTRN sub_100FA22B:PROC
EXTRN sub_100FA264:PROC
EXTRN sub_100FC4A7:PROC
EXTRN sub_100FC4D7:PROC
EXTRN sub_100FDBB4:PROC
EXTRN sub_100FDBB8:PROC
EXTRN sub_100FDBC1:PROC
EXTRN sub_100FDBD0:PROC
EXTRN sub_100FDBF9:PROC
EXTRN sub_100FDC40:PROC
EXTRN sub_100FE911:PROC
EXTRN sub_101071F0:PROC
EXTRN EXTRN g_101ADD80:DWORD:DWORD
EXTRN EXTRN g_101AE02C:DWORD:DWORD
EXTRN EXTRN g_1076ADA0:DWORD:DWORD
EXTRN EXTRN g_1076ADAC:DWORD:DWORD
.CODE
__setenvp PROC
    push push ebx
    xor xor ebx, ebx
    cmp cmp dword ptr [g_1076ADAC], ebx
    push push esi
    push push edi
    jne L0
    call sub_101071F0
    mov mov esi, dword ptr [g_101ADD80]
    xor xor edi, edi
    cmp cmp esi, ebx
    jne L2
    jmp L4
    cmp cmp al, 61
    je L1
    inc inc edi
    push push esi
    call sub_100FA22B
    pop pop ecx
    lea lea esi, [esi + eax + 1]
    mov mov al, byte ptr [esi]
    cmp cmp al, bl
    jne L3
    lea lea eax, [edi*4 + 4]
    push push eax
    call sub_100FC4A7
    mov mov edi, eax
    cmp cmp edi, ebx
    pop pop ecx
    mov mov dword ptr [g_101AE02C], edi
L2:
    jne L5
    or or eax, -1
    jmp sub_100FDBD0
    mov mov esi, dword ptr [g_101ADD80]
    push push ebp
    jmp sub_100FDBB4
    push push esi
    call sub_100FA264
    mov mov ebp, eax
    inc inc ebp
    cmp cmp byte ptr [esi], 61
    pop pop ecx
    je sub_100FDBC1
    push push ebp
    call sub_100FC4D7
    cmp cmp eax, ebx
    pop pop ecx
    mov mov dword ptr [edi], eax
    je sub_100FDBF9
    push push esi
    push push eax
    call sub_100FE911
    pop pop ecx
    pop pop ecx
    add add edi, 4
    add add esi, ebp
    cmp cmp byte ptr [esi], bl
    jne sub_100FDBB8
    push push dword ptr [g_101ADD80]
    call sub_100F8567
    mov mov dword ptr [g_101ADD80], ebx
    mov mov dword ptr [edi], ebx
    mov mov dword ptr [g_1076ADA0], 1
    xor xor eax, eax
    pop pop ecx
    pop pop ebp
    pop pop edi
    pop pop esi
    pop pop ebx
    ret ret
    push push dword ptr [g_101AE02C]
    call sub_100F858C
    mov mov dword ptr [g_101AE02C], ebx
    or or eax, -1
    jmp sub_100FDC40
__setenvp ENDP
END
