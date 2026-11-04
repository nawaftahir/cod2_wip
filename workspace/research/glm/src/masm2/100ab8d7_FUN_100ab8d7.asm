.686
.MODEL FLAT, C
EXTRN sub_1008B0F3:PROC
EXTRN sub_100A6E33:PROC
EXTRN sub_100AB969:PROC
EXTRN sub_100AB97F:PROC
EXTRN sub_100AB98C:PROC
EXTRN sub_100AB991:PROC
.CODE
FUN_100ab8d7 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push ebx
    push push esi
    mov mov esi, dword ptr [ebp + 8]
    mov mov eax, dword ptr [esi]
    push push edi
    and and eax, 0FFF00000h
    push push eax
    mov mov ebx, ecx
    call sub_100A6E33
    xor xor edi, edi
    test test eax, eax
    je L1
    cmp cmp dword ptr [esi + 20], edi
    je sub_100AB969
    cmp cmp dword ptr [ebp + 12], 1
    jb L2
    push push 010117154h
    push push 01194h
    push push dword ptr [esi + 60]
    push push ebx
    call sub_1008B0F3
    add add esp, 16
    xor xor eax, eax
    jmp sub_100AB98C
    inc inc dword ptr [ebp + 12]
    cmp cmp dword ptr [esi + 20], edi
    jbe sub_100AB991
    mov mov eax, dword ptr [esi + 24]
    push push dword ptr [ebp + 12]
    mov mov ecx, dword ptr [ebx + 24]
    mov mov eax, dword ptr [eax + edi*4]
    push push dword ptr [ecx + eax*4]
    mov mov ecx, ebx
    call L0
L0:
    test test eax, eax
    je sub_100AB97F
    inc inc edi
L1:
    cmp cmp edi, dword ptr [esi + 20]
    jb sub_100AB991
    xor xor eax, eax
    inc inc eax
L2:
    pop pop edi
    pop pop esi
    pop pop ebx
    pop pop ebp
    ret ret 8
FUN_100ab8d7 ENDP
END
